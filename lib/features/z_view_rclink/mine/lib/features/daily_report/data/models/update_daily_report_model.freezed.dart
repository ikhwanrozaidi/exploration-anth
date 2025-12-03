// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_daily_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateDailyReportModel {

/// Report name/title
 String? get name;/// Additional notes for the report
 String? get notes;/// Weather condition during work
 WeatherCondition? get weatherCondition;/// Whether work was performed on this day
 bool? get workPerformed;/// Work scope UID
 String? get workScopeUID;/// Road UID where work was performed
 String? get roadUID;/// Total number of workers
 int? get totalWorkers;/// From section (KM)
 double? get fromSection;/// To section (KM)
 double? get toSection;/// Longitude coordinate of the work location
 double? get longitude;/// Latitude coordinate of the work location
 double? get latitude;/// Report status
 String? get status;/// Rejection reason
 String? get rejectionReason;/// Equipment UIDs (replaces all existing equipment)
 List<String>? get equipments;/// Work quantities for this report (replaces all existing quantities)
 List<CreateDailyReportQuantityModel>? get quantities;
/// Create a copy of UpdateDailyReportModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateDailyReportModelCopyWith<UpdateDailyReportModel> get copyWith => _$UpdateDailyReportModelCopyWithImpl<UpdateDailyReportModel>(this as UpdateDailyReportModel, _$identity);

  /// Serializes this UpdateDailyReportModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateDailyReportModel&&(identical(other.name, name) || other.name == name)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.weatherCondition, weatherCondition) || other.weatherCondition == weatherCondition)&&(identical(other.workPerformed, workPerformed) || other.workPerformed == workPerformed)&&(identical(other.workScopeUID, workScopeUID) || other.workScopeUID == workScopeUID)&&(identical(other.roadUID, roadUID) || other.roadUID == roadUID)&&(identical(other.totalWorkers, totalWorkers) || other.totalWorkers == totalWorkers)&&(identical(other.fromSection, fromSection) || other.fromSection == fromSection)&&(identical(other.toSection, toSection) || other.toSection == toSection)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.status, status) || other.status == status)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&const DeepCollectionEquality().equals(other.equipments, equipments)&&const DeepCollectionEquality().equals(other.quantities, quantities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,notes,weatherCondition,workPerformed,workScopeUID,roadUID,totalWorkers,fromSection,toSection,longitude,latitude,status,rejectionReason,const DeepCollectionEquality().hash(equipments),const DeepCollectionEquality().hash(quantities));

@override
String toString() {
  return 'UpdateDailyReportModel(name: $name, notes: $notes, weatherCondition: $weatherCondition, workPerformed: $workPerformed, workScopeUID: $workScopeUID, roadUID: $roadUID, totalWorkers: $totalWorkers, fromSection: $fromSection, toSection: $toSection, longitude: $longitude, latitude: $latitude, status: $status, rejectionReason: $rejectionReason, equipments: $equipments, quantities: $quantities)';
}


}

