// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FileResponseDto {

 String get uid; String get fileName; String get s3Key; String get s3Url; String get mimeType; int get size; int get sequence; String get contextField;
/// Create a copy of FileResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileResponseDtoCopyWith<FileResponseDto> get copyWith => _$FileResponseDtoCopyWithImpl<FileResponseDto>(this as FileResponseDto, _$identity);

  /// Serializes this FileResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileResponseDto&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.s3Key, s3Key) || other.s3Key == s3Key)&&(identical(other.s3Url, s3Url) || other.s3Url == s3Url)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.size, size) || other.size == size)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.contextField, contextField) || other.contextField == contextField));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,fileName,s3Key,s3Url,mimeType,size,sequence,contextField);

@override
String toString() {
  return 'FileResponseDto(uid: $uid, fileName: $fileName, s3Key: $s3Key, s3Url: $s3Url, mimeType: $mimeType, size: $size, sequence: $sequence, contextField: $contextField)';
}


}

/// @nodoc
abstract mixin class $FileResponseDtoCopyWith<$Res>  {
  factory $FileResponseDtoCopyWith(FileResponseDto value, $Res Function(FileResponseDto) _then) = _$FileResponseDtoCopyWithImpl;
@useResult
$Res call({
 String uid, String fileName, String s3Key, String s3Url, String mimeType, int size, int sequence, String contextField
});




}
/// @nodoc
class _$FileResponseDtoCopyWithImpl<$Res>
    implements $FileResponseDtoCopyWith<$Res> {
  _$FileResponseDtoCopyWithImpl(this._self, this._then);

  final FileResponseDto _self;
  final $Res Function(FileResponseDto) _then;

/// Create a copy of FileResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? fileName = null,Object? s3Key = null,Object? s3Url = null,Object? mimeType = null,Object? size = null,Object? sequence = null,Object? contextField = null,}) {
  return _then(_self.copyWith(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,s3Key: null == s3Key ? _self.s3Key : s3Key // ignore: cast_nullable_to_non_nullable
as String,s3Url: null == s3Url ? _self.s3Url : s3Url // ignore: cast_nullable_to_non_nullable
as String,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int,contextField: null == contextField ? _self.contextField : contextField // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FileResponseDto].
extension FileResponseDtoPatterns on FileResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FileResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FileResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FileResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _FileResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FileResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _FileResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uid,  String fileName,  String s3Key,  String s3Url,  String mimeType,  int size,  int sequence,  String contextField)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FileResponseDto() when $default != null:
return $default(_that.uid,_that.fileName,_that.s3Key,_that.s3Url,_that.mimeType,_that.size,_that.sequence,_that.contextField);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uid,  String fileName,  String s3Key,  String s3Url,  String mimeType,  int size,  int sequence,  String contextField)  $default,) {final _that = this;
switch (_that) {
case _FileResponseDto():
return $default(_that.uid,_that.fileName,_that.s3Key,_that.s3Url,_that.mimeType,_that.size,_that.sequence,_that.contextField);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uid,  String fileName,  String s3Key,  String s3Url,  String mimeType,  int size,  int sequence,  String contextField)?  $default,) {final _that = this;
switch (_that) {
case _FileResponseDto() when $default != null:
return $default(_that.uid,_that.fileName,_that.s3Key,_that.s3Url,_that.mimeType,_that.size,_that.sequence,_that.contextField);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FileResponseDto implements FileResponseDto {
  const _FileResponseDto({required this.uid, required this.fileName, required this.s3Key, required this.s3Url, required this.mimeType, required this.size, required this.sequence, required this.contextField});
  factory _FileResponseDto.fromJson(Map<String, dynamic> json) => _$FileResponseDtoFromJson(json);

@override final  String uid;
@override final  String fileName;
@override final  String s3Key;
@override final  String s3Url;
@override final  String mimeType;
@override final  int size;
@override final  int sequence;
@override final  String contextField;

/// Create a copy of FileResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FileResponseDtoCopyWith<_FileResponseDto> get copyWith => __$FileResponseDtoCopyWithImpl<_FileResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FileResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FileResponseDto&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.s3Key, s3Key) || other.s3Key == s3Key)&&(identical(other.s3Url, s3Url) || other.s3Url == s3Url)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.size, size) || other.size == size)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.contextField, contextField) || other.contextField == contextField));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,fileName,s3Key,s3Url,mimeType,size,sequence,contextField);

@override
String toString() {
  return 'FileResponseDto(uid: $uid, fileName: $fileName, s3Key: $s3Key, s3Url: $s3Url, mimeType: $mimeType, size: $size, sequence: $sequence, contextField: $contextField)';
}


}

/// @nodoc
abstract mixin class _$FileResponseDtoCopyWith<$Res> implements $FileResponseDtoCopyWith<$Res> {
  factory _$FileResponseDtoCopyWith(_FileResponseDto value, $Res Function(_FileResponseDto) _then) = __$FileResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 String uid, String fileName, String s3Key, String s3Url, String mimeType, int size, int sequence, String contextField
});




}
/// @nodoc
class __$FileResponseDtoCopyWithImpl<$Res>
    implements _$FileResponseDtoCopyWith<$Res> {
  __$FileResponseDtoCopyWithImpl(this._self, this._then);

  final _FileResponseDto _self;
  final $Res Function(_FileResponseDto) _then;

/// Create a copy of FileResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? fileName = null,Object? s3Key = null,Object? s3Url = null,Object? mimeType = null,Object? size = null,Object? sequence = null,Object? contextField = null,}) {
  return _then(_FileResponseDto(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,s3Key: null == s3Key ? _self.s3Key : s3Key // ignore: cast_nullable_to_non_nullable
as String,s3Url: null == s3Url ? _self.s3Url : s3Url // ignore: cast_nullable_to_non_nullable
as String,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int,contextField: null == contextField ? _self.contextField : contextField // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$BatchFileUploadResponseDto {

 List<FileResponseDto> get files; int get totalCount;
/// Create a copy of BatchFileUploadResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BatchFileUploadResponseDtoCopyWith<BatchFileUploadResponseDto> get copyWith => _$BatchFileUploadResponseDtoCopyWithImpl<BatchFileUploadResponseDto>(this as BatchFileUploadResponseDto, _$identity);

  /// Serializes this BatchFileUploadResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BatchFileUploadResponseDto&&const DeepCollectionEquality().equals(other.files, files)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(files),totalCount);

@override
String toString() {
  return 'BatchFileUploadResponseDto(files: $files, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class $BatchFileUploadResponseDtoCopyWith<$Res>  {
  factory $BatchFileUploadResponseDtoCopyWith(BatchFileUploadResponseDto value, $Res Function(BatchFileUploadResponseDto) _then) = _$BatchFileUploadResponseDtoCopyWithImpl;
@useResult
$Res call({
 List<FileResponseDto> files, int totalCount
});




}
/// @nodoc
class _$BatchFileUploadResponseDtoCopyWithImpl<$Res>
    implements $BatchFileUploadResponseDtoCopyWith<$Res> {
  _$BatchFileUploadResponseDtoCopyWithImpl(this._self, this._then);

  final BatchFileUploadResponseDto _self;
  final $Res Function(BatchFileUploadResponseDto) _then;

/// Create a copy of BatchFileUploadResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? files = null,Object? totalCount = null,}) {
  return _then(_self.copyWith(
files: null == files ? _self.files : files // ignore: cast_nullable_to_non_nullable
as List<FileResponseDto>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BatchFileUploadResponseDto].
extension BatchFileUploadResponseDtoPatterns on BatchFileUploadResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BatchFileUploadResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BatchFileUploadResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BatchFileUploadResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _BatchFileUploadResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BatchFileUploadResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _BatchFileUploadResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<FileResponseDto> files,  int totalCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BatchFileUploadResponseDto() when $default != null:
return $default(_that.files,_that.totalCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<FileResponseDto> files,  int totalCount)  $default,) {final _that = this;
switch (_that) {
case _BatchFileUploadResponseDto():
return $default(_that.files,_that.totalCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<FileResponseDto> files,  int totalCount)?  $default,) {final _that = this;
switch (_that) {
case _BatchFileUploadResponseDto() when $default != null:
return $default(_that.files,_that.totalCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BatchFileUploadResponseDto implements BatchFileUploadResponseDto {
  const _BatchFileUploadResponseDto({required final  List<FileResponseDto> files, required this.totalCount}): _files = files;
  factory _BatchFileUploadResponseDto.fromJson(Map<String, dynamic> json) => _$BatchFileUploadResponseDtoFromJson(json);

 final  List<FileResponseDto> _files;
@override List<FileResponseDto> get files {
  if (_files is EqualUnmodifiableListView) return _files;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_files);
}

@override final  int totalCount;

/// Create a copy of BatchFileUploadResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BatchFileUploadResponseDtoCopyWith<_BatchFileUploadResponseDto> get copyWith => __$BatchFileUploadResponseDtoCopyWithImpl<_BatchFileUploadResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BatchFileUploadResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BatchFileUploadResponseDto&&const DeepCollectionEquality().equals(other._files, _files)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_files),totalCount);

@override
String toString() {
  return 'BatchFileUploadResponseDto(files: $files, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class _$BatchFileUploadResponseDtoCopyWith<$Res> implements $BatchFileUploadResponseDtoCopyWith<$Res> {
  factory _$BatchFileUploadResponseDtoCopyWith(_BatchFileUploadResponseDto value, $Res Function(_BatchFileUploadResponseDto) _then) = __$BatchFileUploadResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 List<FileResponseDto> files, int totalCount
});




}
/// @nodoc
class __$BatchFileUploadResponseDtoCopyWithImpl<$Res>
    implements _$BatchFileUploadResponseDtoCopyWith<$Res> {
  __$BatchFileUploadResponseDtoCopyWithImpl(this._self, this._then);

  final _BatchFileUploadResponseDto _self;
  final $Res Function(_BatchFileUploadResponseDto) _then;

/// Create a copy of BatchFileUploadResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? files = null,Object? totalCount = null,}) {
  return _then(_BatchFileUploadResponseDto(
files: null == files ? _self._files : files // ignore: cast_nullable_to_non_nullable
as List<FileResponseDto>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
