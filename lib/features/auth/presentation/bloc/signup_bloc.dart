// lib/features/auth/presentation/bloc/signup_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/usecases/signup_usecase.dart';

@lazySingleton
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final CheckEmailExistsUseCase _checkEmailExistsUseCase;
  final SignUpUseCase _signUpUseCase;

  SignUpBloc(
    this._checkEmailExistsUseCase,
    this._signUpUseCase,
  ) : super(const SignUpInitial()) {
    on<SignUpCheckEmailRequested>(_onCheckEmailRequested);
    on<SignUpSubmitted>(_onSignUpSubmitted);
  }

  Future<void> _onCheckEmailRequested(
    SignUpCheckEmailRequested event,
    Emitter<SignUpState> emit,
  ) async {
    emit(const SignUpLoading());

    final result = await _checkEmailExistsUseCase(CheckEmailParams(event.email));

    result.fold(
      (failure) => emit(SignUpFailure(_mapFailureToMessage(failure))),
      (exists) => emit(SignUpEmailChecked(exists)),
    );
  }

  Future<void> _onSignUpSubmitted(
    SignUpSubmitted event,
    Emitter<SignUpState> emit,
  ) async {
    emit(const SignUpLoading());

    final result = await _signUpUseCase(SignUpParams(
      event.email,
      event.password,
      event.additionalData,
    ));

    result.fold(
      (failure) => emit(SignUpFailure(_mapFailureToMessage(failure))),
      (authResult) => emit(SignUpSuccess(authResult)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ConnectionFailure:
        return 'No internet connection. Please check your network.';
      case TimeoutFailure:
        return 'Request timeout. Please try again.';
      case ValidationFailure:
        return failure.message;
      case NetworkFailure:
      case ServerFailure:
        return failure.message;
      default:
        return failure.message.isEmpty
            ? 'An unexpected error occurred. Please try again.'
            : failure.message;
    }
  }
}

// Events
abstract class SignUpEvent {
  const SignUpEvent();
}

class SignUpCheckEmailRequested extends SignUpEvent {
  final String email;
  const SignUpCheckEmailRequested(this.email);
}

class SignUpSubmitted extends SignUpEvent {
  final String email;
  final String password;
  final Map<String, dynamic> additionalData;

  const SignUpSubmitted(this.email, this.password, this.additionalData);
}

// States
abstract class SignUpState {
  const SignUpState();
}

class SignUpInitial extends SignUpState {
  const SignUpInitial();
}

class SignUpLoading extends SignUpState {
  const SignUpLoading();
}

class SignUpEmailChecked extends SignUpState {
  final bool emailExists;
  const SignUpEmailChecked(this.emailExists);
}

class SignUpSuccess extends SignUpState {
  final dynamic authResult; // Using dynamic for now
  const SignUpSuccess(this.authResult);
}

class SignUpFailure extends SignUpState {
  final String message;
  const SignUpFailure(this.message);
}