/// @nodoc
abstract mixin class $UpdateDailyReportModelCopyWith<$Res>  {
  factory $UpdateDailyReportModelCopyWith(UpdateDailyReportModel value, $Res Function(UpdateDailyReportModel) _then) = _$UpdateDailyReportModelCopyWithImpl;
@useResult
$Res call({
 String? name, String? notes, WeatherCondition? weatherCondition, bool? workPerformed, String? workScopeUID, String? roadUID, int? totalWorkers, double? fromSection, double? toSection, double? longitude, double? latitude, String? status, String? rejectionReason, List<String>? equipments, List<CreateDailyReportQuantityModel>? quantities
});




}
/// @nodoc
class _$UpdateDailyReportModelCopyWithImpl<$Res>
    implements $UpdateDailyReportModelCopyWith<$Res> {
  _$UpdateDailyReportModelCopyWithImpl(this._self, this._then);

  final UpdateDailyReportModel _self;
  final $Res Function(UpdateDailyReportModel) _then;

/// Create a copy of UpdateDailyReportModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? notes = freezed,Object? weatherCondition = freezed,Object? workPerformed = freezed,Object? workScopeUID = freezed,Object? roadUID = freezed,Object? totalWorkers = freezed,Object? fromSection = freezed,Object? toSection = freezed,Object? longitude = freezed,Object? latitude = freezed,Object? status = freezed,Object? rejectionReason = freezed,Object? equipments = freezed,Object? quantities = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,weatherCondition: freezed == weatherCondition ? _self.weatherCondition : weatherCondition // ignore: cast_nullable_to_non_nullable
as WeatherCondition?,workPerformed: freezed == workPerformed ? _self.workPerformed : workPerformed // ignore: cast_nullable_to_non_nullable
as bool?,workScopeUID: freezed == workScopeUID ? _self.workScopeUID : workScopeUID // ignore: cast_nullable_to_non_nullable
as String?,roadUID: freezed == roadUID ? _self.roadUID : roadUID // ignore: cast_nullable_to_non_nullable
as String?,totalWorkers: freezed == totalWorkers ? _self.totalWorkers : totalWorkers // ignore: cast_nullable_to_non_nullable
as int?,fromSection: freezed == fromSection ? _self.fromSection : fromSection // ignore: cast_nullable_to_non_nullable
as double?,toSection: freezed == toSection ? _self.toSection : toSection // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,equipments: freezed == equipments ? _self.equipments : equipments // ignore: cast_nullable_to_non_nullable
as List<String>?,quantities: freezed == quantities ? _self.quantities : quantities // ignore: cast_nullable_to_non_nullable
as List<CreateDailyReportQuantityModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateDailyReportModel].
extension UpdateDailyReportModelPatterns on UpdateDailyReportModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateDailyReportModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateDailyReportModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateDailyReportModel value)  $default,){
final _that = this;
switch (_that) {
case _UpdateDailyReportModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateDailyReportModel value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateDailyReportModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? notes,  WeatherCondition? weatherCondition,  bool? workPerformed,  String? workScopeUID,  String? roadUID,  int? totalWorkers,  double? fromSection,  double? toSection,  double? longitude,  double? latitude,  String? status,  String? rejectionReason,  List<String>? equipments,  List<CreateDailyReportQuantityModel>? quantities)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateDailyReportModel() when $default != null:
return $default(_that.name,_that.notes,_that.weatherCondition,_that.workPerformed,_that.workScopeUID,_that.roadUID,_that.totalWorkers,_that.fromSection,_that.toSection,_that.longitude,_that.latitude,_that.status,_that.rejectionReason,_that.equipments,_that.quantities);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? notes,  WeatherCondition? weatherCondition,  bool? workPerformed,  String? workScopeUID,  String? roadUID,  int? totalWorkers,  double? fromSection,  double? toSection,  double? longitude,  double? latitude,  String? status,  String? rejectionReason,  List<String>? equipments,  List<CreateDailyReportQuantityModel>? quantities)  $default,) {final _that = this;
switch (_that) {
case _UpdateDailyReportModel():
return $default(_that.name,_that.notes,_that.weatherCondition,_that.workPerformed,_that.workScopeUID,_that.roadUID,_that.totalWorkers,_that.fromSection,_that.toSection,_that.longitude,_that.latitude,_that.status,_that.rejectionReason,_that.equipments,_that.quantities);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? notes,  WeatherCondition? weatherCondition,  bool? workPerformed,  String? workScopeUID,  String? roadUID,  int? totalWorkers,  double? fromSection,  double? toSection,  double? longitude,  double? latitude,  String? status,  String? rejectionReason,  List<String>? equipments,  List<CreateDailyReportQuantityModel>? quantities)?  $default,) {final _that = this;
switch (_that) {
case _UpdateDailyReportModel() when $default != null:
return $default(_that.name,_that.notes,_that.weatherCondition,_that.workPerformed,_that.workScopeUID,_that.roadUID,_that.totalWorkers,_that.fromSection,_that.toSection,_that.longitude,_that.latitude,_that.status,_that.rejectionReason,_that.equipments,_that.quantities);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateDailyReportModel implements UpdateDailyReportModel {
  const _UpdateDailyReportModel({this.name, this.notes, this.weatherCondition, this.workPerformed, this.workScopeUID, this.roadUID, this.totalWorkers, this.fromSection, this.toSection, this.longitude, this.latitude, this.status, this.rejectionReason, final  List<String>? equipments, final  List<CreateDailyReportQuantityModel>? quantities}): _equipments = equipments,_quantities = quantities;
  factory _UpdateDailyReportModel.fromJson(Map<String, dynamic> json) => _$UpdateDailyReportModelFromJson(json);

/// Report name/title
@override final  String? name;
/// Additional notes for the report
@override final  String? notes;
/// Weather condition during work
@override final  WeatherCondition? weatherCondition;
/// Whether work was performed on this day
@override final  bool? workPerformed;
/// Work scope UID
@override final  String? workScopeUID;
/// Road UID where work was performed
@override final  String? roadUID;
/// Total number of workers
@override final  int? totalWorkers;
/// From section (KM)
@override final  double? fromSection;
/// To section (KM)
@override final  double? toSection;
/// Longitude coordinate of the work location
@override final  double? longitude;
/// Latitude coordinate of the work location
@override final  double? latitude;
/// Report status
@override final  String? status;
/// Rejection reason
@override final  String? rejectionReason;
/// Equipment UIDs (replaces all existing equipment)
 final  List<String>? _equipments;
/// Equipment UIDs (replaces all existing equipment)
@override List<String>? get equipments {
  final value = _equipments;
  if (value == null) return null;
  if (_equipments is EqualUnmodifiableListView) return _equipments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// Work quantities for this report (replaces all existing quantities)
 final  List<CreateDailyReportQuantityModel>? _quantities;
/// Work quantities for this report (replaces all existing quantities)
@override List<CreateDailyReportQuantityModel>? get quantities {
  final value = _quantities;
  if (value == null) return null;
  if (_quantities is EqualUnmodifiableListView) return _quantities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of UpdateDailyReportModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateDailyReportModelCopyWith<_UpdateDailyReportModel> get copyWith => __$UpdateDailyReportModelCopyWithImpl<_UpdateDailyReportModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateDailyReportModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateDailyReportModel&&(identical(other.name, name) || other.name == name)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.weatherCondition, weatherCondition) || other.weatherCondition == weatherCondition)&&(identical(other.workPerformed, workPerformed) || other.workPerformed == workPerformed)&&(identical(other.workScopeUID, workScopeUID) || other.workScopeUID == workScopeUID)&&(identical(other.roadUID, roadUID) || other.roadUID == roadUID)&&(identical(other.totalWorkers, totalWorkers) || other.totalWorkers == totalWorkers)&&(identical(other.fromSection, fromSection) || other.fromSection == fromSection)&&(identical(other.toSection, toSection) || other.toSection == toSection)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.status, status) || other.status == status)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&const DeepCollectionEquality().equals(other._equipments, _equipments)&&const DeepCollectionEquality().equals(other._quantities, _quantities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,notes,weatherCondition,workPerformed,workScopeUID,roadUID,totalWorkers,fromSection,toSection,longitude,latitude,status,rejectionReason,const DeepCollectionEquality().hash(_equipments),const DeepCollectionEquality().hash(_quantities));

@override
String toString() {
  return 'UpdateDailyReportModel(name: $name, notes: $notes, weatherCondition: $weatherCondition, workPerformed: $workPerformed, workScopeUID: $workScopeUID, roadUID: $roadUID, totalWorkers: $totalWorkers, fromSection: $fromSection, toSection: $toSection, longitude: $longitude, latitude: $latitude, status: $status, rejectionReason: $rejectionReason, equipments: $equipments, quantities: $quantities)';
}


}

