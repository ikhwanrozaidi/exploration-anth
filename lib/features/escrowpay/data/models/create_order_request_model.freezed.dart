// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_order_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateOrderRequestModel {

 String get sellerUsername; String get amount;// API expects string
 String get productName; List<String> get productDesc; String get productCat;
/// Create a copy of CreateOrderRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateOrderRequestModelCopyWith<CreateOrderRequestModel> get copyWith => _$CreateOrderRequestModelCopyWithImpl<CreateOrderRequestModel>(this as CreateOrderRequestModel, _$identity);

  /// Serializes this CreateOrderRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateOrderRequestModel&&(identical(other.sellerUsername, sellerUsername) || other.sellerUsername == sellerUsername)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.productName, productName) || other.productName == productName)&&const DeepCollectionEquality().equals(other.productDesc, productDesc)&&(identical(other.productCat, productCat) || other.productCat == productCat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sellerUsername,amount,productName,const DeepCollectionEquality().hash(productDesc),productCat);

@override
String toString() {
  return 'CreateOrderRequestModel(sellerUsername: $sellerUsername, amount: $amount, productName: $productName, productDesc: $productDesc, productCat: $productCat)';
}


}

/// @nodoc
abstract mixin class $CreateOrderRequestModelCopyWith<$Res>  {
  factory $CreateOrderRequestModelCopyWith(CreateOrderRequestModel value, $Res Function(CreateOrderRequestModel) _then) = _$CreateOrderRequestModelCopyWithImpl;
@useResult
$Res call({
 String sellerUsername, String amount, String productName, List<String> productDesc, String productCat
});




}
/// @nodoc
class _$CreateOrderRequestModelCopyWithImpl<$Res>
    implements $CreateOrderRequestModelCopyWith<$Res> {
  _$CreateOrderRequestModelCopyWithImpl(this._self, this._then);

  final CreateOrderRequestModel _self;
  final $Res Function(CreateOrderRequestModel) _then;

/// Create a copy of CreateOrderRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sellerUsername = null,Object? amount = null,Object? productName = null,Object? productDesc = null,Object? productCat = null,}) {
  return _then(_self.copyWith(
sellerUsername: null == sellerUsername ? _self.sellerUsername : sellerUsername // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,productDesc: null == productDesc ? _self.productDesc : productDesc // ignore: cast_nullable_to_non_nullable
as List<String>,productCat: null == productCat ? _self.productCat : productCat // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateOrderRequestModel].
extension CreateOrderRequestModelPatterns on CreateOrderRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateOrderRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateOrderRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateOrderRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _CreateOrderRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateOrderRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreateOrderRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sellerUsername,  String amount,  String productName,  List<String> productDesc,  String productCat)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateOrderRequestModel() when $default != null:
return $default(_that.sellerUsername,_that.amount,_that.productName,_that.productDesc,_that.productCat);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sellerUsername,  String amount,  String productName,  List<String> productDesc,  String productCat)  $default,) {final _that = this;
switch (_that) {
case _CreateOrderRequestModel():
return $default(_that.sellerUsername,_that.amount,_that.productName,_that.productDesc,_that.productCat);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sellerUsername,  String amount,  String productName,  List<String> productDesc,  String productCat)?  $default,) {final _that = this;
switch (_that) {
case _CreateOrderRequestModel() when $default != null:
return $default(_that.sellerUsername,_that.amount,_that.productName,_that.productDesc,_that.productCat);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateOrderRequestModel implements CreateOrderRequestModel {
  const _CreateOrderRequestModel({required this.sellerUsername, required this.amount, required this.productName, required final  List<String> productDesc, required this.productCat}): _productDesc = productDesc;
  factory _CreateOrderRequestModel.fromJson(Map<String, dynamic> json) => _$CreateOrderRequestModelFromJson(json);

@override final  String sellerUsername;
@override final  String amount;
// API expects string
@override final  String productName;
 final  List<String> _productDesc;
@override List<String> get productDesc {
  if (_productDesc is EqualUnmodifiableListView) return _productDesc;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_productDesc);
}

@override final  String productCat;

/// Create a copy of CreateOrderRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateOrderRequestModelCopyWith<_CreateOrderRequestModel> get copyWith => __$CreateOrderRequestModelCopyWithImpl<_CreateOrderRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateOrderRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateOrderRequestModel&&(identical(other.sellerUsername, sellerUsername) || other.sellerUsername == sellerUsername)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.productName, productName) || other.productName == productName)&&const DeepCollectionEquality().equals(other._productDesc, _productDesc)&&(identical(other.productCat, productCat) || other.productCat == productCat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sellerUsername,amount,productName,const DeepCollectionEquality().hash(_productDesc),productCat);

@override
String toString() {
  return 'CreateOrderRequestModel(sellerUsername: $sellerUsername, amount: $amount, productName: $productName, productDesc: $productDesc, productCat: $productCat)';
}


}

/// @nodoc
abstract mixin class _$CreateOrderRequestModelCopyWith<$Res> implements $CreateOrderRequestModelCopyWith<$Res> {
  factory _$CreateOrderRequestModelCopyWith(_CreateOrderRequestModel value, $Res Function(_CreateOrderRequestModel) _then) = __$CreateOrderRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String sellerUsername, String amount, String productName, List<String> productDesc, String productCat
});




}
/// @nodoc
class __$CreateOrderRequestModelCopyWithImpl<$Res>
    implements _$CreateOrderRequestModelCopyWith<$Res> {
  __$CreateOrderRequestModelCopyWithImpl(this._self, this._then);

  final _CreateOrderRequestModel _self;
  final $Res Function(_CreateOrderRequestModel) _then;

/// Create a copy of CreateOrderRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sellerUsername = null,Object? amount = null,Object? productName = null,Object? productDesc = null,Object? productCat = null,}) {
  return _then(_CreateOrderRequestModel(
sellerUsername: null == sellerUsername ? _self.sellerUsername : sellerUsername // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,productDesc: null == productDesc ? _self._productDesc : productDesc // ignore: cast_nullable_to_non_nullable
as List<String>,productCat: null == productCat ? _self.productCat : productCat // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
