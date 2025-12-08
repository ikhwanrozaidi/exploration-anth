import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/usecases/check_all_permissions_usecase.dart';
import '../../domain/usecases/check_any_permission_usecase.dart';
import '../../domain/usecases/check_permission_usecase.dart';
import '../../domain/usecases/clear_role_usecase.dart';
import '../../domain/usecases/get_role_usecase.dart';
import 'rbac_event.dart';
import 'rbac_state.dart';

@lazySingleton
class RbacBloc extends Bloc<RbacEvent, RbacState> {
  final GetRoleUseCase _getRoleUseCase;
  final ClearRoleUseCase _clearRoleUseCase;
  final CheckPermissionUseCase _checkPermissionUseCase;
  final CheckAnyPermissionUseCase _checkAnyPermissionUseCase;
  final CheckAllPermissionsUseCase _checkAllPermissionsUseCase;

  RbacBloc(
    this._getRoleUseCase,
    this._clearRoleUseCase,
    this._checkPermissionUseCase,
    this._checkAnyPermissionUseCase,
    this._checkAllPermissionsUseCase,
  ) : super(const RbacInitial()) {
    on<LoadPermissions>(_onLoadPermissions);
    on<ClearPermissions>(_onClearPermissions);
    on<CheckPermission>(_onCheckPermission);
    on<CheckAnyPermission>(_onCheckAnyPermission);
    on<CheckAllPermissions>(_onCheckAllPermissions);
    on<CheckModuleAccess>(_onCheckModuleAccess);
  }

  Future<void> _onLoadPermissions(
    LoadPermissions event,
    Emitter<RbacState> emit,
  ) async {
    emit(const RbacLoading());

    final result = await _getRoleUseCase(GetRoleParams(roleUID: event.roleUID));

    result.fold((failure) => emit(RbacError(_mapFailureToMessage(failure))), (
      role,
    ) {
      if (role != null && role.permissions.isNotEmpty) {
        emit(RbacLoaded(role: role, permissions: role.permissions));
      } else {
        emit(const RbacNoPermissions());
      }
    });
  }

  Future<void> _onClearPermissions(
    ClearPermissions event,
    Emitter<RbacState> emit,
  ) async {
    final result = await _clearRoleUseCase();

    result.fold(
      (failure) => emit(RbacError(_mapFailureToMessage(failure))),
      (_) => emit(const RbacInitial()),
    );
  }

  Future<void> _onCheckPermission(
    CheckPermission event,
    Emitter<RbacState> emit,
  ) async {
    // This event doesn't change state, it's just for logging/tracking
    final hasPermission = state.hasPermission(event.permissionCode);
    print('🔐 Permission check: ${event.permissionCode} = $hasPermission');
  }

  Future<void> _onCheckAnyPermission(
    CheckAnyPermission event,
    Emitter<RbacState> emit,
  ) async {
    // This event doesn't change state, it's just for logging/tracking
    final hasPermission = state.hasAnyPermission(event.permissionCodes);
    print('🔐 Any permission check: ${event.permissionCodes} = $hasPermission');
  }

  Future<void> _onCheckAllPermissions(
    CheckAllPermissions event,
    Emitter<RbacState> emit,
  ) async {
    // This event doesn't change state, it's just for logging/tracking
    final hasPermission = state.hasAllPermissions(event.permissionCodes);
    print(
      '🔐 All permissions check: ${event.permissionCodes} = $hasPermission',
    );
  }

  Future<void> _onCheckModuleAccess(
    CheckModuleAccess event,
    Emitter<RbacState> emit,
  ) async {
    // This event doesn't change state, it's just for logging/tracking
    final hasAccess = state.hasModuleAccess(event.category);
    print('🔐 Module access check: ${event.category} = $hasAccess');
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return failure.message;
    } else if (failure is CacheFailure) {
      return 'Failed to access cached permissions';
    } else if (failure is NetworkFailure) {
      return 'Network error. Please check your connection';
    } else {
      return 'An unexpected error occurred';
    }
  }

  // Helper methods for direct access (useful in services)
  bool hasPermission(String permissionCode) {
    return state.hasPermission(permissionCode);
  }

  bool hasAnyPermission(List<String> permissionCodes) {
    return state.hasAnyPermission(permissionCodes);
  }

  bool hasAllPermissions(List<String> permissionCodes) {
    return state.hasAllPermissions(permissionCodes);
  }

  bool hasModuleAccess(String category) {
    return state.hasModuleAccess(category);
  }

  bool canPerformAnyActionInModule(String category) {
    return state.canPerformAnyActionInModule(category);
  }
}