/// @nodoc
abstract mixin class _$UpdateDailyReportModelCopyWith<$Res> implements $UpdateDailyReportModelCopyWith<$Res> {
  factory _$UpdateDailyReportModelCopyWith(_UpdateDailyReportModel value, $Res Function(_UpdateDailyReportModel) _then) = __$UpdateDailyReportModelCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? notes, WeatherCondition? weatherCondition, bool? workPerformed, String? workScopeUID, String? roadUID, int? totalWorkers, double? fromSection, double? toSection, double? longitude, double? latitude, String? status, String? rejectionReason, List<String>? equipments, List<CreateDailyReportQuantityModel>? quantities
});




}
/// @nodoc
class __$UpdateDailyReportModelCopyWithImpl<$Res>
    implements _$UpdateDailyReportModelCopyWith<$Res> {
  __$UpdateDailyReportModelCopyWithImpl(this._self, this._then);

  final _UpdateDailyReportModel _self;
  final $Res Function(_UpdateDailyReportModel) _then;

/// Create a copy of UpdateDailyReportModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? notes = freezed,Object? weatherCondition = freezed,Object? workPerformed = freezed,Object? workScopeUID = freezed,Object? roadUID = freezed,Object? totalWorkers = freezed,Object? fromSection = freezed,Object? toSection = freezed,Object? longitude = freezed,Object? latitude = freezed,Object? status = freezed,Object? rejectionReason = freezed,Object? equipments = freezed,Object? quantities = freezed,}) {
  return _then(_UpdateDailyReportModel(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,weatherCondition: freezed == weatherCondition ? _self.weatherCondition : weatherCondition // ignore: cast_nullable_to_non_nullable
as WeatherCondition?,workPerformed: freezed == workPerformed ? _self.workPerformed : workPerformed // ignore: cast_nullable_to_non_nullable
as bool?,workScopeUID: freezed == workScopeUID ? _self.workScopeUID : workScopeUID // ignore: cast_nullable_to_non_nullable
as String?,roadUID: freezed == roadUID ? _self.roadUID : roadUID // ignore: cast_nullable_to_non_nullable
as String?,totalWorkers: freezed == totalWorkers ? _self.totalWorkers : totalWorkers // ignore: cast_nullable_to_non_nullable
as int?,fromSection: freezed == fromSection ? _self.fromSection : fromSection // ignore: cast_nullable_to_non_nullable
as double?,toSection: freezed == toSection ? _self.toSection : toSection // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,equipments: freezed == equipments ? _self._equipments : equipments // ignore: cast_nullable_to_non_nullable
as List<String>?,quantities: freezed == quantities ? _self._quantities : quantities // ignore: cast_nullable_to_non_nullable
as List<CreateDailyReportQuantityModel>?,
  ));
}


}

// dart format on
