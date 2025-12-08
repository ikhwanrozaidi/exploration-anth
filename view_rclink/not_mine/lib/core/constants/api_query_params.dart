// Enums for common query parameters
import 'package:injectable/injectable.dart';

enum SortOrder {
  asc('asc'),
  desc('desc');

  final String value;
  const SortOrder(this.value);
}

enum SortBy {
  name('name'),
  createdAt('createdAt');

  final String value;
  const SortBy(this.value);
}

// Base class for common pagination and sorting parameters
class ApiQueryParams {
  final int page;
  final int limit;
  final SortOrder sortOrder;
  final SortBy sortBy;
  final String? search;

  const ApiQueryParams({
    this.page = 1,
    this.limit = 0, // 0 means all items
    this.sortOrder = SortOrder.asc,
    this.sortBy = SortBy.name,
    this.search,
  });

  // Convert to query parameters map
  Map<String, dynamic> toQueryParams() {
    return {
      'page': page,
      'limit': limit,
      'sortOrder': sortOrder.value,
      'sortBy': sortBy.value,

      if (search != null && search!.isNotEmpty) 'search': search,
    };
  }

  // Copy with method for easy modification
  ApiQueryParams copyWith({
    int? page,
    int? limit,
    SortOrder? sortOrder,
    SortBy? sortBy,
    String? search,
  }) {
    return ApiQueryParams(
      page: page ?? this.page,
      limit: limit ?? this.limit,
      sortOrder: sortOrder ?? this.sortOrder,
      sortBy: sortBy ?? this.sortBy,
      search: search ?? this.search,
    );
  }
}
