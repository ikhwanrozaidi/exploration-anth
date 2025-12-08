import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import '../../../../shared/models/api_response.dart';
import '../../../dashboard/data/models/user_detail_model.dart';
import '../../../dashboard/data/models/onhold_transaction_model.dart';
import '../../../dashboard/data/models/onhold_balance_model.dart';
import '../models/request_transaction_model.dart';

part 'transactionboard_api_service.g.dart';

@injectable
@RestApi()
abstract class TransactionBoardApiService {
  @factoryMethod
  factory TransactionBoardApiService(Dio dio) = _TransactionBoardApiService;

  // Get user detail
  @GET('/client/user-detail')
  Future<ApiResponse<UserDetailModel>> getUserDetail();

  // Get onhold balance
  @GET('/client/onhold-transaction-balance')
  Future<ApiResponse<OnholdBalanceModel>> getOnholdBalance();

  // Get onhold transactions with parameters
  @GET('/client/onhold-transaction')
  Future<ApiResponse<List<OnholdTransactionModel>>> getOnholdTransactions({
    @Query('onhold') required String onhold,
    @Query('page') required String page,
    @Query('size') required String size,
  });

  // Get request transactions
  @GET('/client/request-transaction')
  Future<ApiResponse<List<RequestTransactionModel>>> getRequestTransactions();
}