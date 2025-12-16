{
  "statusCode": 200,
  "message": "",
  "data": {



    "id": 3,
    "uid": "d829fd02-42e2-4af0-86ec-b9a5ef1a1ca1",
    "name": "Owner",
    "description": "Full access to all company features",
    "companyID": 1,
    "isSystemRole": false,
    "isSystemAdmin": false,
    "isActive": true,
    "createdAt": "2025-08-22T07:15:08.174Z",
    "updatedAt": "2025-08-22T07:15:08.174Z",
    "deletedAt": null,
    "permissions": [

      // ========================= COMPANY
      {
        "id": 1,
        "uid": "bd7310a0-0a6e-4cae-8133-bacf5b725ae1",
        "code": "COMPANY_VIEW",
        "name": "View Company",
        "description": "View company details",
        "category": "Company",
        "scope": "COMPANY"
      },
      {
        "id": 2,
        "uid": "ca5fab57-7f8c-4e28-a7aa-116649152671",
        "code": "COMPANY_UPDATE",
        "name": "Update Company",
        "description": "Update company information",
        "category": "Company",
        "scope": "COMPANY"
      },
      {
        "id": 3,
        "uid": "c96e3fe6-cece-4912-aebd-6ee4dec22a07",
        "code": "COMPANY_DELETE",
        "name": "Delete Company",
        "description": "Delete company",
        "category": "Company",
        "scope": "COMPANY"
      },

      // ========================= USER
      {
        "id": 5,
        "uid": "69e81cde-18d3-43f1-9176-829abf2c2460",
        "code": "USER_VIEW",
        "name": "View Users",
        "description": "View user list and details",
        "category": "User",
        "scope": "COMPANY"
      },
      {
        "id": 6,
        "uid": "42d969d2-6512-4946-adba-e18f6a84928f",
        "code": "USER_CREATE",
        "name": "Create Users",
        "description": "Create new users",
        "category": "User",
        "scope": "COMPANY"
      },
      {
        "id": 7,
        "uid": "0f5025d7-6015-41cd-9705-2daedb65c04b",
        "code": "USER_UPDATE",
        "name": "Update Users",
        "description": "Update user information",
        "category": "User",
        "scope": "COMPANY"
      },
      {
        "id": 8,
        "uid": "6907c889-15ce-47f7-929f-b7e882d13eb6",
        "code": "USER_DELETE",
        "name": "Delete Users",
        "description": "Delete users",
        "category": "User",
        "scope": "COMPANY"
      },
      {
        "id": 9,
        "uid": "2fb04720-af8e-4e97-bb62-23537c7da5f3",
        "code": "USER_ASSIGN_ROLE",
        "name": "Assign User Roles",
        "description": "Assign roles to users",
        "category": "User",
        "scope": "COMPANY"
      },

      // ========================= ROLE
      {
        "id": 10,
        "uid": "9405b4c5-26a9-4c09-8552-0a96212a69ce",
        "code": "ROLE_VIEW",
        "name": "View Roles",
        "description": "View roles and permissions",
        "category": "Role",
        "scope": "COMPANY"
      },
      {
        "id": 11,
        "uid": "20f856df-25e6-46a1-9b82-9c1cf7bd0e08",
        "code": "ROLE_CREATE",
        "name": "Create Roles",
        "description": "Create new roles",
        "category": "Role",
        "scope": "COMPANY"
      },
      {
        "id": 12,
        "uid": "8f9689b0-4e39-4557-aaef-93eab636310f",
        "code": "ROLE_UPDATE",
        "name": "Update Roles",
        "description": "Update role information",
        "category": "Role",
        "scope": "COMPANY"
      },
      {
        "id": 13,
        "uid": "eac44105-8ce8-4d6d-a3f6-2ebe074cb5ec",
        "code": "ROLE_DELETE",
        "name": "Delete Roles",
        "description": "Delete roles",
        "category": "Role",
        "scope": "COMPANY"
      },
      {
        "id": 14,
        "uid": "a8b73150-dfd2-4931-bbed-8b51e7a33501",
        "code": "ROLE_MANAGE_PERMISSIONS",
        "name": "Manage Role Permissions",
        "description": "Assign or remove permissions from roles",
        "category": "Role",
        "scope": "COMPANY"
      },

      // ========================= PROGRAM
      {
        "id": 15,
        "uid": "61b2423a-280b-4e8f-aa3f-f6b381fd305b",
        "code": "PROGRAM_VIEW",
        "name": "View Programs",
        "description": "View program list and details",
        "category": "Program",
        "scope": "COMPANY"
      },
      {
        "id": 16,
        "uid": "ef903f92-7876-4a30-a2c5-2451b610b095",
        "code": "PROGRAM_CREATE",
        "name": "Create Programs",
        "description": "Create new programs",
        "category": "Program",
        "scope": "COMPANY"
      },
      {
        "id": 17,
        "uid": "ad5200b6-3119-4f1f-8534-0cfb1533f70e",
        "code": "PROGRAM_UPDATE",
        "name": "Update Programs",
        "description": "Update program information",
        "category": "Program",
        "scope": "COMPANY"
      },
      {
        "id": 18,
        "uid": "774b27c5-12f4-4949-82e7-a5d0370989d8",
        "code": "PROGRAM_DELETE",
        "name": "Delete Programs",
        "description": "Delete programs",
        "category": "Program",
        "scope": "COMPANY"
      },

      // ========================= DAILY REPORT
      {
        "id": 19,
        "uid": "65df9c26-1ac8-4ae8-90ec-f8da6f7723f8",
        "code": "DAILY_REPORT_VIEW",
        "name": "View Daily Reports",
        "description": "View daily reports",
        "category": "Daily Report",
        "scope": "COMPANY"
      },
      {
        "id": 20,
        "uid": "94d329a7-037e-489f-b7fb-72780e666f2d",
        "code": "DAILY_REPORT_CREATE",
        "name": "Create Daily Reports",
        "description": "Create daily reports",
        "category": "Daily Report",
        "scope": "COMPANY"
      },
      {
        "id": 21,
        "uid": "faa36598-41cc-47b9-9867-77724efa578b",
        "code": "DAILY_REPORT_UPDATE",
        "name": "Update Daily Reports",
        "description": "Update daily reports",
        "category": "Daily Report",
        "scope": "COMPANY"
      },
      {
        "id": 22,
        "uid": "e7577a71-6f8d-44d4-8305-c83ecfa83364",
        "code": "DAILY_REPORT_DELETE",
        "name": "Delete Daily Reports",
        "description": "Delete daily reports",
        "category": "Daily Report",
        "scope": "COMPANY"
      },

      // ========================= INSPECTION
      {
        "id": 23,
        "uid": "751a879c-63bd-4928-b541-b0e1c37fe1d9",
        "code": "INSPECTION_VIEW",
        "name": "View Inspections",
        "description": "View inspection records",
        "category": "Inspection",
        "scope": "COMPANY"
      },
      {
        "id": 24,
        "uid": "947c7927-1cfc-4290-b5df-1b9eca46d783",
        "code": "INSPECTION_CREATE",
        "name": "Create Inspections",
        "description": "Create inspection records",
        "category": "Inspection",
        "scope": "COMPANY"
      },
      {
        "id": 25,
        "uid": "6bbf92ae-2a8f-40f4-8dc5-b95d72cf5bea",
        "code": "INSPECTION_UPDATE",
        "name": "Update Inspections",
        "description": "Update inspection records",
        "category": "Inspection",
        "scope": "COMPANY"
      },
      {
        "id": 26,
        "uid": "85fb4a00-bbdf-494a-956a-b97e4dd83d2b",
        "code": "INSPECTION_DELETE",
        "name": "Delete Inspections",
        "description": "Delete inspection records",
        "category": "Inspection",
        "scope": "COMPANY"
      },

      // ========================= WORK SCOPE
      {
        "id": 32,
        "uid": "dee6d63c-04fc-42cd-8eae-b0a421f43f45",
        "code": "WORK_SCOPE_VIEW",
        "name": "View Work Scopes",
        "description": "View work scopes",
        "category": "Work Scope",
        "scope": "COMPANY"
      },
      {
        "id": 33,
        "uid": "6d4c499a-3c1a-4ba5-9f0d-e61b75cfca45",
        "code": "WORK_SCOPE_CREATE",
        "name": "Create Work Scopes",
        "description": "Create new work scopes",
        "category": "Work Scope",
        "scope": "COMPANY"
      },
      {
        "id": 34,
        "uid": "5224b3ee-ec3c-4105-ae07-18ef233cbbb3",
        "code": "WORK_SCOPE_UPDATE",
        "name": "Update Work Scopes",
        "description": "Update work scope information",
        "category": "Work Scope",
        "scope": "COMPANY"
      },
      {
        "id": 35,
        "uid": "c021235c-abfe-4a7a-a52f-d832a5cf4a85",
        "code": "WORK_SCOPE_DELETE",
        "name": "Delete Work Scopes",
        "description": "Delete work scopes",
        "category": "Work Scope",
        "scope": "COMPANY"
      },

      // ========================= CONTRACTOR PACKAGE
      {
        "id": 36,
        "uid": "63dc6a94-07f1-467b-b8fd-66d6f35a9d3b",
        "code": "CONTRACTOR_PACKAGE_VIEW",
        "name": "View Contractor Packages",
        "description": "View contractor packages",
        "category": "Contractor Package",
        "scope": "COMPANY"
      },
      {
        "id": 37,
        "uid": "474a5fe0-086b-489c-af7d-86e35145eb6f",
        "code": "CONTRACTOR_PACKAGE_CREATE",
        "name": "Create Contractor Packages",
        "description": "Create contractor packages",
        "category": "Contractor Package",
        "scope": "COMPANY"
      },
      {
        "id": 38,
        "uid": "be130d0e-5965-4624-a949-67f24d88795d",
        "code": "CONTRACTOR_PACKAGE_UPDATE",
        "name": "Update Contractor Packages",
        "description": "Update contractor packages",
        "category": "Contractor Package",
        "scope": "COMPANY"
      },
      {
        "id": 39,
        "uid": "a17dfdae-288c-43c7-b4ed-62c0be94eeb0",
        "code": "CONTRACTOR_PACKAGE_DELETE",
        "name": "Delete Contractor Packages",
        "description": "Delete contractor packages",
        "category": "Contractor Package",
        "scope": "COMPANY"
      },

      // ========================= CONTRACTOR RELATION
      {
        "id": 40,
        "uid": "687e96fc-896a-4fbd-9168-aee35280d900",
        "code": "CONTRACTOR_RELATION_VIEW",
        "name": "View Contractor Relations",
        "description": "View contractor relationships",
        "category": "Contractor Relation",
        "scope": "COMPANY"
      },
      {
        "id": 41,
        "uid": "3d54eb42-49ba-433e-9e9f-438720d04f01",
        "code": "CONTRACTOR_RELATION_INVITE",
        "name": "Invite Contractors",
        "description": "Invite contractors",
        "category": "Contractor Relation",
        "scope": "COMPANY"
      },
      {
        "id": 42,
        "uid": "3b54ca7e-6a4d-4c8c-bd77-7ca47bb2ffcd",
        "code": "CONTRACTOR_RELATION_ACCEPT",
        "name": "Accept/Reject Contractor Invitations",
        "description": "Accept/reject contractor invitations",
        "category": "Contractor Relation",
        "scope": "COMPANY"
      },
      {
        "id": 43,
        "uid": "3901a84d-f7d0-41ce-abee-1f4fdd93442f",
        "code": "CONTRACTOR_RELATION_UPDATE",
        "name": "Update Contractor Relations",
        "description": "Update contractor relationships",
        "category": "Contractor Relation",
        "scope": "COMPANY"
      },
      {
        "id": 44,
        "uid": "2834437a-d5a0-4487-b54f-afdefbb30ed4",
        "code": "CONTRACTOR_RELATION_DELETE",
        "name": "Delete Contractor Relations",
        "description": "Delete contractor relationships",
        "category": "Contractor Relation",
        "scope": "COMPANY"
      },

      // ========================= WARNING
      {
        "id": 45,
        "uid": "471936b1-cae5-433e-9c60-0bdc1fb52ea7",
        "code": "WARNING_VIEW",
        "name": "View Warnings",
        "description": "View warnings",
        "category": "Warning",
        "scope": "COMPANY"
      },
      {
        "id": 46,
        "uid": "004f23ed-b7aa-49f5-ab8b-8b3003867373",
        "code": "WARNING_CREATE",
        "name": "Create Warnings",
        "description": "Create warnings",
        "category": "Warning",
        "scope": "COMPANY"
      },
      {
        "id": 47,
        "uid": "e29e9c0f-224f-4c8a-953f-5292e516ca98",
        "code": "WARNING_UPDATE",
        "name": "Update Warnings",
        "description": "Update warnings",
        "category": "Warning",
        "scope": "COMPANY"
      },
      {
        "id": 48,
        "uid": "9590528a-b375-4199-9406-3d2b317c56f3",
        "code": "WARNING_DELETE",
        "name": "Delete Warnings",
        "description": "Delete warnings",
        "category": "Warning",
        "scope": "COMPANY"
      }
    ]
  }
}