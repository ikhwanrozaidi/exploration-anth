import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'dart:developer';
import '../../../../lib/core/errors/failures.dart';
import '../../../../lib/features/profile/domain/entities/user_settings_entity.dart';
import '../../../../lib/features/profile/domain/usecases/get_user_settings_usecase.dart';
import 'profile_event.dart';
import 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserSettingsUseCase _getUserSettingsUseCase;

  ProfileBloc(this._getUserSettingsUseCase) : super(const ProfileInitial()) {
    on<LoadUserSettings>(_onLoadUserSettings);
    on<RefreshUserSettings>(_onRefreshUserSettings);
  }

  Future<void> _onLoadUserSettings(
    LoadUserSettings event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileLoading());

    ///
    /// This is for TESTING ONLY
    ///
    emit(ProfileLoaded(userSettings: dummyUserSettings));

    /*
    ///
    /// -------------------------------------- REAL API CALLS
    ///
    try {
      final result = await _getUserSettingsUseCase();

      result.fold(
        (failure) => emit(ProfileError(_mapFailureToMessage(failure))),
        (userSettings) => emit(ProfileLoaded(userSettings: userSettings)),
      );
    } catch (e) {
      log('Error loading user settings: $e');
      emit(ProfileError('Failed to load user settings: ${e.toString()}'));
    }
    */
  }

  Future<void> _onRefreshUserSettings(
    RefreshUserSettings event,
    Emitter<ProfileState> emit,
  ) async {
    ///
    /// This is for TESTING ONLY
    ///
    emit(ProfileLoaded(userSettings: dummyUserSettings));

    /*
    ///
    /// -------------------------------------- REAL API CALLS
    ///
    try {
      final result = await _getUserSettingsUseCase();

      result.fold((failure) {
        // If refresh fails and we have current data, show error but keep data
        if (state is ProfileLoaded) {
          final currentState = state as ProfileLoaded;
          // You could show a snackbar here instead of changing state
          emit(ProfileError(_mapFailureToMessage(failure)));
          // Restore previous state after showing error
          Future.delayed(const Duration(seconds: 2), () {
            if (!isClosed) emit(currentState);
          });
        } else {
          emit(ProfileError(_mapFailureToMessage(failure)));
        }
      }, (userSettings) => emit(ProfileLoaded(userSettings: userSettings)));
    } catch (e) {
      log('Error refreshing user settings: $e');
      emit(ProfileError('Failed to refresh user settings: ${e.toString()}'));
    }
    */
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ConnectionFailure:
        return 'No internet connection. Showing cached data if available.';
      case TimeoutFailure:
        return 'Request timeout. Please try again.';
      case ServerFailure:
        return failure.message.isNotEmpty
            ? failure.message
            : 'Server error occurred. Please try again.';
      case NetworkFailure:
        return 'Network error occurred. Please check your connection.';
      case UnauthorizedFailure:
        return 'Session expired. Please login again.';
      case CacheFailure:
        return 'Cache error: ${failure.message}';
      default:
        return failure.message.isEmpty
            ? 'An unexpected error occurred. Please try again.'
            : failure.message;
    }
  }
}

final dummyUserSettings = UserSettings(
  address: "123 Jalan Putra Heights, Subang Jaya, 47650 Selangor, Malaysia",
  profilePicture: "https://via.placeholder.com/150x150/4285F4/FFFFFF?text=JD",
  tier: "Premium",
  fullName: "John Doe",
  isMarketing: true,
  isNotifications: true,
  isTwoFa: true,
);
