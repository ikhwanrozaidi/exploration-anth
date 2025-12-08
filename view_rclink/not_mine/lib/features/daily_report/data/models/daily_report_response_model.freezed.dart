// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_report_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyReportResponseModel {

 int get statusCode; String get message; List<DailyReportModel> get data; DailyReportMetaModel get meta;
/// Create a copy of DailyReportResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyReportResponseModelCopyWith<DailyReportResponseModel> get copyWith => _$DailyReportResponseModelCopyWithImpl<DailyReportResponseModel>(this as DailyReportResponseModel, _$identity);

  /// Serializes this DailyReportResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyReportResponseModel&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusCode,message,const DeepCollectionEquality().hash(data),meta);

@override
String toString() {
  return 'DailyReportResponseModel(statusCode: $statusCode, message: $message, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $DailyReportResponseModelCopyWith<$Res>  {
  factory $DailyReportResponseModelCopyWith(DailyReportResponseModel value, $Res Function(DailyReportResponseModel) _then) = _$DailyReportResponseModelCopyWithImpl;
@useResult
$Res call({
 int statusCode, String message, List<DailyReportModel> data, DailyReportMetaModel meta
});


$DailyReportMetaModelCopyWith<$Res> get meta;

}
/// @nodoc
class _$DailyReportResponseModelCopyWithImpl<$Res>
    implements $DailyReportResponseModelCopyWith<$Res> {
  _$DailyReportResponseModelCopyWithImpl(this._self, this._then);

  final DailyReportResponseModel _self;
  final $Res Function(DailyReportResponseModel) _then;

/// Create a copy of DailyReportResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? statusCode = null,Object? message = null,Object? data = null,Object? meta = null,}) {
  return _then(_self.copyWith(
statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<DailyReportModel>,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as DailyReportMetaModel,
  ));
}
/// Create a copy of DailyReportResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DailyReportMetaModelCopyWith<$Res> get meta {
  
  return $DailyReportMetaModelCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [DailyReportResponseModel].
