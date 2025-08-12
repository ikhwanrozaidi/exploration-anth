import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'dart:developer';
import '../../../../core/errors/failures.dart';
import 'profile_event.dart';
import 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  // TODO: Add use cases when domain layer is created
  // final GetUserProfileUseCase _getUserProfileUseCase;
  // final UpdateUserProfileUseCase _updateUserProfileUseCase;
  // final LogoutUserUseCase _logoutUserUseCase;
  // final ToggleTwoFactorAuthUseCase _toggleTwoFactorAuthUseCase;
  // final ToggleBiometricAuthUseCase _toggleBiometricAuthUseCase;

  ProfileBloc(
    // this._getUserProfileUseCase,
    // this._updateUserProfileUseCase,
    // this._logoutUserUseCase,
    // this._toggleTwoFactorAuthUseCase,
    // this._toggleBiometricAuthUseCase,
  ) : super(const ProfileInitial()) {
    on<LoadUserProfile>(_onLoadUserProfile);
    on<RefreshUserProfile>(_onRefreshUserProfile);
    on<UpdateUserProfile>(_onUpdateUserProfile);
    on<LogoutUser>(_onLogoutUser);
    on<ToggleTwoFactorAuth>(_onToggleTwoFactorAuth);
    on<ToggleBiometricAuth>(_onToggleBiometricAuth);
  }

  Future<void> _onLoadUserProfile(
    LoadUserProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileLoading());

    try {
      // TODO: Implement when use case is ready
      // final result = await _getUserProfileUseCase();
      
      // Simulate loading user data for now
      await Future.delayed(const Duration(milliseconds: 500));
      
      // Mock user data - replace with actual API call
      final userData = {
        'uid': 'mock_uid_123',
        'email': 'john.doe@example.com',
        'firstName': 'John',
        'lastName': 'Doe',
        'country': 'Malaysia',
        'phone': '+60123456789',
        'title': 'Mr',
      };
      
      // result.fold(
      //   (failure) => emit(ProfileError(_mapFailureToMessage(failure))),
      //   (userData) => emit(ProfileLoaded(userData: userData)),
      // );
      
      // For now, just emit loaded state with mock data
      emit(ProfileLoaded(userData: userData));
    } catch (e) {
      log('Error loading user profile: $e');
      emit(ProfileError('Failed to load profile: ${e.toString()}'));
    }
  }

  Future<void> _onRefreshUserProfile(
    RefreshUserProfile event,
    Emitter<ProfileState> emit,
  ) async {
    // Don't show loading state for refresh, just update data
    try {
      // TODO: Implement when use case is ready
      // final result = await _getUserProfileUseCase();
      
      // Simulate refresh for now
      await Future.delayed(const Duration(milliseconds: 300));
      
      // Mock refreshed user data
      final userData = {
        'uid': 'mock_uid_123',
        'email': 'john.doe@example.com',
        'firstName': 'John',
        'lastName': 'Doe',
        'country': 'Malaysia',
        'phone': '+60123456789',
        'title': 'Mr',
      };
      
      // Maintain current settings if in loaded state
      if (state is ProfileLoaded) {
        final currentState = state as ProfileLoaded;
        emit(currentState.copyWith(userData: userData));
      } else {
        emit(ProfileLoaded(userData: userData));
      }
    } catch (e) {
      log('Error refreshing user profile: $e');
      emit(ProfileError('Failed to refresh profile: ${e.toString()}'));
    }
  }

  Future<void> _onUpdateUserProfile(
    UpdateUserProfile event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      // TODO: Implement when use case is ready
      // await _updateUserProfileUseCase(UpdateUserProfileParams(event.userData));
      
      // Simulate update
      await Future.delayed(const Duration(milliseconds: 500));
      
      // Update the current state with new data
      if (state is ProfileLoaded) {
        final currentState = state as ProfileLoaded;
        emit(currentState.copyWith(userData: event.userData));
      } else {
        emit(ProfileLoaded(userData: event.userData));
      }
    } catch (e) {
      log('Error updating user profile: $e');
      emit(ProfileError('Failed to update profile: ${e.toString()}'));
    }
  }

  Future<void> _onLogoutUser(
    LogoutUser event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      // TODO: Implement when use case is ready
      // await _logoutUserUseCase();
      
      // Simulate logout
      await Future.delayed(const Duration(milliseconds: 300));
      
      log('User logged out successfully');
      emit(const ProfileLoggedOut());
    } catch (e) {
      log('Error logging out: $e');
      emit(ProfileError('Failed to logout: ${e.toString()}'));
    }
  }

  Future<void> _onToggleTwoFactorAuth(
    ToggleTwoFactorAuth event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      // TODO: Implement when use case is ready
      // await _toggleTwoFactorAuthUseCase(ToggleTwoFactorAuthParams(event.isEnabled));
      
      // Simulate toggle
      await Future.delayed(const Duration(milliseconds: 300));
      
      if (state is ProfileLoaded) {
        final currentState = state as ProfileLoaded;
        emit(currentState.copyWith(twoFactorEnabled: event.isEnabled));
      }
    } catch (e) {
      log('Error toggling two-factor auth: $e');
      emit(ProfileError('Failed to toggle two-factor authentication: ${e.toString()}'));
    }
  }

  Future<void> _onToggleBiometricAuth(
    ToggleBiometricAuth event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      // TODO: Implement when use case is ready
      // await _toggleBiometricAuthUseCase(ToggleBiometricAuthParams(event.isEnabled));
      
      // Simulate toggle
      await Future.delayed(const Duration(milliseconds: 300));
      
      if (state is ProfileLoaded) {
        final currentState = state as ProfileLoaded;
        emit(currentState.copyWith(biometricEnabled: event.isEnabled));
      }
    } catch (e) {
      log('Error toggling biometric auth: $e');
      emit(ProfileError('Failed to toggle biometric authentication: ${e.toString()}'));
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ConnectionFailure:
        return 'No internet connection. Please check your network.';
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
      default:
        return failure.message.isEmpty
            ? 'An unexpected error occurred. Please try again.'
            : failure.message;
    }
  }
}