// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'warning_list_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WarningListResponseModel {

 int get statusCode; String get message; List<WarningModel> get data; WarningMetaModel get meta;
/// Create a copy of WarningListResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WarningListResponseModelCopyWith<WarningListResponseModel> get copyWith => _$WarningListResponseModelCopyWithImpl<WarningListResponseModel>(this as WarningListResponseModel, _$identity);

  /// Serializes this WarningListResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarningListResponseModel&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusCode,message,const DeepCollectionEquality().hash(data),meta);

@override
String toString() {
  return 'WarningListResponseModel(statusCode: $statusCode, message: $message, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $WarningListResponseModelCopyWith<$Res>  {
  factory $WarningListResponseModelCopyWith(WarningListResponseModel value, $Res Function(WarningListResponseModel) _then) = _$WarningListResponseModelCopyWithImpl;
@useResult
$Res call({
 int statusCode, String message, List<WarningModel> data, WarningMetaModel meta
});


$WarningMetaModelCopyWith<$Res> get meta;

}
/// @nodoc
class _$WarningListResponseModelCopyWithImpl<$Res>
    implements $WarningListResponseModelCopyWith<$Res> {
  _$WarningListResponseModelCopyWithImpl(this._self, this._then);

  final WarningListResponseModel _self;
  final $Res Function(WarningListResponseModel) _then;

/// Create a copy of WarningListResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? statusCode = null,Object? message = null,Object? data = null,Object? meta = null,}) {
  return _then(_self.copyWith(
statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<WarningModel>,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as WarningMetaModel,
  ));
}
/// Create a copy of WarningListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WarningMetaModelCopyWith<$Res> get meta {
  
  return $WarningMetaModelCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [WarningListResponseModel].
