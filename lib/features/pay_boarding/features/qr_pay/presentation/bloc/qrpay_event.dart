import 'package:equatable/equatable.dart';

abstract class QrpayEvent extends Equatable {
  const QrpayEvent();

  @override
  List<Object?> get props => [];
}

class LoadQrpay extends QrpayEvent {
  const LoadQrpay();
}

class RefreshQrpay extends QrpayEvent {
  const RefreshQrpay();
}

class ScanQrCode extends QrpayEvent {
  const ScanQrCode();
}

class ProcessQrPayment extends QrpayEvent {
  final String qrData;
  final double amount;

  const ProcessQrPayment({
    required this.qrData,
    required this.amount,
  });

  @override
  List<Object> get props => [qrData, amount];
}