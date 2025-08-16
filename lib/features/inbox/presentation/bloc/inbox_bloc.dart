import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/mailbox_entity.dart';
import '../../domain/entities/marketing_entity.dart';
import '../../domain/usecases/get_marketing_usecase.dart';
import '../../domain/usecases/get_mailbox_usecase.dart';
import 'inbox_event.dart';
import 'inbox_state.dart';

@injectable
class InboxBloc extends Bloc<InboxEvent, InboxState> {
  final GetMarketingUseCase _getMarketingUseCase;
  final GetMailboxUseCase _getMailboxUseCase;

  InboxBloc(this._getMarketingUseCase, this._getMailboxUseCase)
    : super(InboxInitial()) {
    on<GetMarketingEvent>(_onGetMarketing);
    on<GetMailboxEvent>(_onGetMailbox);
    on<RefreshInboxEvent>(_onRefreshInbox);
  }

  Future<void> _onGetMarketing(
    GetMarketingEvent event,
    Emitter<InboxState> emit,
  ) async {
    emit(InboxLoading());

    ///
    /// This is for TESTING ONLY
    ///
    if (state is InboxLoaded) {
      final currentState = state as InboxLoaded;
      emit(
        InboxLoaded(marketing: dummyMarketing, mailbox: currentState.mailbox),
      );
    } else {
      emit(InboxLoaded(marketing: dummyMarketing, mailbox: []));
    }

    /*
    ///
    /// -------------------------------------- REAL API CALLS
    ///
    final result = await _getMarketingUseCase();
    result.fold(
      (failure) => emit(InboxError(failure.toString())),
      (marketing) {
        if (state is InboxLoaded) {
          final currentState = state as InboxLoaded;
          emit(InboxLoaded(
            marketing: marketing,
            mailbox: currentState.mailbox,
          ));
        } else {
          emit(InboxLoaded(marketing: marketing, mailbox: []));
        }
      },
    );
    */
  }

  Future<void> _onGetMailbox(
    GetMailboxEvent event,
    Emitter<InboxState> emit,
  ) async {
    emit(InboxLoading());

    ///
    /// This is for TESTING ONLY
    ///
    if (state is InboxLoaded) {
      final currentState = state as InboxLoaded;
      emit(
        InboxLoaded(marketing: currentState.marketing, mailbox: dummyMailbox),
      );
    } else {
      emit(InboxLoaded(marketing: [], mailbox: dummyMailbox));
    }

    /*
    ///
    /// -------------------------------------- REAL API CALLS
    ///
    // COMMENTED OUT - Real API call
    final result = await _getMailboxUseCase();
    result.fold(
      (failure) => emit(InboxError(failure.toString())),
      (mailbox) {
        if (state is InboxLoaded) {
          final currentState = state as InboxLoaded;
          emit(InboxLoaded(
            marketing: currentState.marketing,
            mailbox: mailbox,
          ));
        } else {
          emit(InboxLoaded(marketing: [], mailbox: mailbox));
        }
      },
    );
    */
  }

  Future<void> _onRefreshInbox(
    RefreshInboxEvent event,
    Emitter<InboxState> emit,
  ) async {
    emit(InboxLoading());

    ///
    /// This is for TESTING ONLY
    ///
    emit(InboxLoaded(marketing: dummyMarketing, mailbox: dummyMailbox));

    /*
    ///
    /// -------------------------------------- REAL API CALLS
    ///
    // COMMENTED OUT - Real API calls
    // Fetch both marketing and mailbox data
    final marketingResult = await _getMarketingUseCase();
    final mailboxResult = await _getMailboxUseCase();

    final marketing = marketingResult.fold(
      (failure) => <Marketing>[],
      (data) => data,
    );

    final mailbox = mailboxResult.fold(
      (failure) => <Mailbox>[],
      (data) => data,
    );

    // Check if any operation failed
    if (marketingResult.isLeft() && mailboxResult.isLeft()) {
      emit(InboxError('Failed to load inbox data'));
    } else {
      emit(InboxLoaded(marketing: marketing, mailbox: mailbox));
    }
    */
  }
}

final dummyMarketing = <Marketing>[
  Marketing(
    imagePath: "https://via.placeholder.com/300x200",
    title: "Special Promotion",
    description: "Get 20% off on all transactions this month!",
    code: "PROMO20",
  ),
  Marketing(
    imagePath: "https://via.placeholder.com/300x200",
    title: "New Feature Alert",
    description: "Introducing instant transfers - Send money in seconds",
    code: "INSTANT",
  ),
  Marketing(
    imagePath: "https://via.placeholder.com/300x200",
    title: "Holiday Offer",
    description: "Celebrate the season with exclusive rewards",
    code: "HOLIDAY2025",
  ),
];

// Create dummy Mailbox data
final dummyMailbox = <Mailbox>[
  Mailbox(
    publishedAt: "2025-01-15T10:30:00Z",
    sender: "System",
    title: "Transaction Completed",
    description:
        "Your payment of RM123.50 to John Doe has been successfully processed.",
    type: "transaction",
    paymentId: "PAY001",
    isRead: false,
  ),
  Mailbox(
    publishedAt: "2025-01-14T14:22:00Z",
    sender: "Support Team",
    title: "Account Verification",
    description: "Your account verification has been completed successfully.",
    type: "notification",
    paymentId: "",
    isRead: true,
  ),
  Mailbox(
    publishedAt: "2025-01-13T09:15:00Z",
    sender: "Security",
    title: "Login Alert",
    description:
        "New login detected from Malaysia. If this wasn't you, please contact support.",
    type: "security",
    paymentId: "",
    isRead: false,
  ),
  Mailbox(
    publishedAt: "2025-01-12T16:45:00Z",
    sender: "Finance Team",
    title: "Refund Processed",
    description:
        "Your refund of RM456.75 has been processed and will appear in your account within 3-5 business days.",
    type: "refund",
    paymentId: "REF002",
    isRead: true,
  ),
  Mailbox(
    publishedAt: "2025-01-11T11:30:00Z",
    sender: "Marketing",
    title: "Welcome Bonus",
    description:
        "Congratulations! You've received a welcome bonus of RM50 for joining our platform.",
    type: "bonus",
    paymentId: "BONUS001",
    isRead: false,
  ),
];
