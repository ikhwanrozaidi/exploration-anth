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
  late final GeneratedColumn<String> verify = GeneratedColumn<String>(
    'verify',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
    } else if (isInserting) {
      context.missing(_verifyMeta);
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
        DriftSqlType.string,
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
  final String verify;
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
    map['verify'] = Variable<String>(verify);
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
      verify: serializer.fromJson<String>(json['verify']),
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
      'verify': serializer.toJson<String>(verify),
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
    String? verify,
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
  final Value<String> verify;
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
    required String verify,
    this.vaccount = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : firstName = Value(firstName),
       lastName = Value(lastName),
       fullName = Value(fullName),
       verify = Value(verify);
  static Insertable<UserDetailRecord> custom({
    Expression<int>? userId,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? fullName,
    Expression<String>? address,
    Expression<String>? birthDate,
    Expression<String>? profilePicture,
    Expression<int>? gatePoint,
    Expression<String>? verify,
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
    Value<String>? verify,
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
      map['verify'] = Variable<String>(verify.value);
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

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, TransactionRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _paymentIdMeta = const VerificationMeta(
    'paymentId',
  );
  @override
  late final GeneratedColumn<String> paymentId = GeneratedColumn<String>(
    'payment_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paymentTypeMeta = const VerificationMeta(
    'paymentType',
  );
  @override
  late final GeneratedColumn<String> paymentType = GeneratedColumn<String>(
    'payment_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sellerIdMeta = const VerificationMeta(
    'sellerId',
  );
  @override
  late final GeneratedColumn<int> sellerId = GeneratedColumn<int>(
    'seller_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _buyerIdMeta = const VerificationMeta(
    'buyerId',
  );
  @override
  late final GeneratedColumn<int> buyerId = GeneratedColumn<int>(
    'buyer_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
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
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _providerIdMeta = const VerificationMeta(
    'providerId',
  );
  @override
  late final GeneratedColumn<String> providerId = GeneratedColumn<String>(
    'provider_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isCompletedMeta = const VerificationMeta(
    'isCompleted',
  );
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
    'is_completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_completed" IN (0, 1))',
    ),
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
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userRoleMeta = const VerificationMeta(
    'userRole',
  );
  @override
  late final GeneratedColumn<String> userRole = GeneratedColumn<String>(
    'user_role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    paymentId,
    paymentType,
    sellerId,
    buyerId,
    merchantId,
    amount,
    providerId,
    isCompleted,
    createdAt,
    updatedAt,
    userRole,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions';
  @override
  VerificationContext validateIntegrity(
    Insertable<TransactionRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('payment_id')) {
      context.handle(
        _paymentIdMeta,
        paymentId.isAcceptableOrUnknown(data['payment_id']!, _paymentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_paymentIdMeta);
    }
    if (data.containsKey('payment_type')) {
      context.handle(
        _paymentTypeMeta,
        paymentType.isAcceptableOrUnknown(
          data['payment_type']!,
          _paymentTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_paymentTypeMeta);
    }
    if (data.containsKey('seller_id')) {
      context.handle(
        _sellerIdMeta,
        sellerId.isAcceptableOrUnknown(data['seller_id']!, _sellerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sellerIdMeta);
    }
    if (data.containsKey('buyer_id')) {
      context.handle(
        _buyerIdMeta,
        buyerId.isAcceptableOrUnknown(data['buyer_id']!, _buyerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_buyerIdMeta);
    }
    if (data.containsKey('merchant_id')) {
      context.handle(
        _merchantIdMeta,
        merchantId.isAcceptableOrUnknown(data['merchant_id']!, _merchantIdMeta),
      );
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('provider_id')) {
      context.handle(
        _providerIdMeta,
        providerId.isAcceptableOrUnknown(data['provider_id']!, _providerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_providerIdMeta);
    }
    if (data.containsKey('is_completed')) {
      context.handle(
        _isCompletedMeta,
        isCompleted.isAcceptableOrUnknown(
          data['is_completed']!,
          _isCompletedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_isCompletedMeta);
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
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('user_role')) {
      context.handle(
        _userRoleMeta,
        userRole.isAcceptableOrUnknown(data['user_role']!, _userRoleMeta),
      );
    } else if (isInserting) {
      context.missing(_userRoleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {paymentId};
  @override
  TransactionRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionRecord(
      paymentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_id'],
      )!,
      paymentType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_type'],
      )!,
      sellerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}seller_id'],
      )!,
      buyerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}buyer_id'],
      )!,
      merchantId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}merchant_id'],
      ),
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      providerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}provider_id'],
      )!,
      isCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_completed'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      userRole: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_role'],
      )!,
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }
}

