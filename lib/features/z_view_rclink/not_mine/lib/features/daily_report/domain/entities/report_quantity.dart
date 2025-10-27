import 'package:equatable/equatable.dart';

import 'quantity_value_response.dart';

class ReportQuantity extends Equatable {
  final QuantityTypeResponse quantityType;
  final List<QuantityValueResponse> quantityValues;

  const ReportQuantity({
    required this.quantityType,
    required this.quantityValues,
  });

  @override
  List<Object?> get props => [quantityType, quantityValues];
}
