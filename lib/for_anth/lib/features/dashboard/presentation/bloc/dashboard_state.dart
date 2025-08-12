// lib/features/dashboard/presentation/bloc/dashboard_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_state.freezed.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.initial() = DashboardInitial;
  const factory DashboardState.loading() = DashboardLoading;
  const factory DashboardState.loaded({
    required String userName,
    required double balance,
    required String currency,
    required String accountNumber,
    required List<CurrencyWallet> wallets,
  }) = DashboardLoaded;
  const factory DashboardState.error(String message) = DashboardError;
}

// Data models
@freezed
abstract class CurrencyWallet with _$CurrencyWallet {
  const factory CurrencyWallet({
    required String currencyCode,
    required String countryCode,
    required double balance,
    required String displayName,
  }) = _CurrencyWallet;
}