import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../dashboard/domain/entities/onhold_balance.dart';
import '../../../dashboard/domain/entities/onhold_transaction.dart';
import '../../../dashboard/domain/entities/user_detail.dart';
import '../../domain/entities/request_transaction.dart';
import '../../domain/usecases/get_user_detail_usecase.dart';
import '../../domain/usecases/get_onhold_transactions_usecase.dart';
import '../../domain/usecases/get_onhold_balance_usecase.dart';
import '../../domain/usecases/get_request_transactions_usecase.dart';
import 'transaction_event.dart';
import 'transaction_state.dart';

@injectable
class TransactionBoardBloc
    extends Bloc<TransactionBoardEvent, TransactionBoardState> {
  final GetUserDetailTransactionBoardUseCase _getUserDetailUseCase;
  final GetOnholdTransactionsWithParamsUseCase _getOnholdTransactionsUseCase;
  final GetOnholdBalanceTransactionBoardUseCase _getOnholdBalanceUseCase;
  final GetRequestTransactionsUseCase _getRequestTransactionsUseCase;

  TransactionBoardBloc(
    this._getUserDetailUseCase,
    this._getOnholdTransactionsUseCase,
    this._getOnholdBalanceUseCase,
    this._getRequestTransactionsUseCase,
  ) : super(const TransactionBoardInitial()) {
    on<LoadTransactionBoardData>(_onLoadTransactionBoardData);
    on<RefreshTransactionBoardData>(_onRefreshTransactionBoardData);
    on<LoadOnholdTransactions>(_onLoadOnholdTransactions);
    on<LoadRequestTransactions>(_onLoadRequestTransactions);
  }

  Future<void> _onLoadTransactionBoardData(
    LoadTransactionBoardData event,
    Emitter<TransactionBoardState> emit,
  ) async {
    emit(const TransactionBoardLoading());
    await _loadTransactionBoardData(emit);
  }

  Future<void> _onRefreshTransactionBoardData(
    RefreshTransactionBoardData event,
    Emitter<TransactionBoardState> emit,
  ) async {
    // Don't show loading for refresh, keep current state
    await _loadTransactionBoardData(emit);
  }

  Future<void> _onLoadOnholdTransactions(
    LoadOnholdTransactions event,
    Emitter<TransactionBoardState> emit,
  ) async {
    // This could be used for pagination or specific onhold parameter loading
    final result = await _getOnholdTransactionsUseCase(
      onhold: event.onhold,
      page: event.page,
      size: event.size,
    );

    result.fold(
      (failure) => emit(
        TransactionBoardError(
          'Failed to load onhold transactions: ${failure.message}',
        ),
      ),
      (transactions) {
        // Handle the specific transactions loading if needed
        // For now, we'll reload all data to maintain consistency
        add(const RefreshTransactionBoardData());
      },
    );
  }

  Future<void> _onLoadRequestTransactions(
    LoadRequestTransactions event,
    Emitter<TransactionBoardState> emit,
  ) async {
    final result = await _getRequestTransactionsUseCase();

    result.fold(
      (failure) => emit(
        TransactionBoardError(
          'Failed to load request transactions: ${failure.message}',
        ),
      ),
      (transactions) {
        // Handle the specific transactions loading if needed
        // For now, we'll reload all data to maintain consistency
        add(const RefreshTransactionBoardData());
      },
    );
  }

  Future<void> _loadTransactionBoardData(
    Emitter<TransactionBoardState> emit,
  ) async {
    try {
      ///
      /// This is for TESTING ONLY
      ///
      emit(
        TransactionBoardLoaded(
          userDetail: dummyUserDetail,
          onholdBalance: dummyBalance,
          onholdTransactionsTrue: dummyOnholdTransactionsTrue,
          onholdTransactionsFalse: dummyOnholdTransactionsFalse,
          requestTransactions: dummyRequestTransactions,
        ),
      );

      /*
      ///
      /// -------------------------------------- REAL API CALLS
      ///
      // Load all data concurrently
      final results = await Future.wait([
        _getUserDetailUseCase(),
        _getOnholdBalanceUseCase(),
        _getOnholdTransactionsUseCase(onhold: true, page: 1, size: 20), // onhold=true
        _getOnholdTransactionsUseCase(onhold: false, page: 1, size: 20), // onhold=false
        _getRequestTransactionsUseCase(),
      ]);

      final userDetailResult = results[0];
      final balanceResult = results[1];
      final onholdTrueResult = results[2];
      final onholdFalseResult = results[3];
      final requestTransactionsResult = results[4];

      // Check if all requests succeeded
      final userDetailSuccess = userDetailResult.fold((l) => null, (r) => r as UserDetail?);
      final balanceSuccess = balanceResult.fold((l) => null, (r) => r as OnholdBalance?);
      final onholdTrueSuccess = onholdTrueResult.fold((l) => null, (r) => r as List<OnholdTransaction>?);
      final onholdFalseSuccess = onholdFalseResult.fold((l) => null, (r) => r as List<OnholdTransaction>?);
      final requestTransactionsSuccess = requestTransactionsResult.fold((l) => null, (r) => r as List<RequestTransaction>?);

      if (userDetailSuccess != null && 
          balanceSuccess != null && 
          onholdTrueSuccess != null &&
          onholdFalseSuccess != null &&
          requestTransactionsSuccess != null) {
        // All data loaded successfully
        emit(TransactionBoardLoaded(
          userDetail: userDetailSuccess,
          onholdBalance: balanceSuccess,
          onholdTransactionsTrue: onholdTrueSuccess,
          onholdTransactionsFalse: onholdFalseSuccess,
          requestTransactions: requestTransactionsSuccess,
        ));
      } else {
        // Some data failed to load
        final errors = <String>[];
        
        userDetailResult.fold((failure) => errors.add('User detail: ${failure.message}'), (r) => null);
        balanceResult.fold((failure) => errors.add('Balance: ${failure.message}'), (r) => null);
        onholdTrueResult.fold((failure) => errors.add('Onhold transactions (true): ${failure.message}'), (r) => null);
        onholdFalseResult.fold((failure) => errors.add('Onhold transactions (false): ${failure.message}'), (r) => null);
        requestTransactionsResult.fold((failure) => errors.add('Request transactions: ${failure.message}'), (r) => null);

        if (userDetailSuccess != null || 
            balanceSuccess != null || 
            onholdTrueSuccess != null ||
            onholdFalseSuccess != null ||
            requestTransactionsSuccess != null) {
          // Partial success
          emit(TransactionBoardPartialLoaded(
            userDetail: userDetailSuccess,
            onholdBalance: balanceSuccess,
            onholdTransactionsTrue: onholdTrueSuccess,
            onholdTransactionsFalse: onholdFalseSuccess,
            requestTransactions: requestTransactionsSuccess,
            error: errors.join(', '),
          ));
        } else {
          // Complete failure
          emit(TransactionBoardError(errors.join(', ')));
        }
      }
      */
    } catch (e) {
      emit(TransactionBoardError('Unexpected error: $e'));
    }
  }
}

