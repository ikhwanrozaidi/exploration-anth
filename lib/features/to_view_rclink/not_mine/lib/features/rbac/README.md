# RBAC (Role-Based Access Control) System

## Overview
This module provides role-based access control for the application. Permissions are fetched from the API when a company is selected and cached locally.

## Key Components

### Entities
- **Role**: Contains role information and associated permissions
- **Permission**: Individual permission with code, category, and scope

### BLoC Architecture
- **RbacBloc**: Manages permission state and business logic
- **RbacEvent**: Events for loading, clearing, and checking permissions
- **RbacState**: States representing permission status (initial, loading, loaded, no permissions, error)
- **PermissionRepository**: Handles API calls and local caching

### Widgets
- **PermissionGate**: Controls visibility/access based on permissions using RbacBloc
- **ModuleGate**: Controls access to entire modules using RbacBloc
- **AccessDeniedWidget**: Shows when user lacks permission

## Usage Examples

### 1. Provide RbacBloc in Widget Tree
```dart
BlocProvider<RbacBloc>(
  create: (context) => getIt<RbacBloc>(),
  child: YourApp(),
)
```

### 2. Check Permission in Code
```dart
// In a widget with access to context
final rbacBloc = context.read<RbacBloc>();

if (rbacBloc.hasPermission(PermissionCodes.USER_CREATE)) {
  // User can create users
}

// Or using BlocBuilder
BlocBuilder<RbacBloc, RbacState>(
  builder: (context, state) {
    if (state.hasPermission(PermissionCodes.USER_UPDATE)) {
      return EditButton();
    }
    return const SizedBox();
  },
)
```

### 3. PermissionGate Widget
```dart
// Hide widget if no permission
PermissionGate(
  permission: PermissionCodes.USER_DELETE,
  child: DeleteButton(),
)

// Disable widget if no permission
PermissionGate(
  permission: PermissionCodes.USER_UPDATE,
  behavior: PermissionBehavior.disable,
  child: EditButton(),
)

// Show access denied message
PermissionGate(
  permission: PermissionCodes.ROLE_CREATE,
  behavior: PermissionBehavior.showAccessDenied,
  accessDeniedMessage: 'You cannot create roles',
  child: CreateRoleButton(),
)

// Custom fallback widget
PermissionGate(
  permission: PermissionCodes.COMPANY_DELETE,
  behavior: PermissionBehavior.custom,
  fallback: UpgradePrompt(),
  child: DeleteCompanyButton(),
)

// Check multiple permissions (ANY)
PermissionGate(
  permissions: [
    PermissionCodes.USER_CREATE,
    PermissionCodes.USER_UPDATE,
  ],
  requireAll: false, // User needs ANY of these
  child: UserActionButton(),
)

// Check multiple permissions (ALL)
PermissionGate(
  permissions: [
    PermissionCodes.ROLE_VIEW,
    PermissionCodes.ROLE_MANAGE_PERMISSIONS,
  ],
  requireAll: true, // User needs ALL of these
  child: ManageRolesButton(),
)
```

### 4. Using Extensions
```dart
// Simple permission check
DeleteButton().withPermission(
  PermissionCodes.USER_DELETE,
  behavior: PermissionBehavior.disable,
)

// Check any permission
ActionButton().withAnyPermission([
  PermissionCodes.USER_CREATE,
  PermissionCodes.USER_UPDATE,
])

// Check all permissions
AdminPanel().withAllPermissions([
  PermissionCodes.ROLE_VIEW,
  PermissionCodes.ROLE_MANAGE_PERMISSIONS,
])
```

### 5. ModuleGate Widget
```dart
// Hide entire module if no access
ModuleGate(
  category: PermissionCategories.USER,
  child: UserManagementScreen(),
)

// Require at least one action permission
ModuleGate(
  category: PermissionCategories.ROLE,
  requireAnyAction: true, // Need CREATE, UPDATE, or DELETE
  child: RoleManagementScreen(),
)

// Using factory constructors
ModuleGate.company(
  child: CompanySettingsScreen(),
)

ModuleGate.dailyReport(
  requireAnyAction: true,
  showAccessDenied: true,
  child: DailyReportScreen(),
)

// Using extensions
UserScreen().withUserAccess()
RoleScreen().withRoleAccess(requireAnyAction: true)
ProgramScreen().withProgramAccess()
```

### 6. In Navigation/Drawer
```dart
Drawer(
  children: [
    // Only show if user can view companies
    PermissionGate(
      permission: PermissionCodes.COMPANY_VIEW,
      child: ListTile(
        title: Text('Company Settings'),
        onTap: () => navigateToCompanySettings(),
      ),
    ),
    
    // Show but disable if no permission
    PermissionGate(
      permission: PermissionCodes.USER_VIEW,
      behavior: PermissionBehavior.disable,
      child: ListTile(
        title: Text('User Management'),
        onTap: () => navigateToUserManagement(),
      ),
    ),
    
    // Module-based access
    ModuleGate.program(
      child: ListTile(
        title: Text('Programs'),
        onTap: () => navigateToPrograms(),
      ),
    ),
  ],
)
```

### 7. In Forms/Actions
```dart
Column(
  children: [
    // View is always visible
    CompanyInfoCard(),
    
    // Edit button only for those with permission
    PermissionGate(
      permission: PermissionCodes.COMPANY_UPDATE,
      child: EditButton(
        onPressed: () => editCompany(),
      ),
    ),
    
    // Delete with custom message
    PermissionGate(
      permission: PermissionCodes.COMPANY_DELETE,
      behavior: PermissionBehavior.showAccessDenied,
      accessDeniedMessage: 'Only owners can delete companies',
      child: DeleteButton(
        onPressed: () => deleteCompany(),
      ),
    ),
  ],
)
```

## Permission Codes
All permission codes are defined in `permission_codes.dart`:

### Company Permissions
- `COMPANY_VIEW`
- `COMPANY_UPDATE`
- `COMPANY_DELETE`

### User Permissions
- `USER_VIEW`
- `USER_CREATE`
- `USER_UPDATE`
- `USER_DELETE`
- `USER_ASSIGN_ROLE`

### Role Permissions
- `ROLE_VIEW`
- `ROLE_CREATE`
- `ROLE_UPDATE`
- `ROLE_DELETE`
- `ROLE_MANAGE_PERMISSIONS`

### Program Permissions
- `PROGRAM_VIEW`
- `PROGRAM_CREATE`
- `PROGRAM_UPDATE`
- `PROGRAM_DELETE`

### Daily Report Permissions
- `DAILY_REPORT_VIEW`
- `DAILY_REPORT_CREATE`
- `DAILY_REPORT_UPDATE`
- `DAILY_REPORT_DELETE`

### Inspection Permissions
- `INSPECTION_VIEW`
- `INSPECTION_CREATE`
- `INSPECTION_UPDATE`
- `INSPECTION_DELETE`

## Integration Flow
1. User logs in and gets authentication token
2. User selects a company
3. AuthBloc triggers RbacBloc to load permissions
4. RbacBloc fetches role and permissions from API
5. Permissions are cached locally in database
6. UI elements check permissions using PermissionGate/ModuleGate with BlocBuilder
7. On logout or company switch, RbacBloc clears permissions

## Notes
- Permissions are company-specific
- Only one role per user per company
- Permissions are cached for offline access
- UI automatically updates based on permissions
- System gracefully handles missing permissions