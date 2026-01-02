import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/search_response.dart';
import 'seller_info_model.dart';

part 'search_response_model.g.dart';

@JsonSerializable()
class SearchResponseModel extends SearchResponse {
  const SearchResponseModel({
    required super.status,
    required super.message,
    required super.data,
  });

  factory SearchResponseModel.fromJson(Map<String, dynamic> json) {
    dynamic data;

    // Parse data based on structure
    if (json['data'] is Map<String, dynamic>) {
      final dataMap = json['data'] as Map<String, dynamic>;

      // Check if it contains user info (has userId field)
      if (dataMap.containsKey('userId')) {
        data = SellerInfoModel.fromJson(dataMap);
      } else {
        // It's a message response
        data = SearchMessage(message: dataMap['message'] ?? '');
      }
    } else {
      data = json['data'];
    }

    return SearchResponseModel(
      status: json['status'] as int,
      message: json['message'] as String,
      data: data,
    );
  }

  Map<String, dynamic> toJson() => _$SearchResponseModelToJson(this);

  SearchResponse toEntity() => SearchResponse(
    status: status,
    message: message,
    data: data is SellerInfoModel ? (data as SellerInfoModel).toEntity() : data,
  );
}

@JsonSerializable()
class SearchMessage {
  final String message;

  const SearchMessage({required this.message});

  factory SearchMessage.fromJson(Map<String, dynamic> json) =>
      _$SearchMessageFromJson(json);

  Map<String, dynamic> toJson() => _$SearchMessageToJson(this);
}
