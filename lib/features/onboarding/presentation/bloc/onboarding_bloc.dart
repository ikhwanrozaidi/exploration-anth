import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'onboarding_event.dart';
import 'onboarding_state.dart';

@lazySingleton
class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingState.initial()) {
    on<OnboardingPageChanged>(_onPageChanged);
    on<OnboardingStarted>(_onStarted);
    on<OnboardingCompleted>(_onCompleted);
  }

  void _onPageChanged(
    OnboardingPageChanged event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(currentPage: event.page));
  }

  void _onStarted(
    OnboardingStarted event,
    Emitter<OnboardingState> emit,
  ) {
    emit(OnboardingState.initial());
  }

  void _onCompleted(
    OnboardingCompleted event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(isCompleted: true));
  }
}