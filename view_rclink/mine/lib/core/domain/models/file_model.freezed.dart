// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FileModel {

 int get id; String get uid; String get fileName; String get s3Url; String get mimeType; int get size; int? get sequence; int get companyID; String get contextType; String? get contextField; int get uploadedByID; DateTime? get createdAt; DateTime? get updatedAt; bool get isSynced; DateTime? get deletedAt; String? get syncAction; int get syncRetryCount; String? get syncError; DateTime? get lastSyncAttempt;
/// Create a copy of FileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileModelCopyWith<FileModel> get copyWith => _$FileModelCopyWithImpl<FileModel>(this as FileModel, _$identity);

  /// Serializes this FileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.s3Url, s3Url) || other.s3Url == s3Url)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.size, size) || other.size == size)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.companyID, companyID) || other.companyID == companyID)&&(identical(other.contextType, contextType) || other.contextType == contextType)&&(identical(other.contextField, contextField) || other.contextField == contextField)&&(identical(other.uploadedByID, uploadedByID) || other.uploadedByID == uploadedByID)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isSynced, isSynced) || other.isSynced == isSynced)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.syncAction, syncAction) || other.syncAction == syncAction)&&(identical(other.syncRetryCount, syncRetryCount) || other.syncRetryCount == syncRetryCount)&&(identical(other.syncError, syncError) || other.syncError == syncError)&&(identical(other.lastSyncAttempt, lastSyncAttempt) || other.lastSyncAttempt == lastSyncAttempt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,uid,fileName,s3Url,mimeType,size,sequence,companyID,contextType,contextField,uploadedByID,createdAt,updatedAt,isSynced,deletedAt,syncAction,syncRetryCount,syncError,lastSyncAttempt]);

@override
String toString() {
  return 'FileModel(id: $id, uid: $uid, fileName: $fileName, s3Url: $s3Url, mimeType: $mimeType, size: $size, sequence: $sequence, companyID: $companyID, contextType: $contextType, contextField: $contextField, uploadedByID: $uploadedByID, createdAt: $createdAt, updatedAt: $updatedAt, isSynced: $isSynced, deletedAt: $deletedAt, syncAction: $syncAction, syncRetryCount: $syncRetryCount, syncError: $syncError, lastSyncAttempt: $lastSyncAttempt)';
}


}

