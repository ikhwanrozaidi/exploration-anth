import 'package:equatable/equatable.dart';

class SearchResponse extends Equatable {
  final int status;
  final String message;
  final dynamic data; // Can be SellerInfo or SearchMessage

  const SearchResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => [status, message, data];
}

class SearchMessage extends Equatable {
  final String message;

  const SearchMessage({required this.message});

  @override
  List<Object?> get props => [message];
}
