// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_daily_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateDailyReportModel {

/// Report name/title
 String get name;/// Additional notes for the report
 String? get notes;/// Weather condition during work
 WeatherCondition get weatherCondition;/// Whether work was performed on this day
 bool get workPerformed;/// Work scope UID
 String get workScopeUID;/// Road UID where work was performed
 String get roadUID;/// Total number of workers
 int? get totalWorkers;/// From section (KM)
 double? get fromSection;/// To section (KM)
 double? get toSection;/// Longitude coordinate of the work location
 double? get longitude;/// Latitude coordinate of the work location
 double? get latitude;/// Equipment used in this report
 List<CreateDailyReportEquipmentModel>? get equipments;/// Work quantities for this report
 List<CreateDailyReportQuantityModel>? get quantities;
/// Create a copy of CreateDailyReportModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateDailyReportModelCopyWith<CreateDailyReportModel> get copyWith => _$CreateDailyReportModelCopyWithImpl<CreateDailyReportModel>(this as CreateDailyReportModel, _$identity);

  /// Serializes this CreateDailyReportModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateDailyReportModel&&(identical(other.name, name) || other.name == name)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.weatherCondition, weatherCondition) || other.weatherCondition == weatherCondition)&&(identical(other.workPerformed, workPerformed) || other.workPerformed == workPerformed)&&(identical(other.workScopeUID, workScopeUID) || other.workScopeUID == workScopeUID)&&(identical(other.roadUID, roadUID) || other.roadUID == roadUID)&&(identical(other.totalWorkers, totalWorkers) || other.totalWorkers == totalWorkers)&&(identical(other.fromSection, fromSection) || other.fromSection == fromSection)&&(identical(other.toSection, toSection) || other.toSection == toSection)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&const DeepCollectionEquality().equals(other.equipments, equipments)&&const DeepCollectionEquality().equals(other.quantities, quantities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,notes,weatherCondition,workPerformed,workScopeUID,roadUID,totalWorkers,fromSection,toSection,longitude,latitude,const DeepCollectionEquality().hash(equipments),const DeepCollectionEquality().hash(quantities));

@override
String toString() {
  return 'CreateDailyReportModel(name: $name, notes: $notes, weatherCondition: $weatherCondition, workPerformed: $workPerformed, workScopeUID: $workScopeUID, roadUID: $roadUID, totalWorkers: $totalWorkers, fromSection: $fromSection, toSection: $toSection, longitude: $longitude, latitude: $latitude, equipments: $equipments, quantities: $quantities)';
}


}

