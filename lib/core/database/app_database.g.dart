// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, UserRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _balanceMeta = const VerificationMeta(
    'balance',
  );
  @override
  late final GeneratedColumn<String> balance = GeneratedColumn<String>(
    'balance',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _merchantIdMeta = const VerificationMeta(
    'merchantId',
  );
  @override
  late final GeneratedColumn<String> merchantId = GeneratedColumn<String>(
    'merchant_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _countryMeta = const VerificationMeta(
    'country',
  );
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
    'country',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userDetailMeta = const VerificationMeta(
    'userDetail',
  );
  @override
  late final GeneratedColumn<String> userDetail = GeneratedColumn<String>(
    'user_detail',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _userSettingsMeta = const VerificationMeta(
    'userSettings',
  );
  @override
  late final GeneratedColumn<String> userSettings = GeneratedColumn<String>(
    'user_settings',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    email,
    role,
    phone,
    status,
    balance,
    merchantId,
    country,
    createdAt,
    userDetail,
    userSettings,
    updatedAt,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('balance')) {
      context.handle(
        _balanceMeta,
        balance.isAcceptableOrUnknown(data['balance']!, _balanceMeta),
      );
    } else if (isInserting) {
      context.missing(_balanceMeta);
    }
    if (data.containsKey('merchant_id')) {
      context.handle(
        _merchantIdMeta,
        merchantId.isAcceptableOrUnknown(data['merchant_id']!, _merchantIdMeta),
      );
    }
    if (data.containsKey('country')) {
      context.handle(
        _countryMeta,
        country.isAcceptableOrUnknown(data['country']!, _countryMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('user_detail')) {
      context.handle(
        _userDetailMeta,
        userDetail.isAcceptableOrUnknown(data['user_detail']!, _userDetailMeta),
      );
    }
    if (data.containsKey('user_settings')) {
      context.handle(
        _userSettingsMeta,
        userSettings.isAcceptableOrUnknown(
          data['user_settings']!,
          _userSettingsMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      balance: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}balance'],
      )!,
      merchantId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}merchant_id'],
      ),
      country: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      userDetail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_detail'],
      ),
      userSettings: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_settings'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class UserRecord extends DataClass implements Insertable<UserRecord> {
  final int id;
  final String email;
  final String role;
  final String phone;
  final String status;
  final String balance;
  final String? merchantId;
  final String? country;
  final DateTime createdAt;
  final String? userDetail;
  final String? userSettings;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const UserRecord({
    required this.id,
    required this.email,
    required this.role,
    required this.phone,
    required this.status,
    required this.balance,
    this.merchantId,
    this.country,
    required this.createdAt,
    this.userDetail,
    this.userSettings,
    required this.updatedAt,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['email'] = Variable<String>(email);
    map['role'] = Variable<String>(role);
    map['phone'] = Variable<String>(phone);
    map['status'] = Variable<String>(status);
    map['balance'] = Variable<String>(balance);
    if (!nullToAbsent || merchantId != null) {
      map['merchant_id'] = Variable<String>(merchantId);
    }
    if (!nullToAbsent || country != null) {
      map['country'] = Variable<String>(country);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || userDetail != null) {
      map['user_detail'] = Variable<String>(userDetail);
    }
    if (!nullToAbsent || userSettings != null) {
      map['user_settings'] = Variable<String>(userSettings);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      email: Value(email),
      role: Value(role),
      phone: Value(phone),
      status: Value(status),
      balance: Value(balance),
      merchantId: merchantId == null && nullToAbsent
          ? const Value.absent()
          : Value(merchantId),
      country: country == null && nullToAbsent
          ? const Value.absent()
          : Value(country),
      createdAt: Value(createdAt),
      userDetail: userDetail == null && nullToAbsent
          ? const Value.absent()
          : Value(userDetail),
      userSettings: userSettings == null && nullToAbsent
          ? const Value.absent()
          : Value(userSettings),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory UserRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserRecord(
      id: serializer.fromJson<int>(json['id']),
      email: serializer.fromJson<String>(json['email']),
      role: serializer.fromJson<String>(json['role']),
      phone: serializer.fromJson<String>(json['phone']),
      status: serializer.fromJson<String>(json['status']),
      balance: serializer.fromJson<String>(json['balance']),
      merchantId: serializer.fromJson<String?>(json['merchantId']),
      country: serializer.fromJson<String?>(json['country']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      userDetail: serializer.fromJson<String?>(json['userDetail']),
      userSettings: serializer.fromJson<String?>(json['userSettings']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'email': serializer.toJson<String>(email),
      'role': serializer.toJson<String>(role),
      'phone': serializer.toJson<String>(phone),
      'status': serializer.toJson<String>(status),
      'balance': serializer.toJson<String>(balance),
      'merchantId': serializer.toJson<String?>(merchantId),
      'country': serializer.toJson<String?>(country),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'userDetail': serializer.toJson<String?>(userDetail),
      'userSettings': serializer.toJson<String?>(userSettings),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  UserRecord copyWith({
    int? id,
    String? email,
    String? role,
    String? phone,
    String? status,
    String? balance,
    Value<String?> merchantId = const Value.absent(),
    Value<String?> country = const Value.absent(),
    DateTime? createdAt,
    Value<String?> userDetail = const Value.absent(),
    Value<String?> userSettings = const Value.absent(),
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
  }) => UserRecord(
    id: id ?? this.id,
    email: email ?? this.email,
    role: role ?? this.role,
    phone: phone ?? this.phone,
    status: status ?? this.status,
    balance: balance ?? this.balance,
    merchantId: merchantId.present ? merchantId.value : this.merchantId,
    country: country.present ? country.value : this.country,
    createdAt: createdAt ?? this.createdAt,
    userDetail: userDetail.present ? userDetail.value : this.userDetail,
    userSettings: userSettings.present ? userSettings.value : this.userSettings,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  UserRecord copyWithCompanion(UsersCompanion data) {
    return UserRecord(
      id: data.id.present ? data.id.value : this.id,
      email: data.email.present ? data.email.value : this.email,
      role: data.role.present ? data.role.value : this.role,
      phone: data.phone.present ? data.phone.value : this.phone,
      status: data.status.present ? data.status.value : this.status,
      balance: data.balance.present ? data.balance.value : this.balance,
      merchantId: data.merchantId.present
          ? data.merchantId.value
          : this.merchantId,
      country: data.country.present ? data.country.value : this.country,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      userDetail: data.userDetail.present
          ? data.userDetail.value
          : this.userDetail,
      userSettings: data.userSettings.present
          ? data.userSettings.value
          : this.userSettings,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserRecord(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('role: $role, ')
          ..write('phone: $phone, ')
          ..write('status: $status, ')
          ..write('balance: $balance, ')
          ..write('merchantId: $merchantId, ')
          ..write('country: $country, ')
          ..write('createdAt: $createdAt, ')
          ..write('userDetail: $userDetail, ')
          ..write('userSettings: $userSettings, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    email,
    role,
    phone,
    status,
    balance,
    merchantId,
    country,
    createdAt,
    userDetail,
    userSettings,
    updatedAt,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserRecord &&
          other.id == this.id &&
          other.email == this.email &&
          other.role == this.role &&
          other.phone == this.phone &&
          other.status == this.status &&
          other.balance == this.balance &&
          other.merchantId == this.merchantId &&
          other.country == this.country &&
          other.createdAt == this.createdAt &&
          other.userDetail == this.userDetail &&
          other.userSettings == this.userSettings &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class UsersCompanion extends UpdateCompanion<UserRecord> {
  final Value<int> id;
  final Value<String> email;
  final Value<String> role;
  final Value<String> phone;
  final Value<String> status;
  final Value<String> balance;
  final Value<String?> merchantId;
  final Value<String?> country;
  final Value<DateTime> createdAt;
  final Value<String?> userDetail;
  final Value<String?> userSettings;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.email = const Value.absent(),
    this.role = const Value.absent(),
    this.phone = const Value.absent(),
    this.status = const Value.absent(),
    this.balance = const Value.absent(),
    this.merchantId = const Value.absent(),
    this.country = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.userDetail = const Value.absent(),
    this.userSettings = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String email,
    required String role,
    required String phone,
    required String status,
    required String balance,
    this.merchantId = const Value.absent(),
    this.country = const Value.absent(),
    required DateTime createdAt,
    this.userDetail = const Value.absent(),
    this.userSettings = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  }) : email = Value(email),
       role = Value(role),
       phone = Value(phone),
       status = Value(status),
       balance = Value(balance),
       createdAt = Value(createdAt);
  static Insertable<UserRecord> custom({
    Expression<int>? id,
    Expression<String>? email,
    Expression<String>? role,
    Expression<String>? phone,
    Expression<String>? status,
    Expression<String>? balance,
    Expression<String>? merchantId,
    Expression<String>? country,
    Expression<DateTime>? createdAt,
    Expression<String>? userDetail,
    Expression<String>? userSettings,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (email != null) 'email': email,
      if (role != null) 'role': role,
      if (phone != null) 'phone': phone,
      if (status != null) 'status': status,
      if (balance != null) 'balance': balance,
      if (merchantId != null) 'merchant_id': merchantId,
      if (country != null) 'country': country,
      if (createdAt != null) 'created_at': createdAt,
      if (userDetail != null) 'user_detail': userDetail,
      if (userSettings != null) 'user_settings': userSettings,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  UsersCompanion copyWith({
    Value<int>? id,
    Value<String>? email,
    Value<String>? role,
    Value<String>? phone,
    Value<String>? status,
    Value<String>? balance,
    Value<String?>? merchantId,
    Value<String?>? country,
    Value<DateTime>? createdAt,
    Value<String?>? userDetail,
    Value<String?>? userSettings,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
  }) {
    return UsersCompanion(
      id: id ?? this.id,
      email: email ?? this.email,
      role: role ?? this.role,
      phone: phone ?? this.phone,
      status: status ?? this.status,
      balance: balance ?? this.balance,
      merchantId: merchantId ?? this.merchantId,
      country: country ?? this.country,
      createdAt: createdAt ?? this.createdAt,
      userDetail: userDetail ?? this.userDetail,
      userSettings: userSettings ?? this.userSettings,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (balance.present) {
      map['balance'] = Variable<String>(balance.value);
    }
    if (merchantId.present) {
      map['merchant_id'] = Variable<String>(merchantId.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (userDetail.present) {
      map['user_detail'] = Variable<String>(userDetail.value);
    }
    if (userSettings.present) {
      map['user_settings'] = Variable<String>(userSettings.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('role: $role, ')
          ..write('phone: $phone, ')
          ..write('status: $status, ')
          ..write('balance: $balance, ')
          ..write('merchantId: $merchantId, ')
          ..write('country: $country, ')
          ..write('createdAt: $createdAt, ')
          ..write('userDetail: $userDetail, ')
          ..write('userSettings: $userSettings, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [users];
}

typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      Value<int> id,
      required String email,
      required String role,
      required String phone,
      required String status,
      required String balance,
      Value<String?> merchantId,
      Value<String?> country,
      required DateTime createdAt,
      Value<String?> userDetail,
      Value<String?> userSettings,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<int> id,
      Value<String> email,
      Value<String> role,
      Value<String> phone,
      Value<String> status,
      Value<String> balance,
      Value<String?> merchantId,
      Value<String?> country,
      Value<DateTime> createdAt,
      Value<String?> userDetail,
      Value<String?> userSettings,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
    });

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get balance => $composableBuilder(
    column: $table.balance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get merchantId => $composableBuilder(
    column: $table.merchantId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userDetail => $composableBuilder(
    column: $table.userDetail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userSettings => $composableBuilder(
    column: $table.userSettings,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get balance => $composableBuilder(
    column: $table.balance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get merchantId => $composableBuilder(
    column: $table.merchantId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userDetail => $composableBuilder(
    column: $table.userDetail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userSettings => $composableBuilder(
    column: $table.userSettings,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get balance =>
      $composableBuilder(column: $table.balance, builder: (column) => column);

  GeneratedColumn<String> get merchantId => $composableBuilder(
    column: $table.merchantId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get country =>
      $composableBuilder(column: $table.country, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get userDetail => $composableBuilder(
    column: $table.userDetail,
    builder: (column) => column,
  );

  GeneratedColumn<String> get userSettings => $composableBuilder(
    column: $table.userSettings,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          UserRecord,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (UserRecord, BaseReferences<_$AppDatabase, $UsersTable, UserRecord>),
          UserRecord,
          PrefetchHooks Function()
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<String> phone = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> balance = const Value.absent(),
                Value<String?> merchantId = const Value.absent(),
                Value<String?> country = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String?> userDetail = const Value.absent(),
                Value<String?> userSettings = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
              }) => UsersCompanion(
                id: id,
                email: email,
                role: role,
                phone: phone,
                status: status,
                balance: balance,
                merchantId: merchantId,
                country: country,
                createdAt: createdAt,
                userDetail: userDetail,
                userSettings: userSettings,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String email,
                required String role,
                required String phone,
                required String status,
                required String balance,
                Value<String?> merchantId = const Value.absent(),
                Value<String?> country = const Value.absent(),
                required DateTime createdAt,
                Value<String?> userDetail = const Value.absent(),
                Value<String?> userSettings = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
              }) => UsersCompanion.insert(
                id: id,
                email: email,
                role: role,
                phone: phone,
                status: status,
                balance: balance,
                merchantId: merchantId,
                country: country,
                createdAt: createdAt,
                userDetail: userDetail,
                userSettings: userSettings,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      UserRecord,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (UserRecord, BaseReferences<_$AppDatabase, $UsersTable, UserRecord>),
      UserRecord,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
}
