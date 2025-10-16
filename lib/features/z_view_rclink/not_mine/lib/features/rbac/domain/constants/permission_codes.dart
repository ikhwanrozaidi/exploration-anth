// ignore_for_file: constant_identifier_names

/// Permission code constants matching backend API
class PermissionCodes {
  // Company permissions
  static const String COMPANY_VIEW = 'COMPANY_VIEW';
  static const String COMPANY_UPDATE = 'COMPANY_UPDATE';
  static const String COMPANY_DELETE = 'COMPANY_DELETE';

  // User permissions
  static const String USER_VIEW = 'USER_VIEW';
  static const String USER_CREATE = 'USER_CREATE';
  static const String USER_UPDATE = 'USER_UPDATE';
  static const String USER_DELETE = 'USER_DELETE';
  static const String USER_ASSIGN_ROLE = 'USER_ASSIGN_ROLE';

  // Role permissions
  static const String ROLE_VIEW = 'ROLE_VIEW';
  static const String ROLE_CREATE = 'ROLE_CREATE';
  static const String ROLE_UPDATE = 'ROLE_UPDATE';
  static const String ROLE_DELETE = 'ROLE_DELETE';
  static const String ROLE_MANAGE_PERMISSIONS = 'ROLE_MANAGE_PERMISSIONS';

  // Program permissions
  static const String PROGRAM_VIEW = 'PROGRAM_VIEW';
  static const String PROGRAM_CREATE = 'PROGRAM_CREATE';
  static const String PROGRAM_UPDATE = 'PROGRAM_UPDATE';
  static const String PROGRAM_DELETE = 'PROGRAM_DELETE';

  // Daily Report permissions
  static const String DAILY_REPORT_VIEW = 'DAILY_REPORT_VIEW';
  static const String DAILY_REPORT_CREATE = 'DAILY_REPORT_CREATE';
  static const String DAILY_REPORT_UPDATE = 'DAILY_REPORT_UPDATE';
  static const String DAILY_REPORT_DELETE = 'DAILY_REPORT_DELETE';

  // Inspection permissions
  static const String INSPECTION_VIEW = 'INSPECTION_VIEW';
  static const String INSPECTION_CREATE = 'INSPECTION_CREATE';
  static const String INSPECTION_UPDATE = 'INSPECTION_UPDATE';
  static const String INSPECTION_DELETE = 'INSPECTION_DELETE';
}

/// Permission categories
class PermissionCategories {
  static const String COMPANY = 'Company';
  static const String USER = 'User';
  static const String ROLE = 'Role';
  static const String PROGRAM = 'Program';
  static const String DAILY_REPORT = 'Daily Report';
  static const String INSPECTION = 'Inspection';

  static const List<String> all = [
    COMPANY,
    USER,
    ROLE,
    PROGRAM,
    DAILY_REPORT,
    INSPECTION,
  ];
}

/// Permission scopes
class PermissionScopes {
  static const String COMPANY = 'COMPANY';
  static const String PROJECT = 'PROJECT';
  static const String GLOBAL = 'GLOBAL';
}