///
/// Dummy Data
///
final dummyUserDetail = UserDetail(
  firstName: "John",
  lastName: "Doe",
  phone: "+601323456789",
  country: "Malaysia",
  email: "test@test.dev",
  verify: "true",
  gatePoint: "000",
  balance: "1234.45",
  vaccount: " ",
);

// Create dummy OnholdBalance
final dummyBalance = OnholdBalance(withheld: "123.00", awaiting: "234.20");

// Create dummy OnholdTransactions (onhold=true)
final dummyOnholdTransactionsTrue = <OnholdTransaction>[
  OnholdTransaction(
    createdAt: "20250821",
    paymentId: "12345678",
    paymentType: "p2p",
    senderId: "12345",
    receiverId: "67890",
    merchantId: "12345",
    productName: "Product A",
    productDesc: "A is a Product",
    productCat: "Fashion",
    amount: "123.50",
    refundable: "false",
  ),
  OnholdTransaction(
    createdAt: "20250820",
    paymentId: "87654321",
    paymentType: "merchant",
    senderId: "54321",
    receiverId: "09876",
    merchantId: "67890",
    productName: "Product B",
    productDesc: "B is another Product",
    productCat: "Electronics",
    amount: "456.75",
    refundable: "true",
  ),
];

// Create dummy OnholdTransactions (onhold=false)
final dummyOnholdTransactionsFalse = <OnholdTransaction>[
  OnholdTransaction(
    createdAt: "20250819",
    paymentId: "11111111",
    paymentType: "wallet",
    senderId: "11111",
    receiverId: "22222",
    merchantId: "33333",
    productName: "Product C",
    productDesc: "C is a released product",
    productCat: "Books",
    amount: "89.99",
    refundable: "false",
  ),
  OnholdTransaction(
    createdAt: "20250818",
    paymentId: "22222222",
    paymentType: "p2p",
    senderId: "44444",
    receiverId: "55555",
    merchantId: "66666",
    productName: "Product D",
    productDesc: "D is a completed product",
    productCat: "Sports",
    amount: "299.00",
    refundable: "true",
  ),
];

// Create dummy RequestTransactions
final dummyRequestTransactions = <RequestTransaction>[
  RequestTransaction(
    createdAt: "20250821",
    paymentId: "REQ001",
    paymentType: "request",
    senderId: "77777",
    receiverId: "88888",
    merchantId: "99999",
    productName: "Requested Product A",
    productDesc: "This is a requested product A",
    productCat: "Services",
    amount: "175.25",
    refundable: "false",
  ),
  RequestTransaction(
    createdAt: "20250820",
    paymentId: "REQ002",
    paymentType: "request",
    senderId: "12121",
    receiverId: "34343",
    merchantId: "56565",
    productName: "Requested Product B",
    productDesc: "This is a requested product B",
    productCat: "Digital",
    amount: "99.99",
    refundable: "true",
  ),
];
