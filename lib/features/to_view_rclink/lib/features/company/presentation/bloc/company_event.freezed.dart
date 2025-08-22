// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CompanyEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompanyEvent()';
}


}

/// @nodoc
class $CompanyEventCopyWith<$Res>  {
$CompanyEventCopyWith(CompanyEvent _, $Res Function(CompanyEvent) __);
}


/// Adds pattern-matching-related methods to [CompanyEvent].
extension CompanyEventPatterns on CompanyEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadCompanies value)?  loadCompanies,TResult Function( SelectCompany value)?  selectCompany,TResult Function( ClearSelection value)?  clearSelection,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadCompanies() when loadCompanies != null:
return loadCompanies(_that);case SelectCompany() when selectCompany != null:
return selectCompany(_that);case ClearSelection() when clearSelection != null:
return clearSelection(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadCompanies value)  loadCompanies,required TResult Function( SelectCompany value)  selectCompany,required TResult Function( ClearSelection value)  clearSelection,}){
final _that = this;
switch (_that) {
case LoadCompanies():
return loadCompanies(_that);case SelectCompany():
return selectCompany(_that);case ClearSelection():
return clearSelection(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadCompanies value)?  loadCompanies,TResult? Function( SelectCompany value)?  selectCompany,TResult? Function( ClearSelection value)?  clearSelection,}){
final _that = this;
switch (_that) {
case LoadCompanies() when loadCompanies != null:
return loadCompanies(_that);case SelectCompany() when selectCompany != null:
return selectCompany(_that);case ClearSelection() when clearSelection != null:
return clearSelection(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadCompanies,TResult Function( String companyId)?  selectCompany,TResult Function()?  clearSelection,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadCompanies() when loadCompanies != null:
return loadCompanies();case SelectCompany() when selectCompany != null:
return selectCompany(_that.companyId);case ClearSelection() when clearSelection != null:
return clearSelection();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadCompanies,required TResult Function( String companyId)  selectCompany,required TResult Function()  clearSelection,}) {final _that = this;
switch (_that) {
case LoadCompanies():
return loadCompanies();case SelectCompany():
return selectCompany(_that.companyId);case ClearSelection():
return clearSelection();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadCompanies,TResult? Function( String companyId)?  selectCompany,TResult? Function()?  clearSelection,}) {final _that = this;
switch (_that) {
case LoadCompanies() when loadCompanies != null:
return loadCompanies();case SelectCompany() when selectCompany != null:
return selectCompany(_that.companyId);case ClearSelection() when clearSelection != null:
return clearSelection();case _:
  return null;

}
}

}

/// @nodoc


class LoadCompanies implements CompanyEvent {
  const LoadCompanies();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadCompanies);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompanyEvent.loadCompanies()';
}


}




/// @nodoc


class SelectCompany implements CompanyEvent {
  const SelectCompany(this.companyId);
  

 final  String companyId;

/// Create a copy of CompanyEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectCompanyCopyWith<SelectCompany> get copyWith => _$SelectCompanyCopyWithImpl<SelectCompany>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectCompany&&(identical(other.companyId, companyId) || other.companyId == companyId));
}


@override
int get hashCode => Object.hash(runtimeType,companyId);

@override
String toString() {
  return 'CompanyEvent.selectCompany(companyId: $companyId)';
}


}

/// @nodoc
abstract mixin class $SelectCompanyCopyWith<$Res> implements $CompanyEventCopyWith<$Res> {
  factory $SelectCompanyCopyWith(SelectCompany value, $Res Function(SelectCompany) _then) = _$SelectCompanyCopyWithImpl;
@useResult
$Res call({
 String companyId
});




}
/// @nodoc
class _$SelectCompanyCopyWithImpl<$Res>
    implements $SelectCompanyCopyWith<$Res> {
  _$SelectCompanyCopyWithImpl(this._self, this._then);

  final SelectCompany _self;
  final $Res Function(SelectCompany) _then;

/// Create a copy of CompanyEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? companyId = null,}) {
  return _then(SelectCompany(
null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ClearSelection implements CompanyEvent {
  const ClearSelection();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearSelection);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompanyEvent.clearSelection()';
}


}




// dart format on
