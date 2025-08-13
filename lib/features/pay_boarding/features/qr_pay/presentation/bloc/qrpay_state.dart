import 'package:equatable/equatable.dart';

abstract class QrpayState extends Equatable {
  const QrpayState();

  @override
  List<Object?> get props => [];
}

class QrpayInitial extends QrpayState {
  const QrpayInitial();
}

class QrpayLoading extends QrpayState {
  const QrpayLoading();
}

class QrpayLoaded extends QrpayState {
  const QrpayLoaded();

  @override
  List<Object> get props => [];
}

class QrpayScanning extends QrpayState {
  const QrpayScanning();
}

class QrpayScanned extends QrpayState {
  final String qrData;
  
  const QrpayScanned(this.qrData);

  @override
  List<Object> get props => [qrData];
}

class QrpayProcessing extends QrpayState {
  const QrpayProcessing();
}

class QrpayPaymentSuccess extends QrpayState {
  final String transactionId;
  final double amount;
  
  const QrpayPaymentSuccess({
    required this.transactionId,
    required this.amount,
  });

  @override
  List<Object> get props => [transactionId, amount];
}

class QrpayError extends QrpayState {
  final String message;

  const QrpayError(this.message);

  @override
  List<Object> get props => [message];
}