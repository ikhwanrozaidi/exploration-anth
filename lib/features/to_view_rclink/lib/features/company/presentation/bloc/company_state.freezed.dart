// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CompanyState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompanyState()';
}


}

/// @nodoc
class $CompanyStateCopyWith<$Res>  {
$CompanyStateCopyWith(CompanyState _, $Res Function(CompanyState) __);
}


/// Adds pattern-matching-related methods to [CompanyState].
extension CompanyStatePatterns on CompanyState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CompanyInitial value)?  initial,TResult Function( CompanyLoading value)?  loading,TResult Function( CompanyLoaded value)?  loaded,TResult Function( CompanyFailure value)?  failure,TResult Function( CompanyRoleLoading value)?  roleLoading,TResult Function( CompanyRoleLoaded value)?  roleLoaded,TResult Function( CompanyRoleFailure value)?  roleFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CompanyInitial() when initial != null:
return initial(_that);case CompanyLoading() when loading != null:
return loading(_that);case CompanyLoaded() when loaded != null:
return loaded(_that);case CompanyFailure() when failure != null:
return failure(_that);case CompanyRoleLoading() when roleLoading != null:
return roleLoading(_that);case CompanyRoleLoaded() when roleLoaded != null:
return roleLoaded(_that);case CompanyRoleFailure() when roleFailure != null:
return roleFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CompanyInitial value)  initial,required TResult Function( CompanyLoading value)  loading,required TResult Function( CompanyLoaded value)  loaded,required TResult Function( CompanyFailure value)  failure,required TResult Function( CompanyRoleLoading value)  roleLoading,required TResult Function( CompanyRoleLoaded value)  roleLoaded,required TResult Function( CompanyRoleFailure value)  roleFailure,}){
final _that = this;
switch (_that) {
case CompanyInitial():
return initial(_that);case CompanyLoading():
return loading(_that);case CompanyLoaded():
return loaded(_that);case CompanyFailure():
return failure(_that);case CompanyRoleLoading():
return roleLoading(_that);case CompanyRoleLoaded():
return roleLoaded(_that);case CompanyRoleFailure():
return roleFailure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CompanyInitial value)?  initial,TResult? Function( CompanyLoading value)?  loading,TResult? Function( CompanyLoaded value)?  loaded,TResult? Function( CompanyFailure value)?  failure,TResult? Function( CompanyRoleLoading value)?  roleLoading,TResult? Function( CompanyRoleLoaded value)?  roleLoaded,TResult? Function( CompanyRoleFailure value)?  roleFailure,}){
final _that = this;
switch (_that) {
case CompanyInitial() when initial != null:
return initial(_that);case CompanyLoading() when loading != null:
return loading(_that);case CompanyLoaded() when loaded != null:
return loaded(_that);case CompanyFailure() when failure != null:
return failure(_that);case CompanyRoleLoading() when roleLoading != null:
return roleLoading(_that);case CompanyRoleLoaded() when roleLoaded != null:
return roleLoaded(_that);case CompanyRoleFailure() when roleFailure != null:
return roleFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Company> companies,  String? selectedCompanyId)?  loaded,TResult Function( String message)?  failure,TResult Function()?  roleLoading,TResult Function( Role role)?  roleLoaded,TResult Function( String message)?  roleFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CompanyInitial() when initial != null:
return initial();case CompanyLoading() when loading != null:
return loading();case CompanyLoaded() when loaded != null:
return loaded(_that.companies,_that.selectedCompanyId);case CompanyFailure() when failure != null:
return failure(_that.message);case CompanyRoleLoading() when roleLoading != null:
return roleLoading();case CompanyRoleLoaded() when roleLoaded != null:
return roleLoaded(_that.role);case CompanyRoleFailure() when roleFailure != null:
return roleFailure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Company> companies,  String? selectedCompanyId)  loaded,required TResult Function( String message)  failure,required TResult Function()  roleLoading,required TResult Function( Role role)  roleLoaded,required TResult Function( String message)  roleFailure,}) {final _that = this;
switch (_that) {
case CompanyInitial():
return initial();case CompanyLoading():
return loading();case CompanyLoaded():
return loaded(_that.companies,_that.selectedCompanyId);case CompanyFailure():
return failure(_that.message);case CompanyRoleLoading():
return roleLoading();case CompanyRoleLoaded():
return roleLoaded(_that.role);case CompanyRoleFailure():
return roleFailure(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Company> companies,  String? selectedCompanyId)?  loaded,TResult? Function( String message)?  failure,TResult? Function()?  roleLoading,TResult? Function( Role role)?  roleLoaded,TResult? Function( String message)?  roleFailure,}) {final _that = this;
switch (_that) {
case CompanyInitial() when initial != null:
return initial();case CompanyLoading() when loading != null:
return loading();case CompanyLoaded() when loaded != null:
return loaded(_that.companies,_that.selectedCompanyId);case CompanyFailure() when failure != null:
return failure(_that.message);case CompanyRoleLoading() when roleLoading != null:
return roleLoading();case CompanyRoleLoaded() when roleLoaded != null:
return roleLoaded(_that.role);case CompanyRoleFailure() when roleFailure != null:
return roleFailure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class CompanyInitial implements CompanyState {
  const CompanyInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompanyState.initial()';
}


}




/// @nodoc


class CompanyLoading implements CompanyState {
  const CompanyLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompanyState.loading()';
}


}




