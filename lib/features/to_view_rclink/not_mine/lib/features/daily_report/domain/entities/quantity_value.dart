import 'package:equatable/equatable.dart';

class QuantityField extends Equatable {
  final String name;
  final String fieldType;
  final String? unit;
  final String uid;

  const QuantityField({
    required this.name,
    required this.fieldType,
    this.unit,
    required this.uid,
  });

  @override
  List<Object?> get props => [name, fieldType, unit, uid];
}

class QuantityValue extends Equatable {
  final String value;
  final QuantityField quantityField;

  const QuantityValue({required this.value, required this.quantityField});

  @override
  List<Object?> get props => [value, quantityField];
}

class QuantityType extends Equatable {
  final String name;
  final String code;
  final String uid;

  const QuantityType({
    required this.name,
    required this.code,
    required this.uid,
  });

  @override
  List<Object?> get props => [name, code, uid];
}
