import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/onhold_balance.dart';
import '../../domain/entities/onhold_transaction.dart';
import '../../domain/entities/user_detail.dart';
import '../../domain/usecases/get_user_detail_usecase.dart';
import '../../domain/usecases/get_onhold_transactions_usecase.dart';
import '../../domain/usecases/get_onhold_balance_usecase.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

@injectable
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetUserDetailUseCase _getUserDetailUseCase;
  final GetOnholdTransactionsUseCase _getOnholdTransactionsUseCase;
  final GetOnholdBalanceUseCase _getOnholdBalanceUseCase;

  DashboardBloc(
    this._getUserDetailUseCase,
    this._getOnholdTransactionsUseCase,
    this._getOnholdBalanceUseCase,
  ) : super(const DashboardInitial()) {
    on<LoadDashboardData>(_onLoadDashboardData);
    on<RefreshDashboardData>(_onRefreshDashboardData);
  }

  Future<void> _onLoadDashboardData(
    LoadDashboardData event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardLoading());
    await _loadDashboardData(emit);
  }

  Future<void> _onRefreshDashboardData(
    RefreshDashboardData event,
    Emitter<DashboardState> emit,
  ) async {
    await _loadDashboardData(emit);
  }

  Future<void> _loadDashboardData(Emitter<DashboardState> emit) async {
    try {
      ///
      /// This is for TESTING ONLY
      ///
      emit(
        DashboardLoaded(
          userDetail: dummyUserDetail,
          onholdTransactions: dummyTransactions,
          onholdBalance: dummyBalance,
        ),
      );

      /*
      ///
      /// -------------------------------------- REAL API CALLS
      ///
      // Load all data concurrently
      final results = await Future.wait([
        _getUserDetailUseCase(),
        _getOnholdTransactionsUseCase(),
        _getOnholdBalanceUseCase(),
      ]);

      final userDetailResult = results[0];
      final transactionsResult = results[1];
      final balanceResult = results[2];

      // Check if all requests succeeded
      final userDetailSuccess = userDetailResult.fold((l) => null, (r) => r as UserDetail?);
      final transactionsSuccess = transactionsResult.fold((l) => null, (r) => r as List<OnholdTransaction>?);
      final balanceSuccess = balanceResult.fold((l) => null, (r) => r as OnholdBalance?);

      if (userDetailSuccess != null && 
          transactionsSuccess != null && 
          balanceSuccess != null) {

        // All data loaded successfully
        emit(DashboardLoaded(
          userDetail: userDetailSuccess,
          onholdTransactions: transactionsSuccess,
          onholdBalance: balanceSuccess,
        ));
      } else {
        // Some data failed to load
        final errors = <String>[];
        
        userDetailResult.fold((failure) => errors.add('User detail: ${failure.message}'), (r) => null);
        transactionsResult.fold((failure) => errors.add('Transactions: ${failure.message}'), (r) => null);
        balanceResult.fold((failure) => errors.add('Balance: ${failure.message}'), (r) => null);

        if (userDetailSuccess != null || transactionsSuccess != null || balanceSuccess != null) {
          // Partial success
          emit(DashboardPartialLoaded(
            userDetail: userDetailSuccess,
            onholdTransactions: transactionsSuccess,
            onholdBalance: balanceSuccess,
            error: errors.join(', '),
          ));
        } else {
          // Complete failure
          emit(DashboardError(errors.join(', ')));
        }
      }
      */
    } catch (e) {
      emit(DashboardError('Unexpected error: $e'));
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
final dummyTransactions = <OnholdTransaction>[
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
final dummyBalance = OnholdBalance(withheld: "123.00", awaiting: "234.20");