/// @nodoc


class CompanyLoaded implements CompanyState {
  const CompanyLoaded(final  List<Company> companies, {this.selectedCompanyId}): _companies = companies;
  

 final  List<Company> _companies;
 List<Company> get companies {
  if (_companies is EqualUnmodifiableListView) return _companies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_companies);
}

 final  String? selectedCompanyId;

/// Create a copy of CompanyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyLoadedCopyWith<CompanyLoaded> get copyWith => _$CompanyLoadedCopyWithImpl<CompanyLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyLoaded&&const DeepCollectionEquality().equals(other._companies, _companies)&&(identical(other.selectedCompanyId, selectedCompanyId) || other.selectedCompanyId == selectedCompanyId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_companies),selectedCompanyId);

@override
String toString() {
  return 'CompanyState.loaded(companies: $companies, selectedCompanyId: $selectedCompanyId)';
}


}

/// @nodoc
abstract mixin class $CompanyLoadedCopyWith<$Res> implements $CompanyStateCopyWith<$Res> {
  factory $CompanyLoadedCopyWith(CompanyLoaded value, $Res Function(CompanyLoaded) _then) = _$CompanyLoadedCopyWithImpl;
@useResult
$Res call({
 List<Company> companies, String? selectedCompanyId
});




}
/// @nodoc
class _$CompanyLoadedCopyWithImpl<$Res>
    implements $CompanyLoadedCopyWith<$Res> {
  _$CompanyLoadedCopyWithImpl(this._self, this._then);

  final CompanyLoaded _self;
  final $Res Function(CompanyLoaded) _then;

/// Create a copy of CompanyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? companies = null,Object? selectedCompanyId = freezed,}) {
  return _then(CompanyLoaded(
null == companies ? _self._companies : companies // ignore: cast_nullable_to_non_nullable
as List<Company>,selectedCompanyId: freezed == selectedCompanyId ? _self.selectedCompanyId : selectedCompanyId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class CompanyFailure implements CompanyState {
  const CompanyFailure(this.message);
  

 final  String message;

/// Create a copy of CompanyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyFailureCopyWith<CompanyFailure> get copyWith => _$CompanyFailureCopyWithImpl<CompanyFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CompanyState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $CompanyFailureCopyWith<$Res> implements $CompanyStateCopyWith<$Res> {
  factory $CompanyFailureCopyWith(CompanyFailure value, $Res Function(CompanyFailure) _then) = _$CompanyFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CompanyFailureCopyWithImpl<$Res>
    implements $CompanyFailureCopyWith<$Res> {
  _$CompanyFailureCopyWithImpl(this._self, this._then);

  final CompanyFailure _self;
  final $Res Function(CompanyFailure) _then;

/// Create a copy of CompanyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CompanyFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CompanyRoleLoading implements CompanyState {
  const CompanyRoleLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyRoleLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompanyState.roleLoading()';
}


}




/// @nodoc


class CompanyRoleLoaded implements CompanyState {
  const CompanyRoleLoaded(this.role);
  

 final  Role role;

/// Create a copy of CompanyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyRoleLoadedCopyWith<CompanyRoleLoaded> get copyWith => _$CompanyRoleLoadedCopyWithImpl<CompanyRoleLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyRoleLoaded&&(identical(other.role, role) || other.role == role));
}


@override
int get hashCode => Object.hash(runtimeType,role);

@override
String toString() {
  return 'CompanyState.roleLoaded(role: $role)';
}


}

/// @nodoc
abstract mixin class $CompanyRoleLoadedCopyWith<$Res> implements $CompanyStateCopyWith<$Res> {
  factory $CompanyRoleLoadedCopyWith(CompanyRoleLoaded value, $Res Function(CompanyRoleLoaded) _then) = _$CompanyRoleLoadedCopyWithImpl;
@useResult
$Res call({
 Role role
});




}
/// @nodoc
class _$CompanyRoleLoadedCopyWithImpl<$Res>
    implements $CompanyRoleLoadedCopyWith<$Res> {
  _$CompanyRoleLoadedCopyWithImpl(this._self, this._then);

  final CompanyRoleLoaded _self;
  final $Res Function(CompanyRoleLoaded) _then;

/// Create a copy of CompanyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? role = null,}) {
  return _then(CompanyRoleLoaded(
null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as Role,
  ));
}


}

/// @nodoc


class CompanyRoleFailure implements CompanyState {
  const CompanyRoleFailure(this.message);
  

 final  String message;

/// Create a copy of CompanyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyRoleFailureCopyWith<CompanyRoleFailure> get copyWith => _$CompanyRoleFailureCopyWithImpl<CompanyRoleFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyRoleFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CompanyState.roleFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class $CompanyRoleFailureCopyWith<$Res> implements $CompanyStateCopyWith<$Res> {
  factory $CompanyRoleFailureCopyWith(CompanyRoleFailure value, $Res Function(CompanyRoleFailure) _then) = _$CompanyRoleFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CompanyRoleFailureCopyWithImpl<$Res>
    implements $CompanyRoleFailureCopyWith<$Res> {
  _$CompanyRoleFailureCopyWithImpl(this._self, this._then);

  final CompanyRoleFailure _self;
  final $Res Function(CompanyRoleFailure) _then;

/// Create a copy of CompanyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CompanyRoleFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
