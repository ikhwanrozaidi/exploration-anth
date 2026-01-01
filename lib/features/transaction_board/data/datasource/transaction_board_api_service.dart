import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../shared/models/api_response.dart';
import '../models/transaction_board_response_model.dart';

part 'transaction_board_api_service.g.dart';

@injectable
@RestApi()
abstract class TransactionBoardApiService {
  @factoryMethod
  factory TransactionBoardApiService(Dio dio) = _TransactionBoardApiService;

  @GET('/payment/users')
  Future<ApiResponse<TransactionBoardResponseModel>> getUserTransactions();
}
