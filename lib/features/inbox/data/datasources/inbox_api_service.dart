import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../shared/models/api_response.dart';
import '../models/marketing_model.dart';
import '../models/mailbox_model.dart';

part 'inbox_api_service.g.dart';

@RestApi()
@LazySingleton()
abstract class InboxApiService {
  @factoryMethod
  factory InboxApiService(Dio dio) = _InboxApiService;

  @GET('/client/marketing')
  Future<ApiResponse<List<MarketingModel>>> getMarketing();

  @GET('/client/mailbox')
  Future<ApiResponse<List<MailboxModel>>> getMailbox();
}