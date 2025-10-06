import 'package:equatable/equatable.dart';

import 'quantity_value.dart';

class ReportQuantity extends Equatable {
  final QuantityType quantityType;
  final List<QuantityValue> quantityValues;

  const ReportQuantity({
    required this.quantityType,
    required this.quantityValues,
  });

  @override
  List<Object?> get props => [quantityType, quantityValues];
}