extension WarningListResponseModelPatterns on WarningListResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WarningListResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WarningListResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WarningListResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _WarningListResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WarningListResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _WarningListResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int statusCode,  String message,  List<WarningModel> data,  WarningMetaModel meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WarningListResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int statusCode,  String message,  List<WarningModel> data,  WarningMetaModel meta)  $default,) {final _that = this;
switch (_that) {
case _WarningListResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int statusCode,  String message,  List<WarningModel> data,  WarningMetaModel meta)?  $default,) {final _that = this;
switch (_that) {
case _WarningListResponseModel() when $default != null:
return $default(_that.statusCode,_that.message,_that.data,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WarningListResponseModel implements WarningListResponseModel {
  const _WarningListResponseModel({required this.statusCode, required this.message, required final  List<WarningModel> data, required this.meta}): _data = data;
  factory _WarningListResponseModel.fromJson(Map<String, dynamic> json) => _$WarningListResponseModelFromJson(json);

@override final  int statusCode;
@override final  String message;
 final  List<WarningModel> _data;
@override List<WarningModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  WarningMetaModel meta;

/// Create a copy of WarningListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WarningListResponseModelCopyWith<_WarningListResponseModel> get copyWith => __$WarningListResponseModelCopyWithImpl<_WarningListResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WarningListResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WarningListResponseModel&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusCode,message,const DeepCollectionEquality().hash(_data),meta);

@override
String toString() {
  return 'WarningListResponseModel(statusCode: $statusCode, message: $message, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$WarningListResponseModelCopyWith<$Res> implements $WarningListResponseModelCopyWith<$Res> {
  factory _$WarningListResponseModelCopyWith(_WarningListResponseModel value, $Res Function(_WarningListResponseModel) _then) = __$WarningListResponseModelCopyWithImpl;
@override @useResult
$Res call({
 int statusCode, String message, List<WarningModel> data, WarningMetaModel meta
});


@override $WarningMetaModelCopyWith<$Res> get meta;

}
/// @nodoc
class __$WarningListResponseModelCopyWithImpl<$Res>
    implements _$WarningListResponseModelCopyWith<$Res> {
  __$WarningListResponseModelCopyWithImpl(this._self, this._then);

  final _WarningListResponseModel _self;
  final $Res Function(_WarningListResponseModel) _then;

/// Create a copy of WarningListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statusCode = null,Object? message = null,Object? data = null,Object? meta = null,}) {
  return _then(_WarningListResponseModel(
statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<WarningModel>,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as WarningMetaModel,
  ));
}

/// Create a copy of WarningListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WarningMetaModelCopyWith<$Res> get meta {
  
  return $WarningMetaModelCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// @nodoc
mixin _$WarningMetaModel {

 int get page; int get limit; int get totalCount; int get totalPages; bool get hasNext; bool get hasPrev;
/// Create a copy of WarningMetaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WarningMetaModelCopyWith<WarningMetaModel> get copyWith => _$WarningMetaModelCopyWithImpl<WarningMetaModel>(this as WarningMetaModel, _$identity);

  /// Serializes this WarningMetaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarningMetaModel&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.hasPrev, hasPrev) || other.hasPrev == hasPrev));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,limit,totalCount,totalPages,hasNext,hasPrev);

@override
String toString() {
  return 'WarningMetaModel(page: $page, limit: $limit, totalCount: $totalCount, totalPages: $totalPages, hasNext: $hasNext, hasPrev: $hasPrev)';
}


}

/// @nodoc
abstract mixin class $WarningMetaModelCopyWith<$Res>  {
  factory $WarningMetaModelCopyWith(WarningMetaModel value, $Res Function(WarningMetaModel) _then) = _$WarningMetaModelCopyWithImpl;
@useResult
$Res call({
 int page, int limit, int totalCount, int totalPages, bool hasNext, bool hasPrev
});




}
/// @nodoc
class _$WarningMetaModelCopyWithImpl<$Res>
    implements $WarningMetaModelCopyWith<$Res> {
  _$WarningMetaModelCopyWithImpl(this._self, this._then);

  final WarningMetaModel _self;
  final $Res Function(WarningMetaModel) _then;

/// Create a copy of WarningMetaModel
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


/// Adds pattern-matching-related methods to [WarningMetaModel].
extension WarningMetaModelPatterns on WarningMetaModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WarningMetaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WarningMetaModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WarningMetaModel value)  $default,){
final _that = this;
switch (_that) {
case _WarningMetaModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WarningMetaModel value)?  $default,){
final _that = this;
switch (_that) {
case _WarningMetaModel() when $default != null:
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
case _WarningMetaModel() when $default != null:
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
case _WarningMetaModel():
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
case _WarningMetaModel() when $default != null:
return $default(_that.page,_that.limit,_that.totalCount,_that.totalPages,_that.hasNext,_that.hasPrev);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WarningMetaModel implements WarningMetaModel {
  const _WarningMetaModel({required this.page, required this.limit, required this.totalCount, required this.totalPages, required this.hasNext, required this.hasPrev});
  factory _WarningMetaModel.fromJson(Map<String, dynamic> json) => _$WarningMetaModelFromJson(json);

@override final  int page;
@override final  int limit;
@override final  int totalCount;
@override final  int totalPages;
@override final  bool hasNext;
@override final  bool hasPrev;

/// Create a copy of WarningMetaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WarningMetaModelCopyWith<_WarningMetaModel> get copyWith => __$WarningMetaModelCopyWithImpl<_WarningMetaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WarningMetaModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WarningMetaModel&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.hasPrev, hasPrev) || other.hasPrev == hasPrev));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,limit,totalCount,totalPages,hasNext,hasPrev);

@override
String toString() {
  return 'WarningMetaModel(page: $page, limit: $limit, totalCount: $totalCount, totalPages: $totalPages, hasNext: $hasNext, hasPrev: $hasPrev)';
}


}

/// @nodoc
abstract mixin class _$WarningMetaModelCopyWith<$Res> implements $WarningMetaModelCopyWith<$Res> {
  factory _$WarningMetaModelCopyWith(_WarningMetaModel value, $Res Function(_WarningMetaModel) _then) = __$WarningMetaModelCopyWithImpl;
@override @useResult
$Res call({
 int page, int limit, int totalCount, int totalPages, bool hasNext, bool hasPrev
});




}
/// @nodoc
class __$WarningMetaModelCopyWithImpl<$Res>
    implements _$WarningMetaModelCopyWith<$Res> {
  __$WarningMetaModelCopyWithImpl(this._self, this._then);

  final _WarningMetaModel _self;
  final $Res Function(_WarningMetaModel) _then;

/// Create a copy of WarningMetaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? limit = null,Object? totalCount = null,Object? totalPages = null,Object? hasNext = null,Object? hasPrev = null,}) {
  return _then(_WarningMetaModel(
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
