// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_report_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

class _DailyReportApiService implements DailyReportApiService {
  _DailyReportApiService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<DailyReportResponseModel> getCompanyDailyReports(
    String companyUID,
    DailyReportFilterModel filter,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(filter.toJson());
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<DailyReportResponseModel>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/companies/${companyUID}/daily-reports',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DailyReportResponseModel _value;
    try {
      _value = DailyReportResponseModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiResponse<DailyReportModel>> getDailyReportById(
    String companyUID,
    String dailyReportUID,
    List<String>? expand,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'expand': expand};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiResponse<DailyReportModel>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/companies/${companyUID}/daily-reports/${dailyReportUID}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiResponse<DailyReportModel> _value;
    try {
      _value = ApiResponse<DailyReportModel>.fromJson(
        _result.data!,
        (json) => DailyReportModel.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiResponse<DailyReportModel>> createDailyReport(
    String companyUID,
    CreateDailyReportModel data,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = data;
    final _options = _setStreamType<ApiResponse<DailyReportModel>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/companies/${companyUID}/daily-reports',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiResponse<DailyReportModel> _value;
    try {
      _value = ApiResponse<DailyReportModel>.fromJson(
        _result.data!,
        (json) => DailyReportModel.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiResponse<List<FileResponseDto>>> uploadDailyReportFiles(
    String companyUID,
    String dailyReportUID,
    List<MultipartFile>? beforeImages,
    List<MultipartFile>? inprogressImages,
    List<MultipartFile>? afterImages,
    List<MultipartFile>? workersImages,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (beforeImages != null) {
      _data.files.addAll(beforeImages.map((i) => MapEntry('BEFORE_IMAGE', i)));
    }
    if (inprogressImages != null) {
      _data.files.addAll(
        inprogressImages.map((i) => MapEntry('INPROGRESS_IMAGE', i)),
      );
    }
    if (afterImages != null) {
      _data.files.addAll(afterImages.map((i) => MapEntry('AFTER_IMAGE', i)));
    }
    if (workersImages != null) {
      _data.files.addAll(
        workersImages.map((i) => MapEntry('WORKERS_IMAGE', i)),
      );
    }
    final _options = _setStreamType<ApiResponse<List<FileResponseDto>>>(
      Options(
            method: 'POST',
            headers: _headers,
            extra: _extra,
            contentType: 'multipart/form-data',
          )
          .compose(
            _dio.options,
            '/companies/${companyUID}/daily-reports/${dailyReportUID}/files',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiResponse<List<FileResponseDto>> _value;
    try {
      _value = ApiResponse<List<FileResponseDto>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                  .map<FileResponseDto>(
                    (i) => FileResponseDto.fromJson(i as Map<String, dynamic>),
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