/// @nodoc
abstract mixin class $CreateDailyReportModelCopyWith<$Res>  {
  factory $CreateDailyReportModelCopyWith(CreateDailyReportModel value, $Res Function(CreateDailyReportModel) _then) = _$CreateDailyReportModelCopyWithImpl;
@useResult
$Res call({
 String name, String? notes, WeatherCondition weatherCondition, bool workPerformed, String workScopeUID, String roadUID, int? totalWorkers, double? fromSection, double? toSection, double? longitude, double? latitude, List<CreateDailyReportEquipmentModel>? equipments, List<CreateDailyReportQuantityModel>? quantities
});




}
/// @nodoc
class _$CreateDailyReportModelCopyWithImpl<$Res>
    implements $CreateDailyReportModelCopyWith<$Res> {
  _$CreateDailyReportModelCopyWithImpl(this._self, this._then);

  final CreateDailyReportModel _self;
  final $Res Function(CreateDailyReportModel) _then;

/// Create a copy of CreateDailyReportModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? notes = freezed,Object? weatherCondition = null,Object? workPerformed = null,Object? workScopeUID = null,Object? roadUID = null,Object? totalWorkers = freezed,Object? fromSection = freezed,Object? toSection = freezed,Object? longitude = freezed,Object? latitude = freezed,Object? equipments = freezed,Object? quantities = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,weatherCondition: null == weatherCondition ? _self.weatherCondition : weatherCondition // ignore: cast_nullable_to_non_nullable
as WeatherCondition,workPerformed: null == workPerformed ? _self.workPerformed : workPerformed // ignore: cast_nullable_to_non_nullable
as bool,workScopeUID: null == workScopeUID ? _self.workScopeUID : workScopeUID // ignore: cast_nullable_to_non_nullable
as String,roadUID: null == roadUID ? _self.roadUID : roadUID // ignore: cast_nullable_to_non_nullable
as String,totalWorkers: freezed == totalWorkers ? _self.totalWorkers : totalWorkers // ignore: cast_nullable_to_non_nullable
as int?,fromSection: freezed == fromSection ? _self.fromSection : fromSection // ignore: cast_nullable_to_non_nullable
as double?,toSection: freezed == toSection ? _self.toSection : toSection // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,equipments: freezed == equipments ? _self.equipments : equipments // ignore: cast_nullable_to_non_nullable
as List<CreateDailyReportEquipmentModel>?,quantities: freezed == quantities ? _self.quantities : quantities // ignore: cast_nullable_to_non_nullable
as List<CreateDailyReportQuantityModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateDailyReportModel].
extension CreateDailyReportModelPatterns on CreateDailyReportModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateDailyReportModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateDailyReportModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateDailyReportModel value)  $default,){
final _that = this;
switch (_that) {
case _CreateDailyReportModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateDailyReportModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreateDailyReportModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? notes,  WeatherCondition weatherCondition,  bool workPerformed,  String workScopeUID,  String roadUID,  int? totalWorkers,  double? fromSection,  double? toSection,  double? longitude,  double? latitude,  List<CreateDailyReportEquipmentModel>? equipments,  List<CreateDailyReportQuantityModel>? quantities)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateDailyReportModel() when $default != null:
return $default(_that.name,_that.notes,_that.weatherCondition,_that.workPerformed,_that.workScopeUID,_that.roadUID,_that.totalWorkers,_that.fromSection,_that.toSection,_that.longitude,_that.latitude,_that.equipments,_that.quantities);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? notes,  WeatherCondition weatherCondition,  bool workPerformed,  String workScopeUID,  String roadUID,  int? totalWorkers,  double? fromSection,  double? toSection,  double? longitude,  double? latitude,  List<CreateDailyReportEquipmentModel>? equipments,  List<CreateDailyReportQuantityModel>? quantities)  $default,) {final _that = this;
switch (_that) {
case _CreateDailyReportModel():
return $default(_that.name,_that.notes,_that.weatherCondition,_that.workPerformed,_that.workScopeUID,_that.roadUID,_that.totalWorkers,_that.fromSection,_that.toSection,_that.longitude,_that.latitude,_that.equipments,_that.quantities);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? notes,  WeatherCondition weatherCondition,  bool workPerformed,  String workScopeUID,  String roadUID,  int? totalWorkers,  double? fromSection,  double? toSection,  double? longitude,  double? latitude,  List<CreateDailyReportEquipmentModel>? equipments,  List<CreateDailyReportQuantityModel>? quantities)?  $default,) {final _that = this;
switch (_that) {
case _CreateDailyReportModel() when $default != null:
return $default(_that.name,_that.notes,_that.weatherCondition,_that.workPerformed,_that.workScopeUID,_that.roadUID,_that.totalWorkers,_that.fromSection,_that.toSection,_that.longitude,_that.latitude,_that.equipments,_that.quantities);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateDailyReportModel implements CreateDailyReportModel {
  const _CreateDailyReportModel({required this.name, this.notes, required this.weatherCondition, required this.workPerformed, required this.workScopeUID, required this.roadUID, this.totalWorkers, this.fromSection, this.toSection, this.longitude, this.latitude, final  List<CreateDailyReportEquipmentModel>? equipments, final  List<CreateDailyReportQuantityModel>? quantities}): _equipments = equipments,_quantities = quantities;
  factory _CreateDailyReportModel.fromJson(Map<String, dynamic> json) => _$CreateDailyReportModelFromJson(json);

/// Report name/title
@override final  String name;
/// Additional notes for the report
@override final  String? notes;
/// Weather condition during work
@override final  WeatherCondition weatherCondition;
/// Whether work was performed on this day
@override final  bool workPerformed;
/// Work scope UID
@override final  String workScopeUID;
/// Road UID where work was performed
@override final  String roadUID;
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
/// Equipment used in this report
 final  List<CreateDailyReportEquipmentModel>? _equipments;
/// Equipment used in this report
@override List<CreateDailyReportEquipmentModel>? get equipments {
  final value = _equipments;
  if (value == null) return null;
  if (_equipments is EqualUnmodifiableListView) return _equipments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// Work quantities for this report
 final  List<CreateDailyReportQuantityModel>? _quantities;
/// Work quantities for this report
@override List<CreateDailyReportQuantityModel>? get quantities {
  final value = _quantities;
  if (value == null) return null;
  if (_quantities is EqualUnmodifiableListView) return _quantities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CreateDailyReportModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateDailyReportModelCopyWith<_CreateDailyReportModel> get copyWith => __$CreateDailyReportModelCopyWithImpl<_CreateDailyReportModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateDailyReportModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateDailyReportModel&&(identical(other.name, name) || other.name == name)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.weatherCondition, weatherCondition) || other.weatherCondition == weatherCondition)&&(identical(other.workPerformed, workPerformed) || other.workPerformed == workPerformed)&&(identical(other.workScopeUID, workScopeUID) || other.workScopeUID == workScopeUID)&&(identical(other.roadUID, roadUID) || other.roadUID == roadUID)&&(identical(other.totalWorkers, totalWorkers) || other.totalWorkers == totalWorkers)&&(identical(other.fromSection, fromSection) || other.fromSection == fromSection)&&(identical(other.toSection, toSection) || other.toSection == toSection)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&const DeepCollectionEquality().equals(other._equipments, _equipments)&&const DeepCollectionEquality().equals(other._quantities, _quantities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,notes,weatherCondition,workPerformed,workScopeUID,roadUID,totalWorkers,fromSection,toSection,longitude,latitude,const DeepCollectionEquality().hash(_equipments),const DeepCollectionEquality().hash(_quantities));

@override
String toString() {
  return 'CreateDailyReportModel(name: $name, notes: $notes, weatherCondition: $weatherCondition, workPerformed: $workPerformed, workScopeUID: $workScopeUID, roadUID: $roadUID, totalWorkers: $totalWorkers, fromSection: $fromSection, toSection: $toSection, longitude: $longitude, latitude: $latitude, equipments: $equipments, quantities: $quantities)';
}


}

/// @nodoc
abstract mixin class _$CreateDailyReportModelCopyWith<$Res> implements $CreateDailyReportModelCopyWith<$Res> {
  factory _$CreateDailyReportModelCopyWith(_CreateDailyReportModel value, $Res Function(_CreateDailyReportModel) _then) = __$CreateDailyReportModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String? notes, WeatherCondition weatherCondition, bool workPerformed, String workScopeUID, String roadUID, int? totalWorkers, double? fromSection, double? toSection, double? longitude, double? latitude, List<CreateDailyReportEquipmentModel>? equipments, List<CreateDailyReportQuantityModel>? quantities
});




}
/// @nodoc
class __$CreateDailyReportModelCopyWithImpl<$Res>
    implements _$CreateDailyReportModelCopyWith<$Res> {
  __$CreateDailyReportModelCopyWithImpl(this._self, this._then);

  final _CreateDailyReportModel _self;
  final $Res Function(_CreateDailyReportModel) _then;

/// Create a copy of CreateDailyReportModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? notes = freezed,Object? weatherCondition = null,Object? workPerformed = null,Object? workScopeUID = null,Object? roadUID = null,Object? totalWorkers = freezed,Object? fromSection = freezed,Object? toSection = freezed,Object? longitude = freezed,Object? latitude = freezed,Object? equipments = freezed,Object? quantities = freezed,}) {
  return _then(_CreateDailyReportModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,weatherCondition: null == weatherCondition ? _self.weatherCondition : weatherCondition // ignore: cast_nullable_to_non_nullable
as WeatherCondition,workPerformed: null == workPerformed ? _self.workPerformed : workPerformed // ignore: cast_nullable_to_non_nullable
as bool,workScopeUID: null == workScopeUID ? _self.workScopeUID : workScopeUID // ignore: cast_nullable_to_non_nullable
as String,roadUID: null == roadUID ? _self.roadUID : roadUID // ignore: cast_nullable_to_non_nullable
as String,totalWorkers: freezed == totalWorkers ? _self.totalWorkers : totalWorkers // ignore: cast_nullable_to_non_nullable
as int?,fromSection: freezed == fromSection ? _self.fromSection : fromSection // ignore: cast_nullable_to_non_nullable
as double?,toSection: freezed == toSection ? _self.toSection : toSection // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,equipments: freezed == equipments ? _self._equipments : equipments // ignore: cast_nullable_to_non_nullable
as List<CreateDailyReportEquipmentModel>?,quantities: freezed == quantities ? _self._quantities : quantities // ignore: cast_nullable_to_non_nullable
as List<CreateDailyReportQuantityModel>?,
  ));
}


}

// dart format on
