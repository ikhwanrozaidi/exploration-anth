// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentDetailsModel {

 String get productName; List<String> get productDesc; String get productCat; int get amount; bool get refundable; String get deliveryStatus;
/// Create a copy of PaymentDetailsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentDetailsModelCopyWith<PaymentDetailsModel> get copyWith => _$PaymentDetailsModelCopyWithImpl<PaymentDetailsModel>(this as PaymentDetailsModel, _$identity);

  /// Serializes this PaymentDetailsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentDetailsModel&&(identical(other.productName, productName) || other.productName == productName)&&const DeepCollectionEquality().equals(other.productDesc, productDesc)&&(identical(other.productCat, productCat) || other.productCat == productCat)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.refundable, refundable) || other.refundable == refundable)&&(identical(other.deliveryStatus, deliveryStatus) || other.deliveryStatus == deliveryStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productName,const DeepCollectionEquality().hash(productDesc),productCat,amount,refundable,deliveryStatus);

@override
String toString() {
  return 'PaymentDetailsModel(productName: $productName, productDesc: $productDesc, productCat: $productCat, amount: $amount, refundable: $refundable, deliveryStatus: $deliveryStatus)';
}


}

/// @nodoc
abstract mixin class $PaymentDetailsModelCopyWith<$Res>  {
  factory $PaymentDetailsModelCopyWith(PaymentDetailsModel value, $Res Function(PaymentDetailsModel) _then) = _$PaymentDetailsModelCopyWithImpl;
@useResult
$Res call({
 String productName, List<String> productDesc, String productCat, int amount, bool refundable, String deliveryStatus
});




}
/// @nodoc
class _$PaymentDetailsModelCopyWithImpl<$Res>
    implements $PaymentDetailsModelCopyWith<$Res> {
  _$PaymentDetailsModelCopyWithImpl(this._self, this._then);

  final PaymentDetailsModel _self;
  final $Res Function(PaymentDetailsModel) _then;

/// Create a copy of PaymentDetailsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productName = null,Object? productDesc = null,Object? productCat = null,Object? amount = null,Object? refundable = null,Object? deliveryStatus = null,}) {
  return _then(_self.copyWith(
productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,productDesc: null == productDesc ? _self.productDesc : productDesc // ignore: cast_nullable_to_non_nullable
as List<String>,productCat: null == productCat ? _self.productCat : productCat // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,refundable: null == refundable ? _self.refundable : refundable // ignore: cast_nullable_to_non_nullable
as bool,deliveryStatus: null == deliveryStatus ? _self.deliveryStatus : deliveryStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentDetailsModel].
extension PaymentDetailsModelPatterns on PaymentDetailsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentDetailsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentDetailsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentDetailsModel value)  $default,){
final _that = this;
switch (_that) {
case _PaymentDetailsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentDetailsModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentDetailsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String productName,  List<String> productDesc,  String productCat,  int amount,  bool refundable,  String deliveryStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentDetailsModel() when $default != null:
return $default(_that.productName,_that.productDesc,_that.productCat,_that.amount,_that.refundable,_that.deliveryStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String productName,  List<String> productDesc,  String productCat,  int amount,  bool refundable,  String deliveryStatus)  $default,) {final _that = this;
switch (_that) {
case _PaymentDetailsModel():
return $default(_that.productName,_that.productDesc,_that.productCat,_that.amount,_that.refundable,_that.deliveryStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String productName,  List<String> productDesc,  String productCat,  int amount,  bool refundable,  String deliveryStatus)?  $default,) {final _that = this;
switch (_that) {
case _PaymentDetailsModel() when $default != null:
return $default(_that.productName,_that.productDesc,_that.productCat,_that.amount,_that.refundable,_that.deliveryStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentDetailsModel extends PaymentDetailsModel {
  const _PaymentDetailsModel({required this.productName, required final  List<String> productDesc, required this.productCat, required this.amount, required this.refundable, required this.deliveryStatus}): _productDesc = productDesc,super._();
  factory _PaymentDetailsModel.fromJson(Map<String, dynamic> json) => _$PaymentDetailsModelFromJson(json);

@override final  String productName;
 final  List<String> _productDesc;
@override List<String> get productDesc {
  if (_productDesc is EqualUnmodifiableListView) return _productDesc;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_productDesc);
}

@override final  String productCat;
@override final  int amount;
@override final  bool refundable;
@override final  String deliveryStatus;

/// Create a copy of PaymentDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentDetailsModelCopyWith<_PaymentDetailsModel> get copyWith => __$PaymentDetailsModelCopyWithImpl<_PaymentDetailsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentDetailsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentDetailsModel&&(identical(other.productName, productName) || other.productName == productName)&&const DeepCollectionEquality().equals(other._productDesc, _productDesc)&&(identical(other.productCat, productCat) || other.productCat == productCat)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.refundable, refundable) || other.refundable == refundable)&&(identical(other.deliveryStatus, deliveryStatus) || other.deliveryStatus == deliveryStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productName,const DeepCollectionEquality().hash(_productDesc),productCat,amount,refundable,deliveryStatus);

@override
String toString() {
  return 'PaymentDetailsModel(productName: $productName, productDesc: $productDesc, productCat: $productCat, amount: $amount, refundable: $refundable, deliveryStatus: $deliveryStatus)';
}


}

/// @nodoc
abstract mixin class _$PaymentDetailsModelCopyWith<$Res> implements $PaymentDetailsModelCopyWith<$Res> {
  factory _$PaymentDetailsModelCopyWith(_PaymentDetailsModel value, $Res Function(_PaymentDetailsModel) _then) = __$PaymentDetailsModelCopyWithImpl;
@override @useResult
$Res call({
 String productName, List<String> productDesc, String productCat, int amount, bool refundable, String deliveryStatus
});




}
/// @nodoc
class __$PaymentDetailsModelCopyWithImpl<$Res>
    implements _$PaymentDetailsModelCopyWith<$Res> {
  __$PaymentDetailsModelCopyWithImpl(this._self, this._then);

  final _PaymentDetailsModel _self;
  final $Res Function(_PaymentDetailsModel) _then;

/// Create a copy of PaymentDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productName = null,Object? productDesc = null,Object? productCat = null,Object? amount = null,Object? refundable = null,Object? deliveryStatus = null,}) {
  return _then(_PaymentDetailsModel(
productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,productDesc: null == productDesc ? _self._productDesc : productDesc // ignore: cast_nullable_to_non_nullable
as List<String>,productCat: null == productCat ? _self.productCat : productCat // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,refundable: null == refundable ? _self.refundable : refundable // ignore: cast_nullable_to_non_nullable
as bool,deliveryStatus: null == deliveryStatus ? _self.deliveryStatus : deliveryStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
