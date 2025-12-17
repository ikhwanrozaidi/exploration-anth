import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../login/domain/usecases/logout_usecase.dart';
import '../../domain/usecases/get_user_profile_usecase.dart';
import '../../domain/usecases/update_user_profile_usecase.dart';
import 'profile_event.dart';
import 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserProfileUseCase _getUserProfileUseCase;
  final LogoutUseCase _logoutUseCase;
  final UpdateUserProfileUseCase _updateUserProfileUseCase;

  ProfileBloc(
    this._getUserProfileUseCase,
    this._logoutUseCase,
    this._updateUserProfileUseCase,
  ) : super(const ProfileInitial()) {
    on<LoadUserProfile>(_onLoadUserProfile);
    on<LoadUserSettings>(_onLoadUserSettings);
    on<RefreshUserSettings>(_onRefreshUserSettings);
    on<LogoutUser>(_onLogoutUser);

    on<UpdateUserProfile>(_onUpdateUserProfile);
  }

  Future<void> _onLoadUserProfile(
    LoadUserProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileLoading());

    print('🔵 [ProfileBloc] Loading user profile...');

    final result = await _getUserProfileUseCase();

    result.fold(
      (failure) {
        print('🔴 [ProfileBloc] Failed to load profile: ${failure.message}');
        emit(ProfileError(_mapFailureToMessage(failure)));
      },
      (user) {
        if (user == null) {
          print('🔴 [ProfileBloc] No user found in database');
          emit(
            const ProfileError('No user profile found. Please login again.'),
          );
        } else {
          print('🟢 [ProfileBloc] Profile loaded - ${user.email}');
          print(
            '🟢 [ProfileBloc] Full name: ${user.userDetail?.fullName ?? "No name"}',
          );
          emit(ProfileLoaded(user));
        }
      },
    );
  }

  Future<void> _onLoadUserSettings(
    LoadUserSettings event,
    Emitter<ProfileState> emit,
  ) async {
    await _onLoadUserProfile(const LoadUserProfile(), emit);
  }

  Future<void> _onRefreshUserSettings(
    RefreshUserSettings event,
    Emitter<ProfileState> emit,
  ) async {
    await _onLoadUserProfile(const LoadUserProfile(), emit);
  }

  Future<void> _onLogoutUser(
    LogoutUser event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileLoading());

    print('🔵 [ProfileBloc] Logging out...');

    final result = await _logoutUseCase();

    result.fold(
      (failure) {
        print('🔴 [ProfileBloc] Logout failed: ${failure.message}');
        emit(ProfileError(_mapFailureToMessage(failure)));
      },
      (_) {
        print('🟢 [ProfileBloc] Logout successful');
        emit(const ProfileLoggedOut());
      },
    );
  }

  Future<void> _onUpdateUserProfile(
    UpdateUserProfile event,
    Emitter<ProfileState> emit,
  ) async {
    // Get current user from state
    if (state is! ProfileLoaded) {
      emit(const ProfileError('Cannot update profile: User not loaded'));
      return;
    }

    final currentUser = (state as ProfileLoaded).user;
    emit(ProfileUpdating(currentUser)); // Show updating state

    print('🔵 [ProfileBloc] Updating profile with: ${event.updates}');

    final result = await _updateUserProfileUseCase(
      UpdateProfileParams(event.updates),
    );

    result.fold(
      (failure) {
        print('🔴 [ProfileBloc] Update failed: ${failure.message}');
        // Return to loaded state with error
        emit(ProfileLoaded(currentUser, isFromCache: false));
        emit(ProfileError(_mapFailureToMessage(failure)));
        emit(
          ProfileLoaded(currentUser, isFromCache: false),
        ); // Return to loaded
      },
      (updatedUser) {
        print('🟢 [ProfileBloc] Profile updated successfully');
        emit(ProfileLoaded(updatedUser, isFromCache: false));
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case const (CacheFailure):
        return 'Failed to load profile from storage. Please try again.';
      case const (ServerFailure):
        return failure.message.isNotEmpty
            ? failure.message
            : 'Server error occurred. Please try again.';
      case const (ConnectionFailure):
        return 'No internet connection.';
      default:
        return failure.message.isEmpty
            ? 'An unexpected error occurred. Please try again.'
            : failure.message;
    }
  }
}