extension DailyReportResponseModelPatterns on DailyReportResponseModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyReportResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyReportResponseModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyReportResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _DailyReportResponseModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyReportResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _DailyReportResponseModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int statusCode,  String message,  List<DailyReportModel> data,  DailyReportMetaModel meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyReportResponseModel() when $default != null:
return $default(_that.statusCode,_that.message,_that.data,_that.meta);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int statusCode,  String message,  List<DailyReportModel> data,  DailyReportMetaModel meta)  $default,) {final _that = this;
switch (_that) {
case _DailyReportResponseModel():
return $default(_that.statusCode,_that.message,_that.data,_that.meta);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int statusCode,  String message,  List<DailyReportModel> data,  DailyReportMetaModel meta)?  $default,) {final _that = this;
switch (_that) {
case _DailyReportResponseModel() when $default != null:
return $default(_that.statusCode,_that.message,_that.data,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyReportResponseModel implements DailyReportResponseModel {
  const _DailyReportResponseModel({required this.statusCode, required this.message, required final  List<DailyReportModel> data, required this.meta}): _data = data;
  factory _DailyReportResponseModel.fromJson(Map<String, dynamic> json) => _$DailyReportResponseModelFromJson(json);

@override final  int statusCode;
@override final  String message;
 final  List<DailyReportModel> _data;
@override List<DailyReportModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  DailyReportMetaModel meta;

/// Create a copy of DailyReportResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyReportResponseModelCopyWith<_DailyReportResponseModel> get copyWith => __$DailyReportResponseModelCopyWithImpl<_DailyReportResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyReportResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyReportResponseModel&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusCode,message,const DeepCollectionEquality().hash(_data),meta);

@override
String toString() {
  return 'DailyReportResponseModel(statusCode: $statusCode, message: $message, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$DailyReportResponseModelCopyWith<$Res> implements $DailyReportResponseModelCopyWith<$Res> {
  factory _$DailyReportResponseModelCopyWith(_DailyReportResponseModel value, $Res Function(_DailyReportResponseModel) _then) = __$DailyReportResponseModelCopyWithImpl;
@override @useResult
$Res call({
 int statusCode, String message, List<DailyReportModel> data, DailyReportMetaModel meta
});


@override $DailyReportMetaModelCopyWith<$Res> get meta;

}
/// @nodoc
class __$DailyReportResponseModelCopyWithImpl<$Res>
    implements _$DailyReportResponseModelCopyWith<$Res> {
  __$DailyReportResponseModelCopyWithImpl(this._self, this._then);

  final _DailyReportResponseModel _self;
  final $Res Function(_DailyReportResponseModel) _then;

/// Create a copy of DailyReportResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statusCode = null,Object? message = null,Object? data = null,Object? meta = null,}) {
  return _then(_DailyReportResponseModel(
statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<DailyReportModel>,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as DailyReportMetaModel,
  ));
}

/// Create a copy of DailyReportResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DailyReportMetaModelCopyWith<$Res> get meta {
  
  return $DailyReportMetaModelCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// @nodoc
mixin _$DailyReportMetaModel {

 int get page; int get limit; int get totalCount; int get totalPages; bool get hasNext; bool get hasPrev;
/// Create a copy of DailyReportMetaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyReportMetaModelCopyWith<DailyReportMetaModel> get copyWith => _$DailyReportMetaModelCopyWithImpl<DailyReportMetaModel>(this as DailyReportMetaModel, _$identity);

  /// Serializes this DailyReportMetaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyReportMetaModel&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.hasPrev, hasPrev) || other.hasPrev == hasPrev));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,limit,totalCount,totalPages,hasNext,hasPrev);

@override
String toString() {
  return 'DailyReportMetaModel(page: $page, limit: $limit, totalCount: $totalCount, totalPages: $totalPages, hasNext: $hasNext, hasPrev: $hasPrev)';
}


}

/// @nodoc
abstract mixin class $DailyReportMetaModelCopyWith<$Res>  {
  factory $DailyReportMetaModelCopyWith(DailyReportMetaModel value, $Res Function(DailyReportMetaModel) _then) = _$DailyReportMetaModelCopyWithImpl;
@useResult
$Res call({
 int page, int limit, int totalCount, int totalPages, bool hasNext, bool hasPrev
});




}
/// @nodoc
class _$DailyReportMetaModelCopyWithImpl<$Res>
    implements $DailyReportMetaModelCopyWith<$Res> {
  _$DailyReportMetaModelCopyWithImpl(this._self, this._then);

  final DailyReportMetaModel _self;
  final $Res Function(DailyReportMetaModel) _then;

/// Create a copy of DailyReportMetaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? limit = null,Object? totalCount = null,Object? totalPages = null,Object? hasNext = null,Object? hasPrev = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,hasPrev: null == hasPrev ? _self.hasPrev : hasPrev // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyReportMetaModel].
extension DailyReportMetaModelPatterns on DailyReportMetaModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyReportMetaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyReportMetaModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyReportMetaModel value)  $default,){
final _that = this;
switch (_that) {
case _DailyReportMetaModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyReportMetaModel value)?  $default,){
final _that = this;
switch (_that) {
case _DailyReportMetaModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int page,  int limit,  int totalCount,  int totalPages,  bool hasNext,  bool hasPrev)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyReportMetaModel() when $default != null:
return $default(_that.page,_that.limit,_that.totalCount,_that.totalPages,_that.hasNext,_that.hasPrev);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int page,  int limit,  int totalCount,  int totalPages,  bool hasNext,  bool hasPrev)  $default,) {final _that = this;
switch (_that) {
case _DailyReportMetaModel():
return $default(_that.page,_that.limit,_that.totalCount,_that.totalPages,_that.hasNext,_that.hasPrev);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int page,  int limit,  int totalCount,  int totalPages,  bool hasNext,  bool hasPrev)?  $default,) {final _that = this;
switch (_that) {
case _DailyReportMetaModel() when $default != null:
return $default(_that.page,_that.limit,_that.totalCount,_that.totalPages,_that.hasNext,_that.hasPrev);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyReportMetaModel implements DailyReportMetaModel {
  const _DailyReportMetaModel({required this.page, required this.limit, required this.totalCount, required this.totalPages, required this.hasNext, required this.hasPrev});
  factory _DailyReportMetaModel.fromJson(Map<String, dynamic> json) => _$DailyReportMetaModelFromJson(json);

@override final  int page;
@override final  int limit;
@override final  int totalCount;
@override final  int totalPages;
@override final  bool hasNext;
@override final  bool hasPrev;

/// Create a copy of DailyReportMetaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyReportMetaModelCopyWith<_DailyReportMetaModel> get copyWith => __$DailyReportMetaModelCopyWithImpl<_DailyReportMetaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyReportMetaModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyReportMetaModel&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.hasPrev, hasPrev) || other.hasPrev == hasPrev));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,limit,totalCount,totalPages,hasNext,hasPrev);

@override
String toString() {
  return 'DailyReportMetaModel(page: $page, limit: $limit, totalCount: $totalCount, totalPages: $totalPages, hasNext: $hasNext, hasPrev: $hasPrev)';
}


}

/// @nodoc
abstract mixin class _$DailyReportMetaModelCopyWith<$Res> implements $DailyReportMetaModelCopyWith<$Res> {
  factory _$DailyReportMetaModelCopyWith(_DailyReportMetaModel value, $Res Function(_DailyReportMetaModel) _then) = __$DailyReportMetaModelCopyWithImpl;
@override @useResult
$Res call({
 int page, int limit, int totalCount, int totalPages, bool hasNext, bool hasPrev
});




}
/// @nodoc
class __$DailyReportMetaModelCopyWithImpl<$Res>
    implements _$DailyReportMetaModelCopyWith<$Res> {
  __$DailyReportMetaModelCopyWithImpl(this._self, this._then);

  final _DailyReportMetaModel _self;
  final $Res Function(_DailyReportMetaModel) _then;

/// Create a copy of DailyReportMetaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? limit = null,Object? totalCount = null,Object? totalPages = null,Object? hasNext = null,Object? hasPrev = null,}) {
  return _then(_DailyReportMetaModel(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,hasPrev: null == hasPrev ? _self.hasPrev : hasPrev // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
