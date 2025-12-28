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
    requiredDuringInsert: false,
    defaultValue: const Constant('0.00'),
  );
  static const VerificationMeta _merchantIdMeta = const VerificationMeta(
    'merchantId',
  );
  @override
  late final GeneratedColumn<int> merchantId = GeneratedColumn<int>(
    'merchant_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
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
        DriftSqlType.int,
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
  final int? merchantId;
  final String? country;
  final DateTime createdAt;
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
      map['merchant_id'] = Variable<int>(merchantId);
    }
    if (!nullToAbsent || country != null) {
      map['country'] = Variable<String>(country);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
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
      merchantId: serializer.fromJson<int?>(json['merchantId']),
      country: serializer.fromJson<String?>(json['country']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
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
      'merchantId': serializer.toJson<int?>(merchantId),
      'country': serializer.toJson<String?>(country),
      'createdAt': serializer.toJson<DateTime>(createdAt),
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
    Value<int?> merchantId = const Value.absent(),
    Value<String?> country = const Value.absent(),
    DateTime? createdAt,
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
  final Value<int?> merchantId;
  final Value<String?> country;
  final Value<DateTime> createdAt;
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
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String email,
    required String role,
    required String phone,
    required String status,
    this.balance = const Value.absent(),
    this.merchantId = const Value.absent(),
    this.country = const Value.absent(),
    required DateTime createdAt,
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  }) : email = Value(email),
       role = Value(role),
       phone = Value(phone),
       status = Value(status),
       createdAt = Value(createdAt);
  static Insertable<UserRecord> custom({
    Expression<int>? id,
    Expression<String>? email,
    Expression<String>? role,
    Expression<String>? phone,
    Expression<String>? status,
    Expression<String>? balance,
    Expression<int>? merchantId,
    Expression<String>? country,
    Expression<DateTime>? createdAt,
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
    Value<int?>? merchantId,
    Value<String?>? country,
    Value<DateTime>? createdAt,
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
      map['merchant_id'] = Variable<int>(merchantId.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
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
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

class $UserDetailsTable extends UserDetails
    with TableInfo<$UserDetailsTable, UserDetailRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserDetailsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _firstNameMeta = const VerificationMeta(
    'firstName',
  );
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
    'first_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastNameMeta = const VerificationMeta(
    'lastName',
  );
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
    'last_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fullNameMeta = const VerificationMeta(
    'fullName',
  );
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
    'full_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _birthDateMeta = const VerificationMeta(
    'birthDate',
  );
  @override
  late final GeneratedColumn<String> birthDate = GeneratedColumn<String>(
    'birth_date',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _profilePictureMeta = const VerificationMeta(
    'profilePicture',
  );
  @override
  late final GeneratedColumn<String> profilePicture = GeneratedColumn<String>(
    'profile_picture',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gatePointMeta = const VerificationMeta(
    'gatePoint',
  );
  @override
  late final GeneratedColumn<int> gatePoint = GeneratedColumn<int>(
    'gate_point',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _verifyMeta = const VerificationMeta('verify');
  @override
  late final GeneratedColumn<bool> verify = GeneratedColumn<bool>(
    'verify',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("verify" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _vaccountMeta = const VerificationMeta(
    'vaccount',
  );
  @override
  late final GeneratedColumn<String> vaccount = GeneratedColumn<String>(
    'vaccount',
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
  @override
  List<GeneratedColumn> get $columns => [
    userId,
    firstName,
    lastName,
    fullName,
    address,
    birthDate,
    profilePicture,
    gatePoint,
    verify,
    vaccount,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_details';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserDetailRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('first_name')) {
      context.handle(
        _firstNameMeta,
        firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta),
      );
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(
        _lastNameMeta,
        lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta),
      );
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(
        _fullNameMeta,
        fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('birth_date')) {
      context.handle(
        _birthDateMeta,
        birthDate.isAcceptableOrUnknown(data['birth_date']!, _birthDateMeta),
      );
    }
    if (data.containsKey('profile_picture')) {
      context.handle(
        _profilePictureMeta,
        profilePicture.isAcceptableOrUnknown(
          data['profile_picture']!,
          _profilePictureMeta,
        ),
      );
    }
    if (data.containsKey('gate_point')) {
      context.handle(
        _gatePointMeta,
        gatePoint.isAcceptableOrUnknown(data['gate_point']!, _gatePointMeta),
      );
    }
    if (data.containsKey('verify')) {
      context.handle(
        _verifyMeta,
        verify.isAcceptableOrUnknown(data['verify']!, _verifyMeta),
      );
    }
    if (data.containsKey('vaccount')) {
      context.handle(
        _vaccountMeta,
        vaccount.isAcceptableOrUnknown(data['vaccount']!, _vaccountMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  UserDetailRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserDetailRecord(
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      firstName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}first_name'],
      )!,
      lastName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_name'],
      )!,
      fullName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_name'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      birthDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}birth_date'],
      ),
      profilePicture: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}profile_picture'],
      ),
      gatePoint: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}gate_point'],
      )!,
      verify: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}verify'],
      )!,
      vaccount: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}vaccount'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $UserDetailsTable createAlias(String alias) {
    return $UserDetailsTable(attachedDatabase, alias);
  }
}

