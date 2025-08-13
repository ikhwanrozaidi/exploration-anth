// lib/features/inbox/presentation/bloc/inbox_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import 'inbox_event.dart';
import 'inbox_state.dart';

@injectable
class InboxBloc extends Bloc<InboxEvent, InboxState> {
  // TODO: Add use cases when domain layer is created
  // final GetInboxMessagesUseCase _getInboxMessagesUseCase;
  // final MarkMessageAsReadUseCase _markMessageAsReadUseCase;

  InboxBloc(
    // this._getInboxMessagesUseCase,
    // this._markMessageAsReadUseCase,
  ) : super(const InboxInitial()) {
    on<LoadInbox>(_onLoadInbox);
    on<RefreshInbox>(_onRefreshInbox);
    on<MarkMessageAsRead>(_onMarkMessageAsRead);
  }

  Future<void> _onLoadInbox(
    LoadInbox event,
    Emitter<InboxState> emit,
  ) async {
    emit(const InboxLoading());

    try {
      // TODO: Implement when use case is ready
      // final result = await _getInboxMessagesUseCase();
      
      // Simulate loading for now
      await Future.delayed(const Duration(milliseconds: 500));
      
      // result.fold(
      //   (failure) => emit(InboxError(_mapFailureToMessage(failure))),
      //   (messages) => emit(InboxLoaded(messages)),
      // );
      
      // For now, just emit loaded state
      emit(const InboxLoaded());
    } catch (e) {
      emit(InboxError('An unexpected error occurred: ${e.toString()}'));
    }
  }

  Future<void> _onRefreshInbox(
    RefreshInbox event,
    Emitter<InboxState> emit,
  ) async {
    // Don't show loading state for refresh, just update data
    try {
      // TODO: Implement when use case is ready
      // final result = await _getInboxMessagesUseCase();
      
      // Simulate refresh for now
      await Future.delayed(const Duration(milliseconds: 500));
      
      // result.fold(
      //   (failure) => emit(InboxError(_mapFailureToMessage(failure))),
      //   (messages) => emit(InboxLoaded(messages)),
      // );
      
      // For now, just emit loaded state
      emit(const InboxLoaded());
    } catch (e) {
      emit(InboxError('Failed to refresh: ${e.toString()}'));
    }
  }

  Future<void> _onMarkMessageAsRead(
    MarkMessageAsRead event,
    Emitter<InboxState> emit,
  ) async {
    try {
      // TODO: Implement when use case is ready
      // await _markMessageAsReadUseCase(MarkMessageAsReadParams(event.messageId));
      
      // Simulate marking as read
      await Future.delayed(const Duration(milliseconds: 200));
      
      // Reload inbox to reflect changes
      add(const LoadInbox());
    } catch (e) {
      emit(InboxError('Failed to mark message as read: ${e.toString()}'));
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
      default:
        return failure.message.isEmpty
            ? 'An unexpected error occurred. Please try again.'
            : failure.message;
    }
  }
}