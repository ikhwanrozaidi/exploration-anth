// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'warning_daily_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WarningDailyReportModel {

 int get id; String get uid; String get name; DateTime get createdAt; String get status; bool get workPerformed; List<WarningEquipmentModel> get reportEquipments; List<ReportQuantitiesModel> get reportQuantities;
/// Create a copy of WarningDailyReportModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WarningDailyReportModelCopyWith<WarningDailyReportModel> get copyWith => _$WarningDailyReportModelCopyWithImpl<WarningDailyReportModel>(this as WarningDailyReportModel, _$identity);

  /// Serializes this WarningDailyReportModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarningDailyReportModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.workPerformed, workPerformed) || other.workPerformed == workPerformed)&&const DeepCollectionEquality().equals(other.reportEquipments, reportEquipments)&&const DeepCollectionEquality().equals(other.reportQuantities, reportQuantities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,createdAt,status,workPerformed,const DeepCollectionEquality().hash(reportEquipments),const DeepCollectionEquality().hash(reportQuantities));

@override
String toString() {
  return 'WarningDailyReportModel(id: $id, uid: $uid, name: $name, createdAt: $createdAt, status: $status, workPerformed: $workPerformed, reportEquipments: $reportEquipments, reportQuantities: $reportQuantities)';
}


}

/// @nodoc
abstract mixin class $WarningDailyReportModelCopyWith<$Res>  {
  factory $WarningDailyReportModelCopyWith(WarningDailyReportModel value, $Res Function(WarningDailyReportModel) _then) = _$WarningDailyReportModelCopyWithImpl;
@useResult
$Res call({
 int id, String uid, String name, DateTime createdAt, String status, bool workPerformed, List<WarningEquipmentModel> reportEquipments, List<ReportQuantitiesModel> reportQuantities
});




}
/// @nodoc
class _$WarningDailyReportModelCopyWithImpl<$Res>
    implements $WarningDailyReportModelCopyWith<$Res> {
  _$WarningDailyReportModelCopyWithImpl(this._self, this._then);

  final WarningDailyReportModel _self;
  final $Res Function(WarningDailyReportModel) _then;

/// Create a copy of WarningDailyReportModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? uid = null,Object? name = null,Object? createdAt = null,Object? status = null,Object? workPerformed = null,Object? reportEquipments = null,Object? reportQuantities = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,workPerformed: null == workPerformed ? _self.workPerformed : workPerformed // ignore: cast_nullable_to_non_nullable
as bool,reportEquipments: null == reportEquipments ? _self.reportEquipments : reportEquipments // ignore: cast_nullable_to_non_nullable
as List<WarningEquipmentModel>,reportQuantities: null == reportQuantities ? _self.reportQuantities : reportQuantities // ignore: cast_nullable_to_non_nullable
as List<ReportQuantitiesModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [WarningDailyReportModel].
extension WarningDailyReportModelPatterns on WarningDailyReportModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WarningDailyReportModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WarningDailyReportModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WarningDailyReportModel value)  $default,){
final _that = this;
switch (_that) {
case _WarningDailyReportModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WarningDailyReportModel value)?  $default,){
final _that = this;
switch (_that) {
case _WarningDailyReportModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String uid,  String name,  DateTime createdAt,  String status,  bool workPerformed,  List<WarningEquipmentModel> reportEquipments,  List<ReportQuantitiesModel> reportQuantities)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WarningDailyReportModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.createdAt,_that.status,_that.workPerformed,_that.reportEquipments,_that.reportQuantities);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String uid,  String name,  DateTime createdAt,  String status,  bool workPerformed,  List<WarningEquipmentModel> reportEquipments,  List<ReportQuantitiesModel> reportQuantities)  $default,) {final _that = this;
switch (_that) {
case _WarningDailyReportModel():
return $default(_that.id,_that.uid,_that.name,_that.createdAt,_that.status,_that.workPerformed,_that.reportEquipments,_that.reportQuantities);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String uid,  String name,  DateTime createdAt,  String status,  bool workPerformed,  List<WarningEquipmentModel> reportEquipments,  List<ReportQuantitiesModel> reportQuantities)?  $default,) {final _that = this;
switch (_that) {
case _WarningDailyReportModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.createdAt,_that.status,_that.workPerformed,_that.reportEquipments,_that.reportQuantities);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WarningDailyReportModel extends WarningDailyReportModel {
  const _WarningDailyReportModel({required this.id, required this.uid, required this.name, required this.createdAt, required this.status, required this.workPerformed, final  List<WarningEquipmentModel> reportEquipments = const [], final  List<ReportQuantitiesModel> reportQuantities = const []}): _reportEquipments = reportEquipments,_reportQuantities = reportQuantities,super._();
  factory _WarningDailyReportModel.fromJson(Map<String, dynamic> json) => _$WarningDailyReportModelFromJson(json);

@override final  int id;
@override final  String uid;
@override final  String name;
@override final  DateTime createdAt;
@override final  String status;
@override final  bool workPerformed;
 final  List<WarningEquipmentModel> _reportEquipments;
@override@JsonKey() List<WarningEquipmentModel> get reportEquipments {
  if (_reportEquipments is EqualUnmodifiableListView) return _reportEquipments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reportEquipments);
}

 final  List<ReportQuantitiesModel> _reportQuantities;
@override@JsonKey() List<ReportQuantitiesModel> get reportQuantities {
  if (_reportQuantities is EqualUnmodifiableListView) return _reportQuantities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reportQuantities);
}