/// @nodoc
abstract mixin class $FileModelCopyWith<$Res>  {
  factory $FileModelCopyWith(FileModel value, $Res Function(FileModel) _then) = _$FileModelCopyWithImpl;
@useResult
$Res call({
 int id, String uid, String fileName, String s3Url, String mimeType, int size, int? sequence, int companyID, String contextType, String? contextField, int uploadedByID, DateTime? createdAt, DateTime? updatedAt, bool isSynced, DateTime? deletedAt, String? syncAction, int syncRetryCount, String? syncError, DateTime? lastSyncAttempt
});




}
/// @nodoc
class _$FileModelCopyWithImpl<$Res>
    implements $FileModelCopyWith<$Res> {
  _$FileModelCopyWithImpl(this._self, this._then);

  final FileModel _self;
  final $Res Function(FileModel) _then;

/// Create a copy of FileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? uid = null,Object? fileName = null,Object? s3Url = null,Object? mimeType = null,Object? size = null,Object? sequence = freezed,Object? companyID = null,Object? contextType = null,Object? contextField = freezed,Object? uploadedByID = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? isSynced = null,Object? deletedAt = freezed,Object? syncAction = freezed,Object? syncRetryCount = null,Object? syncError = freezed,Object? lastSyncAttempt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,s3Url: null == s3Url ? _self.s3Url : s3Url // ignore: cast_nullable_to_non_nullable
as String,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,sequence: freezed == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int?,companyID: null == companyID ? _self.companyID : companyID // ignore: cast_nullable_to_non_nullable
as int,contextType: null == contextType ? _self.contextType : contextType // ignore: cast_nullable_to_non_nullable
as String,contextField: freezed == contextField ? _self.contextField : contextField // ignore: cast_nullable_to_non_nullable
as String?,uploadedByID: null == uploadedByID ? _self.uploadedByID : uploadedByID // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isSynced: null == isSynced ? _self.isSynced : isSynced // ignore: cast_nullable_to_non_nullable
as bool,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,syncAction: freezed == syncAction ? _self.syncAction : syncAction // ignore: cast_nullable_to_non_nullable
as String?,syncRetryCount: null == syncRetryCount ? _self.syncRetryCount : syncRetryCount // ignore: cast_nullable_to_non_nullable
as int,syncError: freezed == syncError ? _self.syncError : syncError // ignore: cast_nullable_to_non_nullable
as String?,lastSyncAttempt: freezed == lastSyncAttempt ? _self.lastSyncAttempt : lastSyncAttempt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [FileModel].
extension FileModelPatterns on FileModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FileModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FileModel value)  $default,){
final _that = this;
switch (_that) {
case _FileModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FileModel value)?  $default,){
final _that = this;
switch (_that) {
case _FileModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String uid,  String fileName,  String s3Url,  String mimeType,  int size,  int? sequence,  int companyID,  String contextType,  String? contextField,  int uploadedByID,  DateTime? createdAt,  DateTime? updatedAt,  bool isSynced,  DateTime? deletedAt,  String? syncAction,  int syncRetryCount,  String? syncError,  DateTime? lastSyncAttempt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FileModel() when $default != null:
return $default(_that.id,_that.uid,_that.fileName,_that.s3Url,_that.mimeType,_that.size,_that.sequence,_that.companyID,_that.contextType,_that.contextField,_that.uploadedByID,_that.createdAt,_that.updatedAt,_that.isSynced,_that.deletedAt,_that.syncAction,_that.syncRetryCount,_that.syncError,_that.lastSyncAttempt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String uid,  String fileName,  String s3Url,  String mimeType,  int size,  int? sequence,  int companyID,  String contextType,  String? contextField,  int uploadedByID,  DateTime? createdAt,  DateTime? updatedAt,  bool isSynced,  DateTime? deletedAt,  String? syncAction,  int syncRetryCount,  String? syncError,  DateTime? lastSyncAttempt)  $default,) {final _that = this;
switch (_that) {
case _FileModel():
return $default(_that.id,_that.uid,_that.fileName,_that.s3Url,_that.mimeType,_that.size,_that.sequence,_that.companyID,_that.contextType,_that.contextField,_that.uploadedByID,_that.createdAt,_that.updatedAt,_that.isSynced,_that.deletedAt,_that.syncAction,_that.syncRetryCount,_that.syncError,_that.lastSyncAttempt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String uid,  String fileName,  String s3Url,  String mimeType,  int size,  int? sequence,  int companyID,  String contextType,  String? contextField,  int uploadedByID,  DateTime? createdAt,  DateTime? updatedAt,  bool isSynced,  DateTime? deletedAt,  String? syncAction,  int syncRetryCount,  String? syncError,  DateTime? lastSyncAttempt)?  $default,) {final _that = this;
switch (_that) {
case _FileModel() when $default != null:
return $default(_that.id,_that.uid,_that.fileName,_that.s3Url,_that.mimeType,_that.size,_that.sequence,_that.companyID,_that.contextType,_that.contextField,_that.uploadedByID,_that.createdAt,_that.updatedAt,_that.isSynced,_that.deletedAt,_that.syncAction,_that.syncRetryCount,_that.syncError,_that.lastSyncAttempt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FileModel extends FileModel {
  const _FileModel({required this.id, required this.uid, required this.fileName, required this.s3Url, required this.mimeType, required this.size, this.sequence, required this.companyID, required this.contextType, this.contextField, required this.uploadedByID, this.createdAt, this.updatedAt, this.isSynced = false, this.deletedAt, this.syncAction, this.syncRetryCount = 0, this.syncError, this.lastSyncAttempt}): super._();
  factory _FileModel.fromJson(Map<String, dynamic> json) => _$FileModelFromJson(json);

@override final  int id;
@override final  String uid;
@override final  String fileName;
@override final  String s3Url;
@override final  String mimeType;
@override final  int size;
@override final  int? sequence;
@override final  int companyID;
@override final  String contextType;
@override final  String? contextField;
@override final  int uploadedByID;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override@JsonKey() final  bool isSynced;
@override final  DateTime? deletedAt;
@override final  String? syncAction;
@override@JsonKey() final  int syncRetryCount;
@override final  String? syncError;
@override final  DateTime? lastSyncAttempt;

/// Create a copy of FileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FileModelCopyWith<_FileModel> get copyWith => __$FileModelCopyWithImpl<_FileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FileModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.s3Url, s3Url) || other.s3Url == s3Url)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.size, size) || other.size == size)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.companyID, companyID) || other.companyID == companyID)&&(identical(other.contextType, contextType) || other.contextType == contextType)&&(identical(other.contextField, contextField) || other.contextField == contextField)&&(identical(other.uploadedByID, uploadedByID) || other.uploadedByID == uploadedByID)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isSynced, isSynced) || other.isSynced == isSynced)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.syncAction, syncAction) || other.syncAction == syncAction)&&(identical(other.syncRetryCount, syncRetryCount) || other.syncRetryCount == syncRetryCount)&&(identical(other.syncError, syncError) || other.syncError == syncError)&&(identical(other.lastSyncAttempt, lastSyncAttempt) || other.lastSyncAttempt == lastSyncAttempt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,uid,fileName,s3Url,mimeType,size,sequence,companyID,contextType,contextField,uploadedByID,createdAt,updatedAt,isSynced,deletedAt,syncAction,syncRetryCount,syncError,lastSyncAttempt]);

@override
String toString() {
  return 'FileModel(id: $id, uid: $uid, fileName: $fileName, s3Url: $s3Url, mimeType: $mimeType, size: $size, sequence: $sequence, companyID: $companyID, contextType: $contextType, contextField: $contextField, uploadedByID: $uploadedByID, createdAt: $createdAt, updatedAt: $updatedAt, isSynced: $isSynced, deletedAt: $deletedAt, syncAction: $syncAction, syncRetryCount: $syncRetryCount, syncError: $syncError, lastSyncAttempt: $lastSyncAttempt)';
}


}

/// @nodoc
abstract mixin class _$FileModelCopyWith<$Res> implements $FileModelCopyWith<$Res> {
  factory _$FileModelCopyWith(_FileModel value, $Res Function(_FileModel) _then) = __$FileModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String uid, String fileName, String s3Url, String mimeType, int size, int? sequence, int companyID, String contextType, String? contextField, int uploadedByID, DateTime? createdAt, DateTime? updatedAt, bool isSynced, DateTime? deletedAt, String? syncAction, int syncRetryCount, String? syncError, DateTime? lastSyncAttempt
});




}
/// @nodoc
class __$FileModelCopyWithImpl<$Res>
    implements _$FileModelCopyWith<$Res> {
  __$FileModelCopyWithImpl(this._self, this._then);

  final _FileModel _self;
  final $Res Function(_FileModel) _then;

/// Create a copy of FileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uid = null,Object? fileName = null,Object? s3Url = null,Object? mimeType = null,Object? size = null,Object? sequence = freezed,Object? companyID = null,Object? contextType = null,Object? contextField = freezed,Object? uploadedByID = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? isSynced = null,Object? deletedAt = freezed,Object? syncAction = freezed,Object? syncRetryCount = null,Object? syncError = freezed,Object? lastSyncAttempt = freezed,}) {
  return _then(_FileModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,s3Url: null == s3Url ? _self.s3Url : s3Url // ignore: cast_nullable_to_non_nullable
as String,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,sequence: freezed == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int?,companyID: null == companyID ? _self.companyID : companyID // ignore: cast_nullable_to_non_nullable
as int,contextType: null == contextType ? _self.contextType : contextType // ignore: cast_nullable_to_non_nullable
as String,contextField: freezed == contextField ? _self.contextField : contextField // ignore: cast_nullable_to_non_nullable
as String?,uploadedByID: null == uploadedByID ? _self.uploadedByID : uploadedByID // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isSynced: null == isSynced ? _self.isSynced : isSynced // ignore: cast_nullable_to_non_nullable
as bool,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,syncAction: freezed == syncAction ? _self.syncAction : syncAction // ignore: cast_nullable_to_non_nullable
as String?,syncRetryCount: null == syncRetryCount ? _self.syncRetryCount : syncRetryCount // ignore: cast_nullable_to_non_nullable
as int,syncError: freezed == syncError ? _self.syncError : syncError // ignore: cast_nullable_to_non_nullable
as String?,lastSyncAttempt: freezed == lastSyncAttempt ? _self.lastSyncAttempt : lastSyncAttempt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
