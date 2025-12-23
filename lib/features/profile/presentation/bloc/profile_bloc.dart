import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../login/presentation/bloc/login_bloc.dart';
import '../../../login/presentation/bloc/login_event.dart';
import '../../domain/usecases/update_user_profile_usecase.dart';
import 'profile_event.dart';
import 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UpdateProfileUseCase _updateProfileUseCase;
  final LoginBloc _loginBloc;

  ProfileBloc(this._updateProfileUseCase, this._loginBloc)
    : super(const ProfileInitial()) {
    on<UpdateProfileField>(_onUpdateField);
  }

  Future<void> _onUpdateField(
    UpdateProfileField event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileUpdating());

    // Prepare updates
    Map<String, dynamic> updates = {event.fieldName: event.fieldValue};

    // Auto-update fullName if firstName or lastName changed
    final currentUser = _loginBloc.state.maybeMap(
      success: (state) => state.user,
      orElse: () => null,
    );

    //REVISE: I don't want to use this approach by specifying field names manually. create class!
    if (currentUser != null &&
        (event.fieldName == 'firstName' || event.fieldName == 'lastName')) {
      final firstName = event.fieldName == 'firstName'
          ? event.fieldValue
          : currentUser.userDetail?.firstName ?? '';
      final lastName = event.fieldName == 'lastName'
          ? event.fieldValue
          : currentUser.userDetail?.lastName ?? '';
      updates['fullName'] = '$firstName $lastName'.trim();
    }

    final result = await _updateProfileUseCase(UpdateProfileParams(updates));

    result.fold(
      (failure) => emit(ProfileFailure(_mapFailureToMessage(failure))),
      (updatedUser) {
        // Update LoginBloc with new user data
        _loginBloc.add(LoginUpdateUser(updatedUser));
        emit(const ProfileSuccess());
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case const (ConnectionFailure):
        return 'No internet connection';
      case const (ServerFailure):
        return failure.message.isNotEmpty
            ? failure.message
            : 'Server error occurred';
      case const (ValidationFailure):
        return failure.message;
      default:
        return 'An unexpected error occurred';
    }
  }
}