/// Create a copy of WarningDailyReportModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WarningDailyReportModelCopyWith<_WarningDailyReportModel> get copyWith => __$WarningDailyReportModelCopyWithImpl<_WarningDailyReportModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WarningDailyReportModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WarningDailyReportModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.workPerformed, workPerformed) || other.workPerformed == workPerformed)&&const DeepCollectionEquality().equals(other._reportEquipments, _reportEquipments)&&const DeepCollectionEquality().equals(other._reportQuantities, _reportQuantities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,createdAt,status,workPerformed,const DeepCollectionEquality().hash(_reportEquipments),const DeepCollectionEquality().hash(_reportQuantities));

@override
String toString() {
  return 'WarningDailyReportModel(id: $id, uid: $uid, name: $name, createdAt: $createdAt, status: $status, workPerformed: $workPerformed, reportEquipments: $reportEquipments, reportQuantities: $reportQuantities)';
}


}

/// @nodoc
abstract mixin class _$WarningDailyReportModelCopyWith<$Res> implements $WarningDailyReportModelCopyWith<$Res> {
  factory _$WarningDailyReportModelCopyWith(_WarningDailyReportModel value, $Res Function(_WarningDailyReportModel) _then) = __$WarningDailyReportModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String uid, String name, DateTime createdAt, String status, bool workPerformed, List<WarningEquipmentModel> reportEquipments, List<ReportQuantitiesModel> reportQuantities
});




}
/// @nodoc
class __$WarningDailyReportModelCopyWithImpl<$Res>
    implements _$WarningDailyReportModelCopyWith<$Res> {
  __$WarningDailyReportModelCopyWithImpl(this._self, this._then);

  final _WarningDailyReportModel _self;
  final $Res Function(_WarningDailyReportModel) _then;

/// Create a copy of WarningDailyReportModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uid = null,Object? name = null,Object? createdAt = null,Object? status = null,Object? workPerformed = null,Object? reportEquipments = null,Object? reportQuantities = null,}) {
  return _then(_WarningDailyReportModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,workPerformed: null == workPerformed ? _self.workPerformed : workPerformed // ignore: cast_nullable_to_non_nullable
as bool,reportEquipments: null == reportEquipments ? _self._reportEquipments : reportEquipments // ignore: cast_nullable_to_non_nullable
as List<WarningEquipmentModel>,reportQuantities: null == reportQuantities ? _self._reportQuantities : reportQuantities // ignore: cast_nullable_to_non_nullable
as List<ReportQuantitiesModel>,
  ));
}


}

// dart format on
