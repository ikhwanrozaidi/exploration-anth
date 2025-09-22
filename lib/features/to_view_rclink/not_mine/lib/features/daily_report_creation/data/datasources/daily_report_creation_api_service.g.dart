// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_report_creation_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

class _DailyReportCreationApiService implements DailyReportCreationApiService {
  _DailyReportCreationApiService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<ApiResponse<List<ScopeOfWorkModel>>> getWorkScopes({
    required String companyUID,
    int? page = 1,
    int? limit = 0,
    String? sortOrder = 'asc',
    String? sortBy,
    String? search,
    String? code,
    bool? allowMultipleQuantities,
    List<String>? expand = const ['workEquipments', 'workQuantityTypes'],
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'limit': limit,
      r'sortOrder': sortOrder,
      r'sortBy': sortBy,
      r'search': search,
      r'code': code,
      r'allowMultipleQuantities': allowMultipleQuantities,
      r'expand': expand,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiResponse<List<ScopeOfWorkModel>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/companies/${companyUID}/work-scopes',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiResponse<List<ScopeOfWorkModel>> _value;
    try {
      _value = ApiResponse<List<ScopeOfWorkModel>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                  .map<ScopeOfWorkModel>(
                    (i) => ScopeOfWorkModel.fromJson(i as Map<String, dynamic>),
                  )
                  .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiResponse<List<ProvinceModel>>> getStates({
    int? page = 1,
    int? limit = 0,
    String? sortOrder = 'asc',
    String? sortBy = 'name',
    int? countryID,
    String? search,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'limit': limit,
      r'sortOrder': sortOrder,
      r'sortBy': sortBy,
      r'countryID': countryID,
      r'search': search,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiResponse<List<ProvinceModel>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/states',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiResponse<List<ProvinceModel>> _value;
    try {
      _value = ApiResponse<List<ProvinceModel>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                  .map<ProvinceModel>(
                    (i) => ProvinceModel.fromJson(i as Map<String, dynamic>),
                  )
                  .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
