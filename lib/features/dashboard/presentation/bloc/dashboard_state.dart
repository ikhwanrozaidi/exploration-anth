// import 'package:equatable/equatable.dart';
// import '../../domain/entities/user_detail.dart';
// import '../../domain/entities/onhold_transaction.dart';
// import '../../domain/entities/onhold_balance.dart';

// abstract class DashboardState extends Equatable {
//   const DashboardState();

//   @override
//   List<Object?> get props => [];
// }

// class DashboardInitial extends DashboardState {
//   const DashboardInitial();
// }

// class DashboardLoading extends DashboardState {
//   const DashboardLoading();
// }

// class DashboardLoaded extends DashboardState {
//   final UserDetail userDetail;
//   final List<OnholdTransaction> onholdTransactions;
//   final OnholdBalance onholdBalance;

//   const DashboardLoaded({
//     required this.userDetail,
//     required this.onholdTransactions,
//     required this.onholdBalance,
//   });

//   @override
//   List<Object> get props => [userDetail, onholdTransactions, onholdBalance];
// }

// class DashboardError extends DashboardState {
//   final String message;

//   const DashboardError(this.message);

//   @override
//   List<Object> get props => [message];
// }

// class DashboardPartialLoaded extends DashboardState {
//   final UserDetail? userDetail;
//   final List<OnholdTransaction>? onholdTransactions;
//   final OnholdBalance? onholdBalance;
//   final String? error;

//   const DashboardPartialLoaded({
//     this.userDetail,
//     this.onholdTransactions,
//     this.onholdBalance,
//     this.error,
//   });

//   @override
//   List<Object?> get props => [userDetail, onholdTransactions, onholdBalance, error];
// }
