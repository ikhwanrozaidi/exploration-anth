import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_profile_usecase.dart';
import '../../domain/usecases/update_user_profile_usecase.dart';
import 'profile_event.dart';
import 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase _getProfileUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;

  ProfileBloc(this._getProfileUseCase, this._updateProfileUseCase)
    : super(const ProfileState.initial()) {
    on<LoadProfile>(_onLoadProfile);
    on<RefreshProfile>(_onRefreshProfile);
    on<UpdateProfile>(_onUpdateProfile);
  }

  Future<void> _onLoadProfile(
    LoadProfile event,
    Emitter<ProfileState> emit,
  ) async {
    print('🔵 [ProfileBloc] LoadProfile event received');
    emit(const ProfileState.loading());

    final result = await _getProfileUseCase();

    result.fold(
      (failure) {
        print(
          '🔴 [ProfileBloc] Failed to load profile: ${_mapFailureToMessage(failure)}',
        );
        emit(ProfileState.failure(_mapFailureToMessage(failure)));
      },
      (profile) {
        if (profile == null) {
          print('⚠️ [ProfileBloc] Profile is null (user not logged in)');
          emit(const ProfileState.empty());
        } else {
          print('🟢 [ProfileBloc] Profile loaded successfully');
          print('🟢 User: ${profile.user.email}');
          print('🟢 Detail: ${profile.detail?.fullName ?? "N/A"}');
          print(
            '🟢 Settings: Marketing=${profile.settings?.marketing ?? "N/A"}',
          );

          emit(
            ProfileState.loaded(
              user: profile.user,
              detail: profile.detail,
              settings: profile.settings,
            ),
          );
        }
      },
    );
  }

  Future<void> _onRefreshProfile(
    RefreshProfile event,
    Emitter<ProfileState> emit,
  ) async {
    print('🔵 [ProfileBloc] RefreshProfile event received');
    // For now, just reload from database
    // Later, you can add API call here
    add(const ProfileEvent.loadProfile());
  }

  Future<void> _onUpdateProfile(
    UpdateProfile event,
    Emitter<ProfileState> emit,
  ) async {
    print('🔵 [ProfileBloc] UpdateProfile event received');
    emit(const ProfileState.updating());

    final result = await _updateProfileUseCase(
      UpdateProfileParams(
        email: event.email,
        phone: event.phone,
        country: event.country,
        firstName: event.firstName,
        lastName: event.lastName,
        fullName: event.fullName,
        address: event.address,
        birthDate: event.birthDate,
        profilePicture: event.profilePicture,
      ),
    );

    result.fold(
      (failure) {
        print(
          '🔴 [ProfileBloc] Failed to update profile: ${_mapFailureToMessage(failure)}',
        );
        emit(ProfileState.failure(_mapFailureToMessage(failure)));
      },
      (updatedProfile) {
        print('🟢 [ProfileBloc] Profile updated successfully');
        emit(
          ProfileState.loaded(
            user: updatedProfile.user,
            detail: updatedProfile.detail,
            settings: updatedProfile.settings,
          ),
        );
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case const (ServerFailure):
        return (failure as ServerFailure).message;
      case const (CacheFailure):
        return (failure as CacheFailure).message;
      case const (ConnectionFailure):
        return 'No internet connection';
      case const (ValidationFailure):
        return (failure as ValidationFailure).message;
      default:
        return 'Unexpected error occurred';
    }
  }
}
