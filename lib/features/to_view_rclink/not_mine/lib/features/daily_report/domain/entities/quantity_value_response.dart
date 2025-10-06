import 'package:equatable/equatable.dart';

class QuantityFieldResponse extends Equatable {
  final String name;
  final String fieldType;
  final String? unit;
  final String uid;

  const QuantityFieldResponse({
    required this.name,
    required this.fieldType,
    this.unit,
    required this.uid,
  });

  @override
  List<Object?> get props => [name, fieldType, unit, uid];
}

class QuantityValueResponse extends Equatable {
  final String value;
  final QuantityFieldResponse quantityField;

  const QuantityValueResponse({
    required this.value,
    required this.quantityField,
  });

  @override
  List<Object?> get props => [value, quantityField];
}

class QuantityTypeResponse extends Equatable {
  final String name;
  final String code;
  final String uid;

  const QuantityTypeResponse({
    required this.name,
    required this.code,
    required this.uid,
  });

  @override
  List<Object?> get props => [name, code, uid];
}