class UserDetailRecord extends DataClass
    implements Insertable<UserDetailRecord> {
  final int userId;
  final String firstName;
  final String lastName;
  final String fullName;
  final String? address;
  final String? birthDate;
  final String? profilePicture;
  final int gatePoint;
  final bool verify;
  final String? vaccount;
  final DateTime updatedAt;
  const UserDetailRecord({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    this.address,
    this.birthDate,
    this.profilePicture,
    required this.gatePoint,
    required this.verify,
    this.vaccount,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<int>(userId);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    map['full_name'] = Variable<String>(fullName);
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || birthDate != null) {
      map['birth_date'] = Variable<String>(birthDate);
    }
    if (!nullToAbsent || profilePicture != null) {
      map['profile_picture'] = Variable<String>(profilePicture);
    }
    map['gate_point'] = Variable<int>(gatePoint);
    map['verify'] = Variable<bool>(verify);
    if (!nullToAbsent || vaccount != null) {
      map['vaccount'] = Variable<String>(vaccount);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UserDetailsCompanion toCompanion(bool nullToAbsent) {
    return UserDetailsCompanion(
      userId: Value(userId),
      firstName: Value(firstName),
      lastName: Value(lastName),
      fullName: Value(fullName),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      birthDate: birthDate == null && nullToAbsent
          ? const Value.absent()
          : Value(birthDate),
      profilePicture: profilePicture == null && nullToAbsent
          ? const Value.absent()
          : Value(profilePicture),
      gatePoint: Value(gatePoint),
      verify: Value(verify),
      vaccount: vaccount == null && nullToAbsent
          ? const Value.absent()
          : Value(vaccount),
      updatedAt: Value(updatedAt),
    );
  }

  factory UserDetailRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserDetailRecord(
      userId: serializer.fromJson<int>(json['userId']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      fullName: serializer.fromJson<String>(json['fullName']),
      address: serializer.fromJson<String?>(json['address']),
      birthDate: serializer.fromJson<String?>(json['birthDate']),
      profilePicture: serializer.fromJson<String?>(json['profilePicture']),
      gatePoint: serializer.fromJson<int>(json['gatePoint']),
      verify: serializer.fromJson<bool>(json['verify']),
      vaccount: serializer.fromJson<String?>(json['vaccount']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<int>(userId),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'fullName': serializer.toJson<String>(fullName),
      'address': serializer.toJson<String?>(address),
      'birthDate': serializer.toJson<String?>(birthDate),
      'profilePicture': serializer.toJson<String?>(profilePicture),
      'gatePoint': serializer.toJson<int>(gatePoint),
      'verify': serializer.toJson<bool>(verify),
      'vaccount': serializer.toJson<String?>(vaccount),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  UserDetailRecord copyWith({
    int? userId,
    String? firstName,
    String? lastName,
    String? fullName,
    Value<String?> address = const Value.absent(),
    Value<String?> birthDate = const Value.absent(),
    Value<String?> profilePicture = const Value.absent(),
    int? gatePoint,
    bool? verify,
    Value<String?> vaccount = const Value.absent(),
    DateTime? updatedAt,
  }) => UserDetailRecord(
    userId: userId ?? this.userId,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    fullName: fullName ?? this.fullName,
    address: address.present ? address.value : this.address,
    birthDate: birthDate.present ? birthDate.value : this.birthDate,
    profilePicture: profilePicture.present
        ? profilePicture.value
        : this.profilePicture,
    gatePoint: gatePoint ?? this.gatePoint,
    verify: verify ?? this.verify,
    vaccount: vaccount.present ? vaccount.value : this.vaccount,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  UserDetailRecord copyWithCompanion(UserDetailsCompanion data) {
    return UserDetailRecord(
      userId: data.userId.present ? data.userId.value : this.userId,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      address: data.address.present ? data.address.value : this.address,
      birthDate: data.birthDate.present ? data.birthDate.value : this.birthDate,
      profilePicture: data.profilePicture.present
          ? data.profilePicture.value
          : this.profilePicture,
      gatePoint: data.gatePoint.present ? data.gatePoint.value : this.gatePoint,
      verify: data.verify.present ? data.verify.value : this.verify,
      vaccount: data.vaccount.present ? data.vaccount.value : this.vaccount,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserDetailRecord(')
          ..write('userId: $userId, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('fullName: $fullName, ')
          ..write('address: $address, ')
          ..write('birthDate: $birthDate, ')
          ..write('profilePicture: $profilePicture, ')
          ..write('gatePoint: $gatePoint, ')
          ..write('verify: $verify, ')
          ..write('vaccount: $vaccount, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    userId,
    firstName,
    lastName,
    fullName,
    address,
    birthDate,
    profilePicture,
    gatePoint,
    verify,
    vaccount,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserDetailRecord &&
          other.userId == this.userId &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.fullName == this.fullName &&
          other.address == this.address &&
          other.birthDate == this.birthDate &&
          other.profilePicture == this.profilePicture &&
          other.gatePoint == this.gatePoint &&
          other.verify == this.verify &&
          other.vaccount == this.vaccount &&
          other.updatedAt == this.updatedAt);
}

class UserDetailsCompanion extends UpdateCompanion<UserDetailRecord> {
  final Value<int> userId;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String> fullName;
  final Value<String?> address;
  final Value<String?> birthDate;
  final Value<String?> profilePicture;
  final Value<int> gatePoint;
  final Value<bool> verify;
  final Value<String?> vaccount;
  final Value<DateTime> updatedAt;
  const UserDetailsCompanion({
    this.userId = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.fullName = const Value.absent(),
    this.address = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.profilePicture = const Value.absent(),
    this.gatePoint = const Value.absent(),
    this.verify = const Value.absent(),
    this.vaccount = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  UserDetailsCompanion.insert({
    this.userId = const Value.absent(),
    required String firstName,
    required String lastName,
    required String fullName,
    this.address = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.profilePicture = const Value.absent(),
    this.gatePoint = const Value.absent(),
    this.verify = const Value.absent(),
    this.vaccount = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : firstName = Value(firstName),
       lastName = Value(lastName),
       fullName = Value(fullName);
  static Insertable<UserDetailRecord> custom({
    Expression<int>? userId,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? fullName,
    Expression<String>? address,
    Expression<String>? birthDate,
    Expression<String>? profilePicture,
    Expression<int>? gatePoint,
    Expression<bool>? verify,
    Expression<String>? vaccount,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (fullName != null) 'full_name': fullName,
      if (address != null) 'address': address,
      if (birthDate != null) 'birth_date': birthDate,
      if (profilePicture != null) 'profile_picture': profilePicture,
      if (gatePoint != null) 'gate_point': gatePoint,
      if (verify != null) 'verify': verify,
      if (vaccount != null) 'vaccount': vaccount,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  UserDetailsCompanion copyWith({
    Value<int>? userId,
    Value<String>? firstName,
    Value<String>? lastName,
    Value<String>? fullName,
    Value<String?>? address,
    Value<String?>? birthDate,
    Value<String?>? profilePicture,
    Value<int>? gatePoint,
    Value<bool>? verify,
    Value<String?>? vaccount,
    Value<DateTime>? updatedAt,
  }) {
    return UserDetailsCompanion(
      userId: userId ?? this.userId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      fullName: fullName ?? this.fullName,
      address: address ?? this.address,
      birthDate: birthDate ?? this.birthDate,
      profilePicture: profilePicture ?? this.profilePicture,
      gatePoint: gatePoint ?? this.gatePoint,
      verify: verify ?? this.verify,
      vaccount: vaccount ?? this.vaccount,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (birthDate.present) {
      map['birth_date'] = Variable<String>(birthDate.value);
    }
    if (profilePicture.present) {
      map['profile_picture'] = Variable<String>(profilePicture.value);
    }
    if (gatePoint.present) {
      map['gate_point'] = Variable<int>(gatePoint.value);
    }
    if (verify.present) {
      map['verify'] = Variable<bool>(verify.value);
    }
    if (vaccount.present) {
      map['vaccount'] = Variable<String>(vaccount.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserDetailsCompanion(')
          ..write('userId: $userId, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('fullName: $fullName, ')
          ..write('address: $address, ')
          ..write('birthDate: $birthDate, ')
          ..write('profilePicture: $profilePicture, ')
          ..write('gatePoint: $gatePoint, ')
          ..write('verify: $verify, ')
          ..write('vaccount: $vaccount, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $UserSettingsDetailsTable extends UserSettingsDetails
    with TableInfo<$UserSettingsDetailsTable, UserSettingRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserSettingsDetailsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _marketingMeta = const VerificationMeta(
    'marketing',
  );
  @override
  late final GeneratedColumn<bool> marketing = GeneratedColumn<bool>(
    'marketing',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("marketing" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _notificationsMeta = const VerificationMeta(
    'notifications',
  );
  @override
  late final GeneratedColumn<bool> notifications = GeneratedColumn<bool>(
    'notifications',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("notifications" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _twoFAMeta = const VerificationMeta('twoFA');
  @override
  late final GeneratedColumn<bool> twoFA = GeneratedColumn<bool>(
    'two_f_a',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("two_f_a" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
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
  @override
  List<GeneratedColumn> get $columns => [
    userId,
    marketing,
    notifications,
    twoFA,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_settings_details';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserSettingRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('marketing')) {
      context.handle(
        _marketingMeta,
        marketing.isAcceptableOrUnknown(data['marketing']!, _marketingMeta),
      );
    }
    if (data.containsKey('notifications')) {
      context.handle(
        _notificationsMeta,
        notifications.isAcceptableOrUnknown(
          data['notifications']!,
          _notificationsMeta,
        ),
      );
    }
    if (data.containsKey('two_f_a')) {
      context.handle(
        _twoFAMeta,
        twoFA.isAcceptableOrUnknown(data['two_f_a']!, _twoFAMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  UserSettingRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserSettingRecord(
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      marketing: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}marketing'],
      )!,
      notifications: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}notifications'],
      )!,
      twoFA: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}two_f_a'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $UserSettingsDetailsTable createAlias(String alias) {
    return $UserSettingsDetailsTable(attachedDatabase, alias);
  }
}

class UserSettingRecord extends DataClass
    implements Insertable<UserSettingRecord> {
  final int userId;
  final bool marketing;
  final bool notifications;
  final bool twoFA;
  final DateTime updatedAt;
  const UserSettingRecord({
    required this.userId,
    required this.marketing,
    required this.notifications,
    required this.twoFA,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<int>(userId);
    map['marketing'] = Variable<bool>(marketing);
    map['notifications'] = Variable<bool>(notifications);
    map['two_f_a'] = Variable<bool>(twoFA);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UserSettingsDetailsCompanion toCompanion(bool nullToAbsent) {
    return UserSettingsDetailsCompanion(
      userId: Value(userId),
      marketing: Value(marketing),
      notifications: Value(notifications),
      twoFA: Value(twoFA),
      updatedAt: Value(updatedAt),
    );
  }

  factory UserSettingRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserSettingRecord(
      userId: serializer.fromJson<int>(json['userId']),
      marketing: serializer.fromJson<bool>(json['marketing']),
      notifications: serializer.fromJson<bool>(json['notifications']),
      twoFA: serializer.fromJson<bool>(json['twoFA']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<int>(userId),
      'marketing': serializer.toJson<bool>(marketing),
      'notifications': serializer.toJson<bool>(notifications),
      'twoFA': serializer.toJson<bool>(twoFA),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  UserSettingRecord copyWith({
    int? userId,
    bool? marketing,
    bool? notifications,
    bool? twoFA,
    DateTime? updatedAt,
  }) => UserSettingRecord(
    userId: userId ?? this.userId,
    marketing: marketing ?? this.marketing,
    notifications: notifications ?? this.notifications,
    twoFA: twoFA ?? this.twoFA,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  UserSettingRecord copyWithCompanion(UserSettingsDetailsCompanion data) {
    return UserSettingRecord(
      userId: data.userId.present ? data.userId.value : this.userId,
      marketing: data.marketing.present ? data.marketing.value : this.marketing,
      notifications: data.notifications.present
          ? data.notifications.value
          : this.notifications,
      twoFA: data.twoFA.present ? data.twoFA.value : this.twoFA,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserSettingRecord(')
          ..write('userId: $userId, ')
          ..write('marketing: $marketing, ')
          ..write('notifications: $notifications, ')
          ..write('twoFA: $twoFA, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(userId, marketing, notifications, twoFA, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserSettingRecord &&
          other.userId == this.userId &&
          other.marketing == this.marketing &&
          other.notifications == this.notifications &&
          other.twoFA == this.twoFA &&
          other.updatedAt == this.updatedAt);
}

class UserSettingsDetailsCompanion extends UpdateCompanion<UserSettingRecord> {
  final Value<int> userId;
  final Value<bool> marketing;
  final Value<bool> notifications;
  final Value<bool> twoFA;
  final Value<DateTime> updatedAt;
  const UserSettingsDetailsCompanion({
    this.userId = const Value.absent(),
    this.marketing = const Value.absent(),
    this.notifications = const Value.absent(),
    this.twoFA = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  UserSettingsDetailsCompanion.insert({
    this.userId = const Value.absent(),
    this.marketing = const Value.absent(),
    this.notifications = const Value.absent(),
    this.twoFA = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<UserSettingRecord> custom({
    Expression<int>? userId,
    Expression<bool>? marketing,
    Expression<bool>? notifications,
    Expression<bool>? twoFA,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (marketing != null) 'marketing': marketing,
      if (notifications != null) 'notifications': notifications,
      if (twoFA != null) 'two_f_a': twoFA,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  UserSettingsDetailsCompanion copyWith({
    Value<int>? userId,
    Value<bool>? marketing,
    Value<bool>? notifications,
    Value<bool>? twoFA,
    Value<DateTime>? updatedAt,
  }) {
    return UserSettingsDetailsCompanion(
      userId: userId ?? this.userId,
      marketing: marketing ?? this.marketing,
      notifications: notifications ?? this.notifications,
      twoFA: twoFA ?? this.twoFA,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (marketing.present) {
      map['marketing'] = Variable<bool>(marketing.value);
    }
    if (notifications.present) {
      map['notifications'] = Variable<bool>(notifications.value);
    }
    if (twoFA.present) {
      map['two_f_a'] = Variable<bool>(twoFA.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserSettingsDetailsCompanion(')
          ..write('userId: $userId, ')
          ..write('marketing: $marketing, ')
          ..write('notifications: $notifications, ')
          ..write('twoFA: $twoFA, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $UserDetailsTable userDetails = $UserDetailsTable(this);
  late final $UserSettingsDetailsTable userSettingsDetails =
      $UserSettingsDetailsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    users,
    userDetails,
    userSettingsDetails,
  ];
}

typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      Value<int> id,
      required String email,
      required String role,
      required String phone,
      required String status,
      Value<String> balance,
      Value<int?> merchantId,
      Value<String?> country,
      required DateTime createdAt,
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
      Value<int?> merchantId,
      Value<String?> country,
      Value<DateTime> createdAt,
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

  ColumnFilters<int> get merchantId => $composableBuilder(
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

  ColumnOrderings<int> get merchantId => $composableBuilder(
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

  GeneratedColumn<int> get merchantId => $composableBuilder(
    column: $table.merchantId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get country =>
      $composableBuilder(column: $table.country, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

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
                Value<int?> merchantId = const Value.absent(),
                Value<String?> country = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
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
                Value<String> balance = const Value.absent(),
                Value<int?> merchantId = const Value.absent(),
                Value<String?> country = const Value.absent(),
                required DateTime createdAt,
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
typedef $$UserDetailsTableCreateCompanionBuilder =
    UserDetailsCompanion Function({
      Value<int> userId,
      required String firstName,
      required String lastName,
      required String fullName,
      Value<String?> address,
      Value<String?> birthDate,
      Value<String?> profilePicture,
      Value<int> gatePoint,
      Value<bool> verify,
      Value<String?> vaccount,
      Value<DateTime> updatedAt,
    });
typedef $$UserDetailsTableUpdateCompanionBuilder =
    UserDetailsCompanion Function({
      Value<int> userId,
      Value<String> firstName,
      Value<String> lastName,
      Value<String> fullName,
      Value<String?> address,
      Value<String?> birthDate,
      Value<String?> profilePicture,
      Value<int> gatePoint,
      Value<bool> verify,
      Value<String?> vaccount,
      Value<DateTime> updatedAt,
    });

class $$UserDetailsTableFilterComposer
    extends Composer<_$AppDatabase, $UserDetailsTable> {
  $$UserDetailsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get birthDate => $composableBuilder(
    column: $table.birthDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get profilePicture => $composableBuilder(
    column: $table.profilePicture,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get gatePoint => $composableBuilder(
    column: $table.gatePoint,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get verify => $composableBuilder(
    column: $table.verify,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get vaccount => $composableBuilder(
    column: $table.vaccount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserDetailsTableOrderingComposer
    extends Composer<_$AppDatabase, $UserDetailsTable> {
  $$UserDetailsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get birthDate => $composableBuilder(
    column: $table.birthDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get profilePicture => $composableBuilder(
    column: $table.profilePicture,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get gatePoint => $composableBuilder(
    column: $table.gatePoint,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get verify => $composableBuilder(
    column: $table.verify,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get vaccount => $composableBuilder(
    column: $table.vaccount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserDetailsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserDetailsTable> {
  $$UserDetailsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get birthDate =>
      $composableBuilder(column: $table.birthDate, builder: (column) => column);

  GeneratedColumn<String> get profilePicture => $composableBuilder(
    column: $table.profilePicture,
    builder: (column) => column,
  );

  GeneratedColumn<int> get gatePoint =>
      $composableBuilder(column: $table.gatePoint, builder: (column) => column);

  GeneratedColumn<bool> get verify =>
      $composableBuilder(column: $table.verify, builder: (column) => column);

  GeneratedColumn<String> get vaccount =>
      $composableBuilder(column: $table.vaccount, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$UserDetailsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserDetailsTable,
          UserDetailRecord,
          $$UserDetailsTableFilterComposer,
          $$UserDetailsTableOrderingComposer,
          $$UserDetailsTableAnnotationComposer,
          $$UserDetailsTableCreateCompanionBuilder,
          $$UserDetailsTableUpdateCompanionBuilder,
          (
            UserDetailRecord,
            BaseReferences<_$AppDatabase, $UserDetailsTable, UserDetailRecord>,
          ),
          UserDetailRecord,
          PrefetchHooks Function()
        > {
  $$UserDetailsTableTableManager(_$AppDatabase db, $UserDetailsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserDetailsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserDetailsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserDetailsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> userId = const Value.absent(),
                Value<String> firstName = const Value.absent(),
                Value<String> lastName = const Value.absent(),
                Value<String> fullName = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> birthDate = const Value.absent(),
                Value<String?> profilePicture = const Value.absent(),
                Value<int> gatePoint = const Value.absent(),
                Value<bool> verify = const Value.absent(),
                Value<String?> vaccount = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => UserDetailsCompanion(
                userId: userId,
                firstName: firstName,
                lastName: lastName,
                fullName: fullName,
                address: address,
                birthDate: birthDate,
                profilePicture: profilePicture,
                gatePoint: gatePoint,
                verify: verify,
                vaccount: vaccount,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> userId = const Value.absent(),
                required String firstName,
                required String lastName,
                required String fullName,
                Value<String?> address = const Value.absent(),
                Value<String?> birthDate = const Value.absent(),
                Value<String?> profilePicture = const Value.absent(),
                Value<int> gatePoint = const Value.absent(),
                Value<bool> verify = const Value.absent(),
                Value<String?> vaccount = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => UserDetailsCompanion.insert(
                userId: userId,
                firstName: firstName,
                lastName: lastName,
                fullName: fullName,
                address: address,
                birthDate: birthDate,
                profilePicture: profilePicture,
                gatePoint: gatePoint,
                verify: verify,
                vaccount: vaccount,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserDetailsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserDetailsTable,
      UserDetailRecord,
      $$UserDetailsTableFilterComposer,
      $$UserDetailsTableOrderingComposer,
      $$UserDetailsTableAnnotationComposer,
      $$UserDetailsTableCreateCompanionBuilder,
      $$UserDetailsTableUpdateCompanionBuilder,
      (
        UserDetailRecord,
        BaseReferences<_$AppDatabase, $UserDetailsTable, UserDetailRecord>,
      ),
      UserDetailRecord,
      PrefetchHooks Function()
    >;
typedef $$UserSettingsDetailsTableCreateCompanionBuilder =
    UserSettingsDetailsCompanion Function({
      Value<int> userId,
      Value<bool> marketing,
      Value<bool> notifications,
      Value<bool> twoFA,
      Value<DateTime> updatedAt,
    });
typedef $$UserSettingsDetailsTableUpdateCompanionBuilder =
    UserSettingsDetailsCompanion Function({
      Value<int> userId,
      Value<bool> marketing,
      Value<bool> notifications,
      Value<bool> twoFA,
      Value<DateTime> updatedAt,
    });

class $$UserSettingsDetailsTableFilterComposer
    extends Composer<_$AppDatabase, $UserSettingsDetailsTable> {
  $$UserSettingsDetailsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get marketing => $composableBuilder(
    column: $table.marketing,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get notifications => $composableBuilder(
    column: $table.notifications,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get twoFA => $composableBuilder(
    column: $table.twoFA,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserSettingsDetailsTableOrderingComposer
    extends Composer<_$AppDatabase, $UserSettingsDetailsTable> {
  $$UserSettingsDetailsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get marketing => $composableBuilder(
    column: $table.marketing,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get notifications => $composableBuilder(
    column: $table.notifications,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get twoFA => $composableBuilder(
    column: $table.twoFA,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserSettingsDetailsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserSettingsDetailsTable> {
  $$UserSettingsDetailsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<bool> get marketing =>
      $composableBuilder(column: $table.marketing, builder: (column) => column);

  GeneratedColumn<bool> get notifications => $composableBuilder(
    column: $table.notifications,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get twoFA =>
      $composableBuilder(column: $table.twoFA, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$UserSettingsDetailsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserSettingsDetailsTable,
          UserSettingRecord,
          $$UserSettingsDetailsTableFilterComposer,
          $$UserSettingsDetailsTableOrderingComposer,
          $$UserSettingsDetailsTableAnnotationComposer,
          $$UserSettingsDetailsTableCreateCompanionBuilder,
          $$UserSettingsDetailsTableUpdateCompanionBuilder,
          (
            UserSettingRecord,
            BaseReferences<
              _$AppDatabase,
              $UserSettingsDetailsTable,
              UserSettingRecord
            >,
          ),
          UserSettingRecord,
          PrefetchHooks Function()
        > {
  $$UserSettingsDetailsTableTableManager(
    _$AppDatabase db,
    $UserSettingsDetailsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserSettingsDetailsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserSettingsDetailsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$UserSettingsDetailsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> userId = const Value.absent(),
                Value<bool> marketing = const Value.absent(),
                Value<bool> notifications = const Value.absent(),
                Value<bool> twoFA = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => UserSettingsDetailsCompanion(
                userId: userId,
                marketing: marketing,
                notifications: notifications,
                twoFA: twoFA,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> userId = const Value.absent(),
                Value<bool> marketing = const Value.absent(),
                Value<bool> notifications = const Value.absent(),
                Value<bool> twoFA = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => UserSettingsDetailsCompanion.insert(
                userId: userId,
                marketing: marketing,
                notifications: notifications,
                twoFA: twoFA,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserSettingsDetailsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserSettingsDetailsTable,
      UserSettingRecord,
      $$UserSettingsDetailsTableFilterComposer,
      $$UserSettingsDetailsTableOrderingComposer,
      $$UserSettingsDetailsTableAnnotationComposer,
      $$UserSettingsDetailsTableCreateCompanionBuilder,
      $$UserSettingsDetailsTableUpdateCompanionBuilder,
      (
        UserSettingRecord,
        BaseReferences<
          _$AppDatabase,
          $UserSettingsDetailsTable,
          UserSettingRecord
        >,
      ),
      UserSettingRecord,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$UserDetailsTableTableManager get userDetails =>
      $$UserDetailsTableTableManager(_db, _db.userDetails);
  $$UserSettingsDetailsTableTableManager get userSettingsDetails =>
      $$UserSettingsDetailsTableTableManager(_db, _db.userSettingsDetails);
}