class TransactionRecord extends DataClass
    implements Insertable<TransactionRecord> {
  final String paymentId;
  final String paymentType;
  final int sellerId;
  final int buyerId;
  final int? merchantId;
  final int amount;
  final String providerId;
  final bool isCompleted;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String userRole;
  const TransactionRecord({
    required this.paymentId,
    required this.paymentType,
    required this.sellerId,
    required this.buyerId,
    this.merchantId,
    required this.amount,
    required this.providerId,
    required this.isCompleted,
    required this.createdAt,
    required this.updatedAt,
    required this.userRole,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['payment_id'] = Variable<String>(paymentId);
    map['payment_type'] = Variable<String>(paymentType);
    map['seller_id'] = Variable<int>(sellerId);
    map['buyer_id'] = Variable<int>(buyerId);
    if (!nullToAbsent || merchantId != null) {
      map['merchant_id'] = Variable<int>(merchantId);
    }
    map['amount'] = Variable<int>(amount);
    map['provider_id'] = Variable<String>(providerId);
    map['is_completed'] = Variable<bool>(isCompleted);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['user_role'] = Variable<String>(userRole);
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      paymentId: Value(paymentId),
      paymentType: Value(paymentType),
      sellerId: Value(sellerId),
      buyerId: Value(buyerId),
      merchantId: merchantId == null && nullToAbsent
          ? const Value.absent()
          : Value(merchantId),
      amount: Value(amount),
      providerId: Value(providerId),
      isCompleted: Value(isCompleted),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      userRole: Value(userRole),
    );
  }

  factory TransactionRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionRecord(
      paymentId: serializer.fromJson<String>(json['paymentId']),
      paymentType: serializer.fromJson<String>(json['paymentType']),
      sellerId: serializer.fromJson<int>(json['sellerId']),
      buyerId: serializer.fromJson<int>(json['buyerId']),
      merchantId: serializer.fromJson<int?>(json['merchantId']),
      amount: serializer.fromJson<int>(json['amount']),
      providerId: serializer.fromJson<String>(json['providerId']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      userRole: serializer.fromJson<String>(json['userRole']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'paymentId': serializer.toJson<String>(paymentId),
      'paymentType': serializer.toJson<String>(paymentType),
      'sellerId': serializer.toJson<int>(sellerId),
      'buyerId': serializer.toJson<int>(buyerId),
      'merchantId': serializer.toJson<int?>(merchantId),
      'amount': serializer.toJson<int>(amount),
      'providerId': serializer.toJson<String>(providerId),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'userRole': serializer.toJson<String>(userRole),
    };
  }

  TransactionRecord copyWith({
    String? paymentId,
    String? paymentType,
    int? sellerId,
    int? buyerId,
    Value<int?> merchantId = const Value.absent(),
    int? amount,
    String? providerId,
    bool? isCompleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? userRole,
  }) => TransactionRecord(
    paymentId: paymentId ?? this.paymentId,
    paymentType: paymentType ?? this.paymentType,
    sellerId: sellerId ?? this.sellerId,
    buyerId: buyerId ?? this.buyerId,
    merchantId: merchantId.present ? merchantId.value : this.merchantId,
    amount: amount ?? this.amount,
    providerId: providerId ?? this.providerId,
    isCompleted: isCompleted ?? this.isCompleted,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    userRole: userRole ?? this.userRole,
  );
  TransactionRecord copyWithCompanion(TransactionsCompanion data) {
    return TransactionRecord(
      paymentId: data.paymentId.present ? data.paymentId.value : this.paymentId,
      paymentType: data.paymentType.present
          ? data.paymentType.value
          : this.paymentType,
      sellerId: data.sellerId.present ? data.sellerId.value : this.sellerId,
      buyerId: data.buyerId.present ? data.buyerId.value : this.buyerId,
      merchantId: data.merchantId.present
          ? data.merchantId.value
          : this.merchantId,
      amount: data.amount.present ? data.amount.value : this.amount,
      providerId: data.providerId.present
          ? data.providerId.value
          : this.providerId,
      isCompleted: data.isCompleted.present
          ? data.isCompleted.value
          : this.isCompleted,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      userRole: data.userRole.present ? data.userRole.value : this.userRole,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionRecord(')
          ..write('paymentId: $paymentId, ')
          ..write('paymentType: $paymentType, ')
          ..write('sellerId: $sellerId, ')
          ..write('buyerId: $buyerId, ')
          ..write('merchantId: $merchantId, ')
          ..write('amount: $amount, ')
          ..write('providerId: $providerId, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('userRole: $userRole')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    paymentId,
    paymentType,
    sellerId,
    buyerId,
    merchantId,
    amount,
    providerId,
    isCompleted,
    createdAt,
    updatedAt,
    userRole,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionRecord &&
          other.paymentId == this.paymentId &&
          other.paymentType == this.paymentType &&
          other.sellerId == this.sellerId &&
          other.buyerId == this.buyerId &&
          other.merchantId == this.merchantId &&
          other.amount == this.amount &&
          other.providerId == this.providerId &&
          other.isCompleted == this.isCompleted &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.userRole == this.userRole);
}

class TransactionsCompanion extends UpdateCompanion<TransactionRecord> {
  final Value<String> paymentId;
  final Value<String> paymentType;
  final Value<int> sellerId;
  final Value<int> buyerId;
  final Value<int?> merchantId;
  final Value<int> amount;
  final Value<String> providerId;
  final Value<bool> isCompleted;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> userRole;
  final Value<int> rowid;
  const TransactionsCompanion({
    this.paymentId = const Value.absent(),
    this.paymentType = const Value.absent(),
    this.sellerId = const Value.absent(),
    this.buyerId = const Value.absent(),
    this.merchantId = const Value.absent(),
    this.amount = const Value.absent(),
    this.providerId = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.userRole = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TransactionsCompanion.insert({
    required String paymentId,
    required String paymentType,
    required int sellerId,
    required int buyerId,
    this.merchantId = const Value.absent(),
    required int amount,
    required String providerId,
    required bool isCompleted,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String userRole,
    this.rowid = const Value.absent(),
  }) : paymentId = Value(paymentId),
       paymentType = Value(paymentType),
       sellerId = Value(sellerId),
       buyerId = Value(buyerId),
       amount = Value(amount),
       providerId = Value(providerId),
       isCompleted = Value(isCompleted),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       userRole = Value(userRole);
  static Insertable<TransactionRecord> custom({
    Expression<String>? paymentId,
    Expression<String>? paymentType,
    Expression<int>? sellerId,
    Expression<int>? buyerId,
    Expression<int>? merchantId,
    Expression<int>? amount,
    Expression<String>? providerId,
    Expression<bool>? isCompleted,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? userRole,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (paymentId != null) 'payment_id': paymentId,
      if (paymentType != null) 'payment_type': paymentType,
      if (sellerId != null) 'seller_id': sellerId,
      if (buyerId != null) 'buyer_id': buyerId,
      if (merchantId != null) 'merchant_id': merchantId,
      if (amount != null) 'amount': amount,
      if (providerId != null) 'provider_id': providerId,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (userRole != null) 'user_role': userRole,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TransactionsCompanion copyWith({
    Value<String>? paymentId,
    Value<String>? paymentType,
    Value<int>? sellerId,
    Value<int>? buyerId,
    Value<int?>? merchantId,
    Value<int>? amount,
    Value<String>? providerId,
    Value<bool>? isCompleted,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? userRole,
    Value<int>? rowid,
  }) {
    return TransactionsCompanion(
      paymentId: paymentId ?? this.paymentId,
      paymentType: paymentType ?? this.paymentType,
      sellerId: sellerId ?? this.sellerId,
      buyerId: buyerId ?? this.buyerId,
      merchantId: merchantId ?? this.merchantId,
      amount: amount ?? this.amount,
      providerId: providerId ?? this.providerId,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      userRole: userRole ?? this.userRole,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (paymentId.present) {
      map['payment_id'] = Variable<String>(paymentId.value);
    }
    if (paymentType.present) {
      map['payment_type'] = Variable<String>(paymentType.value);
    }
    if (sellerId.present) {
      map['seller_id'] = Variable<int>(sellerId.value);
    }
    if (buyerId.present) {
      map['buyer_id'] = Variable<int>(buyerId.value);
    }
    if (merchantId.present) {
      map['merchant_id'] = Variable<int>(merchantId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (providerId.present) {
      map['provider_id'] = Variable<String>(providerId.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (userRole.present) {
      map['user_role'] = Variable<String>(userRole.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('paymentId: $paymentId, ')
          ..write('paymentType: $paymentType, ')
          ..write('sellerId: $sellerId, ')
          ..write('buyerId: $buyerId, ')
          ..write('merchantId: $merchantId, ')
          ..write('amount: $amount, ')
          ..write('providerId: $providerId, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('userRole: $userRole, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PaymentDetailsTableTable extends PaymentDetailsTable
    with TableInfo<$PaymentDetailsTableTable, PaymentDetailsRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaymentDetailsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _paymentIdMeta = const VerificationMeta(
    'paymentId',
  );
  @override
  late final GeneratedColumn<String> paymentId = GeneratedColumn<String>(
    'payment_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _productNameMeta = const VerificationMeta(
    'productName',
  );
  @override
  late final GeneratedColumn<String> productName = GeneratedColumn<String>(
    'product_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _productDescMeta = const VerificationMeta(
    'productDesc',
  );
  @override
  late final GeneratedColumn<String> productDesc = GeneratedColumn<String>(
    'product_desc',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _productCatMeta = const VerificationMeta(
    'productCat',
  );
  @override
  late final GeneratedColumn<String> productCat = GeneratedColumn<String>(
    'product_cat',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _refundableMeta = const VerificationMeta(
    'refundable',
  );
  @override
  late final GeneratedColumn<bool> refundable = GeneratedColumn<bool>(
    'refundable',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("refundable" IN (0, 1))',
    ),
  );
  static const VerificationMeta _deliveryStatusMeta = const VerificationMeta(
    'deliveryStatus',
  );
  @override
  late final GeneratedColumn<String> deliveryStatus = GeneratedColumn<String>(
    'delivery_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    paymentId,
    productName,
    productDesc,
    productCat,
    amount,
    refundable,
    deliveryStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payment_details_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<PaymentDetailsRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('payment_id')) {
      context.handle(
        _paymentIdMeta,
        paymentId.isAcceptableOrUnknown(data['payment_id']!, _paymentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_paymentIdMeta);
    }
    if (data.containsKey('product_name')) {
      context.handle(
        _productNameMeta,
        productName.isAcceptableOrUnknown(
          data['product_name']!,
          _productNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    if (data.containsKey('product_desc')) {
      context.handle(
        _productDescMeta,
        productDesc.isAcceptableOrUnknown(
          data['product_desc']!,
          _productDescMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_productDescMeta);
    }
    if (data.containsKey('product_cat')) {
      context.handle(
        _productCatMeta,
        productCat.isAcceptableOrUnknown(data['product_cat']!, _productCatMeta),
      );
    } else if (isInserting) {
      context.missing(_productCatMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('refundable')) {
      context.handle(
        _refundableMeta,
        refundable.isAcceptableOrUnknown(data['refundable']!, _refundableMeta),
      );
    } else if (isInserting) {
      context.missing(_refundableMeta);
    }
    if (data.containsKey('delivery_status')) {
      context.handle(
        _deliveryStatusMeta,
        deliveryStatus.isAcceptableOrUnknown(
          data['delivery_status']!,
          _deliveryStatusMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_deliveryStatusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {paymentId};
  @override
  PaymentDetailsRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PaymentDetailsRecord(
      paymentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_id'],
      )!,
      productName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_name'],
      )!,
      productDesc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_desc'],
      )!,
      productCat: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_cat'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      refundable: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}refundable'],
      )!,
      deliveryStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}delivery_status'],
      )!,
    );
  }

  @override
  $PaymentDetailsTableTable createAlias(String alias) {
    return $PaymentDetailsTableTable(attachedDatabase, alias);
  }
}

class PaymentDetailsRecord extends DataClass
    implements Insertable<PaymentDetailsRecord> {
  final String paymentId;
  final String productName;
  final String productDesc;
  final String productCat;
  final int amount;
  final bool refundable;
  final String deliveryStatus;
  const PaymentDetailsRecord({
    required this.paymentId,
    required this.productName,
    required this.productDesc,
    required this.productCat,
    required this.amount,
    required this.refundable,
    required this.deliveryStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['payment_id'] = Variable<String>(paymentId);
    map['product_name'] = Variable<String>(productName);
    map['product_desc'] = Variable<String>(productDesc);
    map['product_cat'] = Variable<String>(productCat);
    map['amount'] = Variable<int>(amount);
    map['refundable'] = Variable<bool>(refundable);
    map['delivery_status'] = Variable<String>(deliveryStatus);
    return map;
  }

  PaymentDetailsTableCompanion toCompanion(bool nullToAbsent) {
    return PaymentDetailsTableCompanion(
      paymentId: Value(paymentId),
      productName: Value(productName),
      productDesc: Value(productDesc),
      productCat: Value(productCat),
      amount: Value(amount),
      refundable: Value(refundable),
      deliveryStatus: Value(deliveryStatus),
    );
  }

  factory PaymentDetailsRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PaymentDetailsRecord(
      paymentId: serializer.fromJson<String>(json['paymentId']),
      productName: serializer.fromJson<String>(json['productName']),
      productDesc: serializer.fromJson<String>(json['productDesc']),
      productCat: serializer.fromJson<String>(json['productCat']),
      amount: serializer.fromJson<int>(json['amount']),
      refundable: serializer.fromJson<bool>(json['refundable']),
      deliveryStatus: serializer.fromJson<String>(json['deliveryStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'paymentId': serializer.toJson<String>(paymentId),
      'productName': serializer.toJson<String>(productName),
      'productDesc': serializer.toJson<String>(productDesc),
      'productCat': serializer.toJson<String>(productCat),
      'amount': serializer.toJson<int>(amount),
      'refundable': serializer.toJson<bool>(refundable),
      'deliveryStatus': serializer.toJson<String>(deliveryStatus),
    };
  }

  PaymentDetailsRecord copyWith({
    String? paymentId,
    String? productName,
    String? productDesc,
    String? productCat,
    int? amount,
    bool? refundable,
    String? deliveryStatus,
  }) => PaymentDetailsRecord(
    paymentId: paymentId ?? this.paymentId,
    productName: productName ?? this.productName,
    productDesc: productDesc ?? this.productDesc,
    productCat: productCat ?? this.productCat,
    amount: amount ?? this.amount,
    refundable: refundable ?? this.refundable,
    deliveryStatus: deliveryStatus ?? this.deliveryStatus,
  );
  PaymentDetailsRecord copyWithCompanion(PaymentDetailsTableCompanion data) {
    return PaymentDetailsRecord(
      paymentId: data.paymentId.present ? data.paymentId.value : this.paymentId,
      productName: data.productName.present
          ? data.productName.value
          : this.productName,
      productDesc: data.productDesc.present
          ? data.productDesc.value
          : this.productDesc,
      productCat: data.productCat.present
          ? data.productCat.value
          : this.productCat,
      amount: data.amount.present ? data.amount.value : this.amount,
      refundable: data.refundable.present
          ? data.refundable.value
          : this.refundable,
      deliveryStatus: data.deliveryStatus.present
          ? data.deliveryStatus.value
          : this.deliveryStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PaymentDetailsRecord(')
          ..write('paymentId: $paymentId, ')
          ..write('productName: $productName, ')
          ..write('productDesc: $productDesc, ')
          ..write('productCat: $productCat, ')
          ..write('amount: $amount, ')
          ..write('refundable: $refundable, ')
          ..write('deliveryStatus: $deliveryStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    paymentId,
    productName,
    productDesc,
    productCat,
    amount,
    refundable,
    deliveryStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PaymentDetailsRecord &&
          other.paymentId == this.paymentId &&
          other.productName == this.productName &&
          other.productDesc == this.productDesc &&
          other.productCat == this.productCat &&
          other.amount == this.amount &&
          other.refundable == this.refundable &&
          other.deliveryStatus == this.deliveryStatus);
}

class PaymentDetailsTableCompanion
    extends UpdateCompanion<PaymentDetailsRecord> {
  final Value<String> paymentId;
  final Value<String> productName;
  final Value<String> productDesc;
  final Value<String> productCat;
  final Value<int> amount;
  final Value<bool> refundable;
  final Value<String> deliveryStatus;
  final Value<int> rowid;
  const PaymentDetailsTableCompanion({
    this.paymentId = const Value.absent(),
    this.productName = const Value.absent(),
    this.productDesc = const Value.absent(),
    this.productCat = const Value.absent(),
    this.amount = const Value.absent(),
    this.refundable = const Value.absent(),
    this.deliveryStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PaymentDetailsTableCompanion.insert({
    required String paymentId,
    required String productName,
    required String productDesc,
    required String productCat,
    required int amount,
    required bool refundable,
    required String deliveryStatus,
    this.rowid = const Value.absent(),
  }) : paymentId = Value(paymentId),
       productName = Value(productName),
       productDesc = Value(productDesc),
       productCat = Value(productCat),
       amount = Value(amount),
       refundable = Value(refundable),
       deliveryStatus = Value(deliveryStatus);
  static Insertable<PaymentDetailsRecord> custom({
    Expression<String>? paymentId,
    Expression<String>? productName,
    Expression<String>? productDesc,
    Expression<String>? productCat,
    Expression<int>? amount,
    Expression<bool>? refundable,
    Expression<String>? deliveryStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (paymentId != null) 'payment_id': paymentId,
      if (productName != null) 'product_name': productName,
      if (productDesc != null) 'product_desc': productDesc,
      if (productCat != null) 'product_cat': productCat,
      if (amount != null) 'amount': amount,
      if (refundable != null) 'refundable': refundable,
      if (deliveryStatus != null) 'delivery_status': deliveryStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PaymentDetailsTableCompanion copyWith({
    Value<String>? paymentId,
    Value<String>? productName,
    Value<String>? productDesc,
    Value<String>? productCat,
    Value<int>? amount,
    Value<bool>? refundable,
    Value<String>? deliveryStatus,
    Value<int>? rowid,
  }) {
    return PaymentDetailsTableCompanion(
      paymentId: paymentId ?? this.paymentId,
      productName: productName ?? this.productName,
      productDesc: productDesc ?? this.productDesc,
      productCat: productCat ?? this.productCat,
      amount: amount ?? this.amount,
      refundable: refundable ?? this.refundable,
      deliveryStatus: deliveryStatus ?? this.deliveryStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (paymentId.present) {
      map['payment_id'] = Variable<String>(paymentId.value);
    }
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    if (productDesc.present) {
      map['product_desc'] = Variable<String>(productDesc.value);
    }
    if (productCat.present) {
      map['product_cat'] = Variable<String>(productCat.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (refundable.present) {
      map['refundable'] = Variable<bool>(refundable.value);
    }
    if (deliveryStatus.present) {
      map['delivery_status'] = Variable<String>(deliveryStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentDetailsTableCompanion(')
          ..write('paymentId: $paymentId, ')
          ..write('productName: $productName, ')
          ..write('productDesc: $productDesc, ')
          ..write('productCat: $productCat, ')
          ..write('amount: $amount, ')
          ..write('refundable: $refundable, ')
          ..write('deliveryStatus: $deliveryStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TransactionUsersTable extends TransactionUsers
    with TableInfo<$TransactionUsersTable, TransactionUsersRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionUsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _paymentIdMeta = const VerificationMeta(
    'paymentId',
  );
  @override
  late final GeneratedColumn<String> paymentId = GeneratedColumn<String>(
    'payment_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userTypeMeta = const VerificationMeta(
    'userType',
  );
  @override
  late final GeneratedColumn<String> userType = GeneratedColumn<String>(
    'user_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
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
  @override
  List<GeneratedColumn> get $columns => [paymentId, userType, userId, email];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaction_users';
  @override
  VerificationContext validateIntegrity(
    Insertable<TransactionUsersRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('payment_id')) {
      context.handle(
        _paymentIdMeta,
        paymentId.isAcceptableOrUnknown(data['payment_id']!, _paymentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_paymentIdMeta);
    }
    if (data.containsKey('user_type')) {
      context.handle(
        _userTypeMeta,
        userType.isAcceptableOrUnknown(data['user_type']!, _userTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_userTypeMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {paymentId, userType};
  @override
  TransactionUsersRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionUsersRecord(
      paymentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_id'],
      )!,
      userType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_type'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
    );
  }

  @override
  $TransactionUsersTable createAlias(String alias) {
    return $TransactionUsersTable(attachedDatabase, alias);
  }
}

class TransactionUsersRecord extends DataClass
    implements Insertable<TransactionUsersRecord> {
  final String paymentId;
  final String userType;
  final int userId;
  final String email;
  const TransactionUsersRecord({
    required this.paymentId,
    required this.userType,
    required this.userId,
    required this.email,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['payment_id'] = Variable<String>(paymentId);
    map['user_type'] = Variable<String>(userType);
    map['user_id'] = Variable<int>(userId);
    map['email'] = Variable<String>(email);
    return map;
  }

  TransactionUsersCompanion toCompanion(bool nullToAbsent) {
    return TransactionUsersCompanion(
      paymentId: Value(paymentId),
      userType: Value(userType),
      userId: Value(userId),
      email: Value(email),
    );
  }

  factory TransactionUsersRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionUsersRecord(
      paymentId: serializer.fromJson<String>(json['paymentId']),
      userType: serializer.fromJson<String>(json['userType']),
      userId: serializer.fromJson<int>(json['userId']),
      email: serializer.fromJson<String>(json['email']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'paymentId': serializer.toJson<String>(paymentId),
      'userType': serializer.toJson<String>(userType),
      'userId': serializer.toJson<int>(userId),
      'email': serializer.toJson<String>(email),
    };
  }

  TransactionUsersRecord copyWith({
    String? paymentId,
    String? userType,
    int? userId,
    String? email,
  }) => TransactionUsersRecord(
    paymentId: paymentId ?? this.paymentId,
    userType: userType ?? this.userType,
    userId: userId ?? this.userId,
    email: email ?? this.email,
  );
  TransactionUsersRecord copyWithCompanion(TransactionUsersCompanion data) {
    return TransactionUsersRecord(
      paymentId: data.paymentId.present ? data.paymentId.value : this.paymentId,
      userType: data.userType.present ? data.userType.value : this.userType,
      userId: data.userId.present ? data.userId.value : this.userId,
      email: data.email.present ? data.email.value : this.email,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionUsersRecord(')
          ..write('paymentId: $paymentId, ')
          ..write('userType: $userType, ')
          ..write('userId: $userId, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(paymentId, userType, userId, email);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionUsersRecord &&
          other.paymentId == this.paymentId &&
          other.userType == this.userType &&
          other.userId == this.userId &&
          other.email == this.email);
}

class TransactionUsersCompanion
    extends UpdateCompanion<TransactionUsersRecord> {
  final Value<String> paymentId;
  final Value<String> userType;
  final Value<int> userId;
  final Value<String> email;
  final Value<int> rowid;
  const TransactionUsersCompanion({
    this.paymentId = const Value.absent(),
    this.userType = const Value.absent(),
    this.userId = const Value.absent(),
    this.email = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TransactionUsersCompanion.insert({
    required String paymentId,
    required String userType,
    required int userId,
    required String email,
    this.rowid = const Value.absent(),
  }) : paymentId = Value(paymentId),
       userType = Value(userType),
       userId = Value(userId),
       email = Value(email);
  static Insertable<TransactionUsersRecord> custom({
    Expression<String>? paymentId,
    Expression<String>? userType,
    Expression<int>? userId,
    Expression<String>? email,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (paymentId != null) 'payment_id': paymentId,
      if (userType != null) 'user_type': userType,
      if (userId != null) 'user_id': userId,
      if (email != null) 'email': email,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TransactionUsersCompanion copyWith({
    Value<String>? paymentId,
    Value<String>? userType,
    Value<int>? userId,
    Value<String>? email,
    Value<int>? rowid,
  }) {
    return TransactionUsersCompanion(
      paymentId: paymentId ?? this.paymentId,
      userType: userType ?? this.userType,
      userId: userId ?? this.userId,
      email: email ?? this.email,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (paymentId.present) {
      map['payment_id'] = Variable<String>(paymentId.value);
    }
    if (userType.present) {
      map['user_type'] = Variable<String>(userType.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionUsersCompanion(')
          ..write('paymentId: $paymentId, ')
          ..write('userType: $userType, ')
          ..write('userId: $userId, ')
          ..write('email: $email, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TransactionBoardSummaryTable extends TransactionBoardSummary
    with TableInfo<$TransactionBoardSummaryTable, TransactionBoardRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionBoardSummaryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _completeOrderMeta = const VerificationMeta(
    'completeOrder',
  );
  @override
  late final GeneratedColumn<int> completeOrder = GeneratedColumn<int>(
    'complete_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _waitReceiveAmountMeta = const VerificationMeta(
    'waitReceiveAmount',
  );
  @override
  late final GeneratedColumn<int> waitReceiveAmount = GeneratedColumn<int>(
    'wait_receive_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completeReceiveMeta = const VerificationMeta(
    'completeReceive',
  );
  @override
  late final GeneratedColumn<int> completeReceive = GeneratedColumn<int>(
    'complete_receive',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _waitReleaseAmountMeta = const VerificationMeta(
    'waitReleaseAmount',
  );
  @override
  late final GeneratedColumn<int> waitReleaseAmount = GeneratedColumn<int>(
    'wait_release_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completeReleaseMeta = const VerificationMeta(
    'completeRelease',
  );
  @override
  late final GeneratedColumn<int> completeRelease = GeneratedColumn<int>(
    'complete_release',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    completeOrder,
    waitReceiveAmount,
    completeReceive,
    waitReleaseAmount,
    completeRelease,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaction_board_summary';
  @override
  VerificationContext validateIntegrity(
    Insertable<TransactionBoardRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('complete_order')) {
      context.handle(
        _completeOrderMeta,
        completeOrder.isAcceptableOrUnknown(
          data['complete_order']!,
          _completeOrderMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_completeOrderMeta);
    }
    if (data.containsKey('wait_receive_amount')) {
      context.handle(
        _waitReceiveAmountMeta,
        waitReceiveAmount.isAcceptableOrUnknown(
          data['wait_receive_amount']!,
          _waitReceiveAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_waitReceiveAmountMeta);
    }
    if (data.containsKey('complete_receive')) {
      context.handle(
        _completeReceiveMeta,
        completeReceive.isAcceptableOrUnknown(
          data['complete_receive']!,
          _completeReceiveMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_completeReceiveMeta);
    }
    if (data.containsKey('wait_release_amount')) {
      context.handle(
        _waitReleaseAmountMeta,
        waitReleaseAmount.isAcceptableOrUnknown(
          data['wait_release_amount']!,
          _waitReleaseAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_waitReleaseAmountMeta);
    }
    if (data.containsKey('complete_release')) {
      context.handle(
        _completeReleaseMeta,
        completeRelease.isAcceptableOrUnknown(
          data['complete_release']!,
          _completeReleaseMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_completeReleaseMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionBoardRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionBoardRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      completeOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}complete_order'],
      )!,
      waitReceiveAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}wait_receive_amount'],
      )!,
      completeReceive: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}complete_receive'],
      )!,
      waitReleaseAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}wait_release_amount'],
      )!,
      completeRelease: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}complete_release'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $TransactionBoardSummaryTable createAlias(String alias) {
    return $TransactionBoardSummaryTable(attachedDatabase, alias);
  }
}

class TransactionBoardRecord extends DataClass
    implements Insertable<TransactionBoardRecord> {
  final int id;
  final int completeOrder;
  final int waitReceiveAmount;
  final int completeReceive;
  final int waitReleaseAmount;
  final int completeRelease;
  final DateTime updatedAt;
  const TransactionBoardRecord({
    required this.id,
    required this.completeOrder,
    required this.waitReceiveAmount,
    required this.completeReceive,
    required this.waitReleaseAmount,
    required this.completeRelease,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['complete_order'] = Variable<int>(completeOrder);
    map['wait_receive_amount'] = Variable<int>(waitReceiveAmount);
    map['complete_receive'] = Variable<int>(completeReceive);
    map['wait_release_amount'] = Variable<int>(waitReleaseAmount);
    map['complete_release'] = Variable<int>(completeRelease);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  TransactionBoardSummaryCompanion toCompanion(bool nullToAbsent) {
    return TransactionBoardSummaryCompanion(
      id: Value(id),
      completeOrder: Value(completeOrder),
      waitReceiveAmount: Value(waitReceiveAmount),
      completeReceive: Value(completeReceive),
      waitReleaseAmount: Value(waitReleaseAmount),
      completeRelease: Value(completeRelease),
      updatedAt: Value(updatedAt),
    );
  }

  factory TransactionBoardRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionBoardRecord(
      id: serializer.fromJson<int>(json['id']),
      completeOrder: serializer.fromJson<int>(json['completeOrder']),
      waitReceiveAmount: serializer.fromJson<int>(json['waitReceiveAmount']),
      completeReceive: serializer.fromJson<int>(json['completeReceive']),
      waitReleaseAmount: serializer.fromJson<int>(json['waitReleaseAmount']),
      completeRelease: serializer.fromJson<int>(json['completeRelease']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'completeOrder': serializer.toJson<int>(completeOrder),
      'waitReceiveAmount': serializer.toJson<int>(waitReceiveAmount),
      'completeReceive': serializer.toJson<int>(completeReceive),
      'waitReleaseAmount': serializer.toJson<int>(waitReleaseAmount),
      'completeRelease': serializer.toJson<int>(completeRelease),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  TransactionBoardRecord copyWith({
    int? id,
    int? completeOrder,
    int? waitReceiveAmount,
    int? completeReceive,
    int? waitReleaseAmount,
    int? completeRelease,
    DateTime? updatedAt,
  }) => TransactionBoardRecord(
    id: id ?? this.id,
    completeOrder: completeOrder ?? this.completeOrder,
    waitReceiveAmount: waitReceiveAmount ?? this.waitReceiveAmount,
    completeReceive: completeReceive ?? this.completeReceive,
    waitReleaseAmount: waitReleaseAmount ?? this.waitReleaseAmount,
    completeRelease: completeRelease ?? this.completeRelease,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  TransactionBoardRecord copyWithCompanion(
    TransactionBoardSummaryCompanion data,
  ) {
    return TransactionBoardRecord(
      id: data.id.present ? data.id.value : this.id,
      completeOrder: data.completeOrder.present
          ? data.completeOrder.value
          : this.completeOrder,
      waitReceiveAmount: data.waitReceiveAmount.present
          ? data.waitReceiveAmount.value
          : this.waitReceiveAmount,
      completeReceive: data.completeReceive.present
          ? data.completeReceive.value
          : this.completeReceive,
      waitReleaseAmount: data.waitReleaseAmount.present
          ? data.waitReleaseAmount.value
          : this.waitReleaseAmount,
      completeRelease: data.completeRelease.present
          ? data.completeRelease.value
          : this.completeRelease,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionBoardRecord(')
          ..write('id: $id, ')
          ..write('completeOrder: $completeOrder, ')
          ..write('waitReceiveAmount: $waitReceiveAmount, ')
          ..write('completeReceive: $completeReceive, ')
          ..write('waitReleaseAmount: $waitReleaseAmount, ')
          ..write('completeRelease: $completeRelease, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    completeOrder,
    waitReceiveAmount,
    completeReceive,
    waitReleaseAmount,
    completeRelease,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionBoardRecord &&
          other.id == this.id &&
          other.completeOrder == this.completeOrder &&
          other.waitReceiveAmount == this.waitReceiveAmount &&
          other.completeReceive == this.completeReceive &&
          other.waitReleaseAmount == this.waitReleaseAmount &&
          other.completeRelease == this.completeRelease &&
          other.updatedAt == this.updatedAt);
}

class TransactionBoardSummaryCompanion
    extends UpdateCompanion<TransactionBoardRecord> {
  final Value<int> id;
  final Value<int> completeOrder;
  final Value<int> waitReceiveAmount;
  final Value<int> completeReceive;
  final Value<int> waitReleaseAmount;
  final Value<int> completeRelease;
  final Value<DateTime> updatedAt;
  const TransactionBoardSummaryCompanion({
    this.id = const Value.absent(),
    this.completeOrder = const Value.absent(),
    this.waitReceiveAmount = const Value.absent(),
    this.completeReceive = const Value.absent(),
    this.waitReleaseAmount = const Value.absent(),
    this.completeRelease = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  TransactionBoardSummaryCompanion.insert({
    this.id = const Value.absent(),
    required int completeOrder,
    required int waitReceiveAmount,
    required int completeReceive,
    required int waitReleaseAmount,
    required int completeRelease,
    required DateTime updatedAt,
  }) : completeOrder = Value(completeOrder),
       waitReceiveAmount = Value(waitReceiveAmount),
       completeReceive = Value(completeReceive),
       waitReleaseAmount = Value(waitReleaseAmount),
       completeRelease = Value(completeRelease),
       updatedAt = Value(updatedAt);
  static Insertable<TransactionBoardRecord> custom({
    Expression<int>? id,
    Expression<int>? completeOrder,
    Expression<int>? waitReceiveAmount,
    Expression<int>? completeReceive,
    Expression<int>? waitReleaseAmount,
    Expression<int>? completeRelease,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (completeOrder != null) 'complete_order': completeOrder,
      if (waitReceiveAmount != null) 'wait_receive_amount': waitReceiveAmount,
      if (completeReceive != null) 'complete_receive': completeReceive,
      if (waitReleaseAmount != null) 'wait_release_amount': waitReleaseAmount,
      if (completeRelease != null) 'complete_release': completeRelease,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  TransactionBoardSummaryCompanion copyWith({
    Value<int>? id,
    Value<int>? completeOrder,
    Value<int>? waitReceiveAmount,
    Value<int>? completeReceive,
    Value<int>? waitReleaseAmount,
    Value<int>? completeRelease,
    Value<DateTime>? updatedAt,
  }) {
    return TransactionBoardSummaryCompanion(
      id: id ?? this.id,
      completeOrder: completeOrder ?? this.completeOrder,
      waitReceiveAmount: waitReceiveAmount ?? this.waitReceiveAmount,
      completeReceive: completeReceive ?? this.completeReceive,
      waitReleaseAmount: waitReleaseAmount ?? this.waitReleaseAmount,
      completeRelease: completeRelease ?? this.completeRelease,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (completeOrder.present) {
      map['complete_order'] = Variable<int>(completeOrder.value);
    }
    if (waitReceiveAmount.present) {
      map['wait_receive_amount'] = Variable<int>(waitReceiveAmount.value);
    }
    if (completeReceive.present) {
      map['complete_receive'] = Variable<int>(completeReceive.value);
    }
    if (waitReleaseAmount.present) {
      map['wait_release_amount'] = Variable<int>(waitReleaseAmount.value);
    }
    if (completeRelease.present) {
      map['complete_release'] = Variable<int>(completeRelease.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionBoardSummaryCompanion(')
          ..write('id: $id, ')
          ..write('completeOrder: $completeOrder, ')
          ..write('waitReceiveAmount: $waitReceiveAmount, ')
          ..write('completeReceive: $completeReceive, ')
          ..write('waitReleaseAmount: $waitReleaseAmount, ')
          ..write('completeRelease: $completeRelease, ')
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
  late final $TransactionsTable transactions = $TransactionsTable(this);
  late final $PaymentDetailsTableTable paymentDetailsTable =
      $PaymentDetailsTableTable(this);
  late final $TransactionUsersTable transactionUsers = $TransactionUsersTable(
    this,
  );
  late final $TransactionBoardSummaryTable transactionBoardSummary =
      $TransactionBoardSummaryTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    users,
    userDetails,
    userSettingsDetails,
    transactions,
    paymentDetailsTable,
    transactionUsers,
    transactionBoardSummary,
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
      required String verify,
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
      Value<String> verify,
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

  ColumnFilters<String> get verify => $composableBuilder(
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

  ColumnOrderings<String> get verify => $composableBuilder(
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

  GeneratedColumn<String> get verify =>
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
                Value<String> verify = const Value.absent(),
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
                required String verify,
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
typedef $$TransactionsTableCreateCompanionBuilder =
    TransactionsCompanion Function({
      required String paymentId,
      required String paymentType,
      required int sellerId,
      required int buyerId,
      Value<int?> merchantId,
      required int amount,
      required String providerId,
      required bool isCompleted,
      required DateTime createdAt,
      required DateTime updatedAt,
      required String userRole,
      Value<int> rowid,
    });
typedef $$TransactionsTableUpdateCompanionBuilder =
    TransactionsCompanion Function({
      Value<String> paymentId,
      Value<String> paymentType,
      Value<int> sellerId,
      Value<int> buyerId,
      Value<int?> merchantId,
      Value<int> amount,
      Value<String> providerId,
      Value<bool> isCompleted,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> userRole,
      Value<int> rowid,
    });

class $$TransactionsTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get paymentId => $composableBuilder(
    column: $table.paymentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentType => $composableBuilder(
    column: $table.paymentType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sellerId => $composableBuilder(
    column: $table.sellerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get buyerId => $composableBuilder(
    column: $table.buyerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get merchantId => $composableBuilder(
    column: $table.merchantId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get providerId => $composableBuilder(
    column: $table.providerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
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

  ColumnFilters<String> get userRole => $composableBuilder(
    column: $table.userRole,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TransactionsTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get paymentId => $composableBuilder(
    column: $table.paymentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentType => $composableBuilder(
    column: $table.paymentType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sellerId => $composableBuilder(
    column: $table.sellerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get buyerId => $composableBuilder(
    column: $table.buyerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get merchantId => $composableBuilder(
    column: $table.merchantId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get providerId => $composableBuilder(
    column: $table.providerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
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

  ColumnOrderings<String> get userRole => $composableBuilder(
    column: $table.userRole,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TransactionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get paymentId =>
      $composableBuilder(column: $table.paymentId, builder: (column) => column);

  GeneratedColumn<String> get paymentType => $composableBuilder(
    column: $table.paymentType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sellerId =>
      $composableBuilder(column: $table.sellerId, builder: (column) => column);

  GeneratedColumn<int> get buyerId =>
      $composableBuilder(column: $table.buyerId, builder: (column) => column);

  GeneratedColumn<int> get merchantId => $composableBuilder(
    column: $table.merchantId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get providerId => $composableBuilder(
    column: $table.providerId,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get userRole =>
      $composableBuilder(column: $table.userRole, builder: (column) => column);
}

class $$TransactionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TransactionsTable,
          TransactionRecord,
          $$TransactionsTableFilterComposer,
          $$TransactionsTableOrderingComposer,
          $$TransactionsTableAnnotationComposer,
          $$TransactionsTableCreateCompanionBuilder,
          $$TransactionsTableUpdateCompanionBuilder,
          (
            TransactionRecord,
            BaseReferences<
              _$AppDatabase,
              $TransactionsTable,
              TransactionRecord
            >,
          ),
          TransactionRecord,
          PrefetchHooks Function()
        > {
  $$TransactionsTableTableManager(_$AppDatabase db, $TransactionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> paymentId = const Value.absent(),
                Value<String> paymentType = const Value.absent(),
                Value<int> sellerId = const Value.absent(),
                Value<int> buyerId = const Value.absent(),
                Value<int?> merchantId = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<String> providerId = const Value.absent(),
                Value<bool> isCompleted = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> userRole = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TransactionsCompanion(
                paymentId: paymentId,
                paymentType: paymentType,
                sellerId: sellerId,
                buyerId: buyerId,
                merchantId: merchantId,
                amount: amount,
                providerId: providerId,
                isCompleted: isCompleted,
                createdAt: createdAt,
                updatedAt: updatedAt,
                userRole: userRole,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String paymentId,
                required String paymentType,
                required int sellerId,
                required int buyerId,
                Value<int?> merchantId = const Value.absent(),
                required int amount,
                required String providerId,
                required bool isCompleted,
                required DateTime createdAt,
                required DateTime updatedAt,
                required String userRole,
                Value<int> rowid = const Value.absent(),
              }) => TransactionsCompanion.insert(
                paymentId: paymentId,
                paymentType: paymentType,
                sellerId: sellerId,
                buyerId: buyerId,
                merchantId: merchantId,
                amount: amount,
                providerId: providerId,
                isCompleted: isCompleted,
                createdAt: createdAt,
                updatedAt: updatedAt,
                userRole: userRole,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TransactionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TransactionsTable,
      TransactionRecord,
      $$TransactionsTableFilterComposer,
      $$TransactionsTableOrderingComposer,
      $$TransactionsTableAnnotationComposer,
      $$TransactionsTableCreateCompanionBuilder,
      $$TransactionsTableUpdateCompanionBuilder,
      (
        TransactionRecord,
        BaseReferences<_$AppDatabase, $TransactionsTable, TransactionRecord>,
      ),
      TransactionRecord,
      PrefetchHooks Function()
    >;
typedef $$PaymentDetailsTableTableCreateCompanionBuilder =
    PaymentDetailsTableCompanion Function({
      required String paymentId,
      required String productName,
      required String productDesc,
      required String productCat,
      required int amount,
      required bool refundable,
      required String deliveryStatus,
      Value<int> rowid,
    });
typedef $$PaymentDetailsTableTableUpdateCompanionBuilder =
    PaymentDetailsTableCompanion Function({
      Value<String> paymentId,
      Value<String> productName,
      Value<String> productDesc,
      Value<String> productCat,
      Value<int> amount,
      Value<bool> refundable,
      Value<String> deliveryStatus,
      Value<int> rowid,
    });

class $$PaymentDetailsTableTableFilterComposer
    extends Composer<_$AppDatabase, $PaymentDetailsTableTable> {
  $$PaymentDetailsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get paymentId => $composableBuilder(
    column: $table.paymentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productName => $composableBuilder(
    column: $table.productName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productDesc => $composableBuilder(
    column: $table.productDesc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productCat => $composableBuilder(
    column: $table.productCat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get refundable => $composableBuilder(
    column: $table.refundable,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deliveryStatus => $composableBuilder(
    column: $table.deliveryStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PaymentDetailsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PaymentDetailsTableTable> {
  $$PaymentDetailsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get paymentId => $composableBuilder(
    column: $table.paymentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productName => $composableBuilder(
    column: $table.productName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productDesc => $composableBuilder(
    column: $table.productDesc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productCat => $composableBuilder(
    column: $table.productCat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get refundable => $composableBuilder(
    column: $table.refundable,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deliveryStatus => $composableBuilder(
    column: $table.deliveryStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PaymentDetailsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PaymentDetailsTableTable> {
  $$PaymentDetailsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get paymentId =>
      $composableBuilder(column: $table.paymentId, builder: (column) => column);

  GeneratedColumn<String> get productName => $composableBuilder(
    column: $table.productName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get productDesc => $composableBuilder(
    column: $table.productDesc,
    builder: (column) => column,
  );

  GeneratedColumn<String> get productCat => $composableBuilder(
    column: $table.productCat,
    builder: (column) => column,
  );

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<bool> get refundable => $composableBuilder(
    column: $table.refundable,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deliveryStatus => $composableBuilder(
    column: $table.deliveryStatus,
    builder: (column) => column,
  );
}

class $$PaymentDetailsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PaymentDetailsTableTable,
          PaymentDetailsRecord,
          $$PaymentDetailsTableTableFilterComposer,
          $$PaymentDetailsTableTableOrderingComposer,
          $$PaymentDetailsTableTableAnnotationComposer,
          $$PaymentDetailsTableTableCreateCompanionBuilder,
          $$PaymentDetailsTableTableUpdateCompanionBuilder,
          (
            PaymentDetailsRecord,
            BaseReferences<
              _$AppDatabase,
              $PaymentDetailsTableTable,
              PaymentDetailsRecord
            >,
          ),
          PaymentDetailsRecord,
          PrefetchHooks Function()
        > {
  $$PaymentDetailsTableTableTableManager(
    _$AppDatabase db,
    $PaymentDetailsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PaymentDetailsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PaymentDetailsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$PaymentDetailsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> paymentId = const Value.absent(),
                Value<String> productName = const Value.absent(),
                Value<String> productDesc = const Value.absent(),
                Value<String> productCat = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<bool> refundable = const Value.absent(),
                Value<String> deliveryStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PaymentDetailsTableCompanion(
                paymentId: paymentId,
                productName: productName,
                productDesc: productDesc,
                productCat: productCat,
                amount: amount,
                refundable: refundable,
                deliveryStatus: deliveryStatus,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String paymentId,
                required String productName,
                required String productDesc,
                required String productCat,
                required int amount,
                required bool refundable,
                required String deliveryStatus,
                Value<int> rowid = const Value.absent(),
              }) => PaymentDetailsTableCompanion.insert(
                paymentId: paymentId,
                productName: productName,
                productDesc: productDesc,
                productCat: productCat,
                amount: amount,
                refundable: refundable,
                deliveryStatus: deliveryStatus,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PaymentDetailsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PaymentDetailsTableTable,
      PaymentDetailsRecord,
      $$PaymentDetailsTableTableFilterComposer,
      $$PaymentDetailsTableTableOrderingComposer,
      $$PaymentDetailsTableTableAnnotationComposer,
      $$PaymentDetailsTableTableCreateCompanionBuilder,
      $$PaymentDetailsTableTableUpdateCompanionBuilder,
      (
        PaymentDetailsRecord,
        BaseReferences<
          _$AppDatabase,
          $PaymentDetailsTableTable,
          PaymentDetailsRecord
        >,
      ),
      PaymentDetailsRecord,
      PrefetchHooks Function()
    >;
typedef $$TransactionUsersTableCreateCompanionBuilder =
    TransactionUsersCompanion Function({
      required String paymentId,
      required String userType,
      required int userId,
      required String email,
      Value<int> rowid,
    });
typedef $$TransactionUsersTableUpdateCompanionBuilder =
    TransactionUsersCompanion Function({
      Value<String> paymentId,
      Value<String> userType,
      Value<int> userId,
      Value<String> email,
      Value<int> rowid,
    });

class $$TransactionUsersTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionUsersTable> {
  $$TransactionUsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get paymentId => $composableBuilder(
    column: $table.paymentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userType => $composableBuilder(
    column: $table.userType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TransactionUsersTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionUsersTable> {
  $$TransactionUsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get paymentId => $composableBuilder(
    column: $table.paymentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userType => $composableBuilder(
    column: $table.userType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TransactionUsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionUsersTable> {
  $$TransactionUsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get paymentId =>
      $composableBuilder(column: $table.paymentId, builder: (column) => column);

  GeneratedColumn<String> get userType =>
      $composableBuilder(column: $table.userType, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);
}

class $$TransactionUsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TransactionUsersTable,
          TransactionUsersRecord,
          $$TransactionUsersTableFilterComposer,
          $$TransactionUsersTableOrderingComposer,
          $$TransactionUsersTableAnnotationComposer,
          $$TransactionUsersTableCreateCompanionBuilder,
          $$TransactionUsersTableUpdateCompanionBuilder,
          (
            TransactionUsersRecord,
            BaseReferences<
              _$AppDatabase,
              $TransactionUsersTable,
              TransactionUsersRecord
            >,
          ),
          TransactionUsersRecord,
          PrefetchHooks Function()
        > {
  $$TransactionUsersTableTableManager(
    _$AppDatabase db,
    $TransactionUsersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionUsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionUsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionUsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> paymentId = const Value.absent(),
                Value<String> userType = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TransactionUsersCompanion(
                paymentId: paymentId,
                userType: userType,
                userId: userId,
                email: email,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String paymentId,
                required String userType,
                required int userId,
                required String email,
                Value<int> rowid = const Value.absent(),
              }) => TransactionUsersCompanion.insert(
                paymentId: paymentId,
                userType: userType,
                userId: userId,
                email: email,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TransactionUsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TransactionUsersTable,
      TransactionUsersRecord,
      $$TransactionUsersTableFilterComposer,
      $$TransactionUsersTableOrderingComposer,
      $$TransactionUsersTableAnnotationComposer,
      $$TransactionUsersTableCreateCompanionBuilder,
      $$TransactionUsersTableUpdateCompanionBuilder,
      (
        TransactionUsersRecord,
        BaseReferences<
          _$AppDatabase,
          $TransactionUsersTable,
          TransactionUsersRecord
        >,
      ),
      TransactionUsersRecord,
      PrefetchHooks Function()
    >;
typedef $$TransactionBoardSummaryTableCreateCompanionBuilder =
    TransactionBoardSummaryCompanion Function({
      Value<int> id,
      required int completeOrder,
      required int waitReceiveAmount,
      required int completeReceive,
      required int waitReleaseAmount,
      required int completeRelease,
      required DateTime updatedAt,
    });
typedef $$TransactionBoardSummaryTableUpdateCompanionBuilder =
    TransactionBoardSummaryCompanion Function({
      Value<int> id,
      Value<int> completeOrder,
      Value<int> waitReceiveAmount,
      Value<int> completeReceive,
      Value<int> waitReleaseAmount,
      Value<int> completeRelease,
      Value<DateTime> updatedAt,
    });

class $$TransactionBoardSummaryTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionBoardSummaryTable> {
  $$TransactionBoardSummaryTableFilterComposer({
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

  ColumnFilters<int> get completeOrder => $composableBuilder(
    column: $table.completeOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get waitReceiveAmount => $composableBuilder(
    column: $table.waitReceiveAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get completeReceive => $composableBuilder(
    column: $table.completeReceive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get waitReleaseAmount => $composableBuilder(
    column: $table.waitReleaseAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get completeRelease => $composableBuilder(
    column: $table.completeRelease,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TransactionBoardSummaryTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionBoardSummaryTable> {
  $$TransactionBoardSummaryTableOrderingComposer({
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

  ColumnOrderings<int> get completeOrder => $composableBuilder(
    column: $table.completeOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get waitReceiveAmount => $composableBuilder(
    column: $table.waitReceiveAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get completeReceive => $composableBuilder(
    column: $table.completeReceive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get waitReleaseAmount => $composableBuilder(
    column: $table.waitReleaseAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get completeRelease => $composableBuilder(
    column: $table.completeRelease,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TransactionBoardSummaryTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionBoardSummaryTable> {
  $$TransactionBoardSummaryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get completeOrder => $composableBuilder(
    column: $table.completeOrder,
    builder: (column) => column,
  );

  GeneratedColumn<int> get waitReceiveAmount => $composableBuilder(
    column: $table.waitReceiveAmount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get completeReceive => $composableBuilder(
    column: $table.completeReceive,
    builder: (column) => column,
  );

  GeneratedColumn<int> get waitReleaseAmount => $composableBuilder(
    column: $table.waitReleaseAmount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get completeRelease => $composableBuilder(
    column: $table.completeRelease,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$TransactionBoardSummaryTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TransactionBoardSummaryTable,
          TransactionBoardRecord,
          $$TransactionBoardSummaryTableFilterComposer,
          $$TransactionBoardSummaryTableOrderingComposer,
          $$TransactionBoardSummaryTableAnnotationComposer,
          $$TransactionBoardSummaryTableCreateCompanionBuilder,
          $$TransactionBoardSummaryTableUpdateCompanionBuilder,
          (
            TransactionBoardRecord,
            BaseReferences<
              _$AppDatabase,
              $TransactionBoardSummaryTable,
              TransactionBoardRecord
            >,
          ),
          TransactionBoardRecord,
          PrefetchHooks Function()
        > {
  $$TransactionBoardSummaryTableTableManager(
    _$AppDatabase db,
    $TransactionBoardSummaryTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionBoardSummaryTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$TransactionBoardSummaryTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$TransactionBoardSummaryTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> completeOrder = const Value.absent(),
                Value<int> waitReceiveAmount = const Value.absent(),
                Value<int> completeReceive = const Value.absent(),
                Value<int> waitReleaseAmount = const Value.absent(),
                Value<int> completeRelease = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => TransactionBoardSummaryCompanion(
                id: id,
                completeOrder: completeOrder,
                waitReceiveAmount: waitReceiveAmount,
                completeReceive: completeReceive,
                waitReleaseAmount: waitReleaseAmount,
                completeRelease: completeRelease,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int completeOrder,
                required int waitReceiveAmount,
                required int completeReceive,
                required int waitReleaseAmount,
                required int completeRelease,
                required DateTime updatedAt,
              }) => TransactionBoardSummaryCompanion.insert(
                id: id,
                completeOrder: completeOrder,
                waitReceiveAmount: waitReceiveAmount,
                completeReceive: completeReceive,
                waitReleaseAmount: waitReleaseAmount,
                completeRelease: completeRelease,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TransactionBoardSummaryTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TransactionBoardSummaryTable,
      TransactionBoardRecord,
      $$TransactionBoardSummaryTableFilterComposer,
      $$TransactionBoardSummaryTableOrderingComposer,
      $$TransactionBoardSummaryTableAnnotationComposer,
      $$TransactionBoardSummaryTableCreateCompanionBuilder,
      $$TransactionBoardSummaryTableUpdateCompanionBuilder,
      (
        TransactionBoardRecord,
        BaseReferences<
          _$AppDatabase,
          $TransactionBoardSummaryTable,
          TransactionBoardRecord
        >,
      ),
      TransactionBoardRecord,
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
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db, _db.transactions);
  $$PaymentDetailsTableTableTableManager get paymentDetailsTable =>
      $$PaymentDetailsTableTableTableManager(_db, _db.paymentDetailsTable);
  $$TransactionUsersTableTableManager get transactionUsers =>
      $$TransactionUsersTableTableManager(_db, _db.transactionUsers);
  $$TransactionBoardSummaryTableTableManager get transactionBoardSummary =>
      $$TransactionBoardSummaryTableTableManager(
        _db,
        _db.transactionBoardSummary,
      );
}
