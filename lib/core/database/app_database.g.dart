// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $AdminsTable extends Admins with TableInfo<$AdminsTable, AdminRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AdminsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
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
  static const VerificationMeta _syncActionMeta = const VerificationMeta(
    'syncAction',
  );
  @override
  late final GeneratedColumn<String> syncAction = GeneratedColumn<String>(
    'sync_action',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncRetryCountMeta = const VerificationMeta(
    'syncRetryCount',
  );
  @override
  late final GeneratedColumn<int> syncRetryCount = GeneratedColumn<int>(
    'sync_retry_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _syncErrorMeta = const VerificationMeta(
    'syncError',
  );
  @override
  late final GeneratedColumn<String> syncError = GeneratedColumn<String>(
    'sync_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastSyncAttemptMeta = const VerificationMeta(
    'lastSyncAttempt',
  );
  @override
  late final GeneratedColumn<DateTime> lastSyncAttempt =
      GeneratedColumn<DateTime>(
        'last_sync_attempt',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
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
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
    'uid',
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
  static const VerificationMeta _firstNameMeta = const VerificationMeta(
    'firstName',
  );
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
    'first_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastNameMeta = const VerificationMeta(
    'lastName',
  );
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
    'last_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
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
    requiredDuringInsert: true,
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
  @override
  List<GeneratedColumn> get $columns => [
    isSynced,
    deletedAt,
    syncAction,
    syncRetryCount,
    syncError,
    lastSyncAttempt,
    id,
    uid,
    phone,
    firstName,
    lastName,
    email,
    updatedAt,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'admins';
  @override
  VerificationContext validateIntegrity(
    Insertable<AdminRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_action')) {
      context.handle(
        _syncActionMeta,
        syncAction.isAcceptableOrUnknown(data['sync_action']!, _syncActionMeta),
      );
    }
    if (data.containsKey('sync_retry_count')) {
      context.handle(
        _syncRetryCountMeta,
        syncRetryCount.isAcceptableOrUnknown(
          data['sync_retry_count']!,
          _syncRetryCountMeta,
        ),
      );
    }
    if (data.containsKey('sync_error')) {
      context.handle(
        _syncErrorMeta,
        syncError.isAcceptableOrUnknown(data['sync_error']!, _syncErrorMeta),
      );
    }
    if (data.containsKey('last_sync_attempt')) {
      context.handle(
        _lastSyncAttemptMeta,
        lastSyncAttempt.isAcceptableOrUnknown(
          data['last_sync_attempt']!,
          _lastSyncAttemptMeta,
        ),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    } else if (isInserting) {
      context.missing(_uidMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(
        _firstNameMeta,
        firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta),
      );
    }
    if (data.containsKey('last_name')) {
      context.handle(
        _lastNameMeta,
        lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {uid},
    {phone},
  ];
  @override
  AdminRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AdminRecord(
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncAction: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_action'],
      ),
      syncRetryCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sync_retry_count'],
      )!,
      syncError: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_error'],
      ),
      lastSyncAttempt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_sync_attempt'],
      ),
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uid'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      )!,
      firstName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}first_name'],
      ),
      lastName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_name'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AdminsTable createAlias(String alias) {
    return $AdminsTable(attachedDatabase, alias);
  }
}

class AdminRecord extends DataClass implements Insertable<AdminRecord> {
  final bool isSynced;
  final DateTime? deletedAt;
  final String? syncAction;
  final int syncRetryCount;
  final String? syncError;
  final DateTime? lastSyncAttempt;
  final int id;
  final String uid;
  final String phone;
  final String? firstName;
  final String? lastName;
  final String? email;
  final DateTime updatedAt;
  final DateTime createdAt;
  const AdminRecord({
    required this.isSynced,
    this.deletedAt,
    this.syncAction,
    required this.syncRetryCount,
    this.syncError,
    this.lastSyncAttempt,
    required this.id,
    required this.uid,
    required this.phone,
    this.firstName,
    this.lastName,
    this.email,
    required this.updatedAt,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['is_synced'] = Variable<bool>(isSynced);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    if (!nullToAbsent || syncAction != null) {
      map['sync_action'] = Variable<String>(syncAction);
    }
    map['sync_retry_count'] = Variable<int>(syncRetryCount);
    if (!nullToAbsent || syncError != null) {
      map['sync_error'] = Variable<String>(syncError);
    }
    if (!nullToAbsent || lastSyncAttempt != null) {
      map['last_sync_attempt'] = Variable<DateTime>(lastSyncAttempt);
    }
    map['id'] = Variable<int>(id);
    map['uid'] = Variable<String>(uid);
    map['phone'] = Variable<String>(phone);
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String>(firstName);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String>(lastName);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AdminsCompanion toCompanion(bool nullToAbsent) {
    return AdminsCompanion(
      isSynced: Value(isSynced),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncAction: syncAction == null && nullToAbsent
          ? const Value.absent()
          : Value(syncAction),
      syncRetryCount: Value(syncRetryCount),
      syncError: syncError == null && nullToAbsent
          ? const Value.absent()
          : Value(syncError),
      lastSyncAttempt: lastSyncAttempt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncAttempt),
      id: Value(id),
      uid: Value(uid),
      phone: Value(phone),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      updatedAt: Value(updatedAt),
      createdAt: Value(createdAt),
    );
  }

  factory AdminRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AdminRecord(
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncAction: serializer.fromJson<String?>(json['syncAction']),
      syncRetryCount: serializer.fromJson<int>(json['syncRetryCount']),
      syncError: serializer.fromJson<String?>(json['syncError']),
      lastSyncAttempt: serializer.fromJson<DateTime?>(json['lastSyncAttempt']),
      id: serializer.fromJson<int>(json['id']),
      uid: serializer.fromJson<String>(json['uid']),
      phone: serializer.fromJson<String>(json['phone']),
      firstName: serializer.fromJson<String?>(json['firstName']),
      lastName: serializer.fromJson<String?>(json['lastName']),
      email: serializer.fromJson<String?>(json['email']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'isSynced': serializer.toJson<bool>(isSynced),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncAction': serializer.toJson<String?>(syncAction),
      'syncRetryCount': serializer.toJson<int>(syncRetryCount),
      'syncError': serializer.toJson<String?>(syncError),
      'lastSyncAttempt': serializer.toJson<DateTime?>(lastSyncAttempt),
      'id': serializer.toJson<int>(id),
      'uid': serializer.toJson<String>(uid),
      'phone': serializer.toJson<String>(phone),
      'firstName': serializer.toJson<String?>(firstName),
      'lastName': serializer.toJson<String?>(lastName),
      'email': serializer.toJson<String?>(email),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AdminRecord copyWith({
    bool? isSynced,
    Value<DateTime?> deletedAt = const Value.absent(),
    Value<String?> syncAction = const Value.absent(),
    int? syncRetryCount,
    Value<String?> syncError = const Value.absent(),
    Value<DateTime?> lastSyncAttempt = const Value.absent(),
    int? id,
    String? uid,
    String? phone,
    Value<String?> firstName = const Value.absent(),
    Value<String?> lastName = const Value.absent(),
    Value<String?> email = const Value.absent(),
    DateTime? updatedAt,
    DateTime? createdAt,
  }) => AdminRecord(
    isSynced: isSynced ?? this.isSynced,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncAction: syncAction.present ? syncAction.value : this.syncAction,
    syncRetryCount: syncRetryCount ?? this.syncRetryCount,
    syncError: syncError.present ? syncError.value : this.syncError,
    lastSyncAttempt: lastSyncAttempt.present
        ? lastSyncAttempt.value
        : this.lastSyncAttempt,
    id: id ?? this.id,
    uid: uid ?? this.uid,
    phone: phone ?? this.phone,
    firstName: firstName.present ? firstName.value : this.firstName,
    lastName: lastName.present ? lastName.value : this.lastName,
    email: email.present ? email.value : this.email,
    updatedAt: updatedAt ?? this.updatedAt,
    createdAt: createdAt ?? this.createdAt,
  );
  AdminRecord copyWithCompanion(AdminsCompanion data) {
    return AdminRecord(
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncAction: data.syncAction.present
          ? data.syncAction.value
          : this.syncAction,
      syncRetryCount: data.syncRetryCount.present
          ? data.syncRetryCount.value
          : this.syncRetryCount,
      syncError: data.syncError.present ? data.syncError.value : this.syncError,
      lastSyncAttempt: data.lastSyncAttempt.present
          ? data.lastSyncAttempt.value
          : this.lastSyncAttempt,
      id: data.id.present ? data.id.value : this.id,
      uid: data.uid.present ? data.uid.value : this.uid,
      phone: data.phone.present ? data.phone.value : this.phone,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      email: data.email.present ? data.email.value : this.email,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AdminRecord(')
          ..write('isSynced: $isSynced, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncAction: $syncAction, ')
          ..write('syncRetryCount: $syncRetryCount, ')
          ..write('syncError: $syncError, ')
          ..write('lastSyncAttempt: $lastSyncAttempt, ')
          ..write('id: $id, ')
          ..write('uid: $uid, ')
          ..write('phone: $phone, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('email: $email, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    isSynced,
    deletedAt,
    syncAction,
    syncRetryCount,
    syncError,
    lastSyncAttempt,
    id,
    uid,
    phone,
    firstName,
    lastName,
    email,
    updatedAt,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AdminRecord &&
          other.isSynced == this.isSynced &&
          other.deletedAt == this.deletedAt &&
          other.syncAction == this.syncAction &&
          other.syncRetryCount == this.syncRetryCount &&
          other.syncError == this.syncError &&
          other.lastSyncAttempt == this.lastSyncAttempt &&
          other.id == this.id &&
          other.uid == this.uid &&
          other.phone == this.phone &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.email == this.email &&
          other.updatedAt == this.updatedAt &&
          other.createdAt == this.createdAt);
}

class AdminsCompanion extends UpdateCompanion<AdminRecord> {
  final Value<bool> isSynced;
  final Value<DateTime?> deletedAt;
  final Value<String?> syncAction;
  final Value<int> syncRetryCount;
  final Value<String?> syncError;
  final Value<DateTime?> lastSyncAttempt;
  final Value<int> id;
  final Value<String> uid;
  final Value<String> phone;
  final Value<String?> firstName;
  final Value<String?> lastName;
  final Value<String?> email;
  final Value<DateTime> updatedAt;
  final Value<DateTime> createdAt;
  const AdminsCompanion({
    this.isSynced = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncAction = const Value.absent(),
    this.syncRetryCount = const Value.absent(),
    this.syncError = const Value.absent(),
    this.lastSyncAttempt = const Value.absent(),
    this.id = const Value.absent(),
    this.uid = const Value.absent(),
    this.phone = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.email = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  AdminsCompanion.insert({
    this.isSynced = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncAction = const Value.absent(),
    this.syncRetryCount = const Value.absent(),
    this.syncError = const Value.absent(),
    this.lastSyncAttempt = const Value.absent(),
    this.id = const Value.absent(),
    required String uid,
    required String phone,
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.email = const Value.absent(),
    required DateTime updatedAt,
    required DateTime createdAt,
  }) : uid = Value(uid),
       phone = Value(phone),
       updatedAt = Value(updatedAt),
       createdAt = Value(createdAt);
  static Insertable<AdminRecord> custom({
    Expression<bool>? isSynced,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncAction,
    Expression<int>? syncRetryCount,
    Expression<String>? syncError,
    Expression<DateTime>? lastSyncAttempt,
    Expression<int>? id,
    Expression<String>? uid,
    Expression<String>? phone,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? email,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (isSynced != null) 'is_synced': isSynced,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncAction != null) 'sync_action': syncAction,
      if (syncRetryCount != null) 'sync_retry_count': syncRetryCount,
      if (syncError != null) 'sync_error': syncError,
      if (lastSyncAttempt != null) 'last_sync_attempt': lastSyncAttempt,
      if (id != null) 'id': id,
      if (uid != null) 'uid': uid,
      if (phone != null) 'phone': phone,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (email != null) 'email': email,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  AdminsCompanion copyWith({
    Value<bool>? isSynced,
    Value<DateTime?>? deletedAt,
    Value<String?>? syncAction,
    Value<int>? syncRetryCount,
    Value<String?>? syncError,
    Value<DateTime?>? lastSyncAttempt,
    Value<int>? id,
    Value<String>? uid,
    Value<String>? phone,
    Value<String?>? firstName,
    Value<String?>? lastName,
    Value<String?>? email,
    Value<DateTime>? updatedAt,
    Value<DateTime>? createdAt,
  }) {
    return AdminsCompanion(
      isSynced: isSynced ?? this.isSynced,
      deletedAt: deletedAt ?? this.deletedAt,
      syncAction: syncAction ?? this.syncAction,
      syncRetryCount: syncRetryCount ?? this.syncRetryCount,
      syncError: syncError ?? this.syncError,
      lastSyncAttempt: lastSyncAttempt ?? this.lastSyncAttempt,
      id: id ?? this.id,
      uid: uid ?? this.uid,
      phone: phone ?? this.phone,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncAction.present) {
      map['sync_action'] = Variable<String>(syncAction.value);
    }
    if (syncRetryCount.present) {
      map['sync_retry_count'] = Variable<int>(syncRetryCount.value);
    }
    if (syncError.present) {
      map['sync_error'] = Variable<String>(syncError.value);
    }
    if (lastSyncAttempt.present) {
      map['last_sync_attempt'] = Variable<DateTime>(lastSyncAttempt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AdminsCompanion(')
          ..write('isSynced: $isSynced, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncAction: $syncAction, ')
          ..write('syncRetryCount: $syncRetryCount, ')
          ..write('syncError: $syncError, ')
          ..write('lastSyncAttempt: $lastSyncAttempt, ')
          ..write('id: $id, ')
          ..write('uid: $uid, ')
          ..write('phone: $phone, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('email: $email, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $DevicesTable extends Devices
    with TableInfo<$DevicesTable, DeviceEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DevicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
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
  static const VerificationMeta _syncActionMeta = const VerificationMeta(
    'syncAction',
  );
  @override
  late final GeneratedColumn<String> syncAction = GeneratedColumn<String>(
    'sync_action',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncRetryCountMeta = const VerificationMeta(
    'syncRetryCount',
  );
  @override
  late final GeneratedColumn<int> syncRetryCount = GeneratedColumn<int>(
    'sync_retry_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _syncErrorMeta = const VerificationMeta(
    'syncError',
  );
  @override
  late final GeneratedColumn<String> syncError = GeneratedColumn<String>(
    'sync_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastSyncAttemptMeta = const VerificationMeta(
    'lastSyncAttempt',
  );
  @override
  late final GeneratedColumn<DateTime> lastSyncAttempt =
      GeneratedColumn<DateTime>(
        'last_sync_attempt',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
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
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
    'uid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deviceCodeMeta = const VerificationMeta(
    'deviceCode',
  );
  @override
  late final GeneratedColumn<String> deviceCode = GeneratedColumn<String>(
    'device_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastActiveAtMeta = const VerificationMeta(
    'lastActiveAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastActiveAt = GeneratedColumn<DateTime>(
    'last_active_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
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
    requiredDuringInsert: true,
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
  @override
  List<GeneratedColumn> get $columns => [
    isSynced,
    deletedAt,
    syncAction,
    syncRetryCount,
    syncError,
    lastSyncAttempt,
    id,
    uid,
    deviceId,
    deviceCode,
    type,
    name,
    lastActiveAt,
    updatedAt,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'devices';
  @override
  VerificationContext validateIntegrity(
    Insertable<DeviceEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_action')) {
      context.handle(
        _syncActionMeta,
        syncAction.isAcceptableOrUnknown(data['sync_action']!, _syncActionMeta),
      );
    }
    if (data.containsKey('sync_retry_count')) {
      context.handle(
        _syncRetryCountMeta,
        syncRetryCount.isAcceptableOrUnknown(
          data['sync_retry_count']!,
          _syncRetryCountMeta,
        ),
      );
    }
    if (data.containsKey('sync_error')) {
      context.handle(
        _syncErrorMeta,
        syncError.isAcceptableOrUnknown(data['sync_error']!, _syncErrorMeta),
      );
    }
    if (data.containsKey('last_sync_attempt')) {
      context.handle(
        _lastSyncAttemptMeta,
        lastSyncAttempt.isAcceptableOrUnknown(
          data['last_sync_attempt']!,
          _lastSyncAttemptMeta,
        ),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    } else if (isInserting) {
      context.missing(_uidMeta);
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_deviceIdMeta);
    }
    if (data.containsKey('device_code')) {
      context.handle(
        _deviceCodeMeta,
        deviceCode.isAcceptableOrUnknown(data['device_code']!, _deviceCodeMeta),
      );
    } else if (isInserting) {
      context.missing(_deviceCodeMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('last_active_at')) {
      context.handle(
        _lastActiveAtMeta,
        lastActiveAt.isAcceptableOrUnknown(
          data['last_active_at']!,
          _lastActiveAtMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {uid},
    {deviceId},
    {deviceCode},
  ];
  @override
  DeviceEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DeviceEntity(
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncAction: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_action'],
      ),
      syncRetryCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sync_retry_count'],
      )!,
      syncError: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_error'],
      ),
      lastSyncAttempt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_sync_attempt'],
      ),
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uid'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      )!,
      deviceCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_code'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      lastActiveAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_active_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $DevicesTable createAlias(String alias) {
    return $DevicesTable(attachedDatabase, alias);
  }
}

class DeviceEntity extends DataClass implements Insertable<DeviceEntity> {
  final bool isSynced;
  final DateTime? deletedAt;
  final String? syncAction;
  final int syncRetryCount;
  final String? syncError;
  final DateTime? lastSyncAttempt;
  final int id;
  final String uid;
  final String deviceId;
  final String deviceCode;
  final String type;
  final String? name;
  final DateTime? lastActiveAt;
  final DateTime updatedAt;
  final DateTime createdAt;
  const DeviceEntity({
    required this.isSynced,
    this.deletedAt,
    this.syncAction,
    required this.syncRetryCount,
    this.syncError,
    this.lastSyncAttempt,
    required this.id,
    required this.uid,
    required this.deviceId,
    required this.deviceCode,
    required this.type,
    this.name,
    this.lastActiveAt,
    required this.updatedAt,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['is_synced'] = Variable<bool>(isSynced);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    if (!nullToAbsent || syncAction != null) {
      map['sync_action'] = Variable<String>(syncAction);
    }
    map['sync_retry_count'] = Variable<int>(syncRetryCount);
    if (!nullToAbsent || syncError != null) {
      map['sync_error'] = Variable<String>(syncError);
    }
    if (!nullToAbsent || lastSyncAttempt != null) {
      map['last_sync_attempt'] = Variable<DateTime>(lastSyncAttempt);
    }
    map['id'] = Variable<int>(id);
    map['uid'] = Variable<String>(uid);
    map['device_id'] = Variable<String>(deviceId);
    map['device_code'] = Variable<String>(deviceCode);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || lastActiveAt != null) {
      map['last_active_at'] = Variable<DateTime>(lastActiveAt);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DevicesCompanion toCompanion(bool nullToAbsent) {
    return DevicesCompanion(
      isSynced: Value(isSynced),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncAction: syncAction == null && nullToAbsent
          ? const Value.absent()
          : Value(syncAction),
      syncRetryCount: Value(syncRetryCount),
      syncError: syncError == null && nullToAbsent
          ? const Value.absent()
          : Value(syncError),
      lastSyncAttempt: lastSyncAttempt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncAttempt),
      id: Value(id),
      uid: Value(uid),
      deviceId: Value(deviceId),
      deviceCode: Value(deviceCode),
      type: Value(type),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      lastActiveAt: lastActiveAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastActiveAt),
      updatedAt: Value(updatedAt),
      createdAt: Value(createdAt),
    );
  }

  factory DeviceEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DeviceEntity(
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncAction: serializer.fromJson<String?>(json['syncAction']),
      syncRetryCount: serializer.fromJson<int>(json['syncRetryCount']),
      syncError: serializer.fromJson<String?>(json['syncError']),
      lastSyncAttempt: serializer.fromJson<DateTime?>(json['lastSyncAttempt']),
      id: serializer.fromJson<int>(json['id']),
      uid: serializer.fromJson<String>(json['uid']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
      deviceCode: serializer.fromJson<String>(json['deviceCode']),
      type: serializer.fromJson<String>(json['type']),
      name: serializer.fromJson<String?>(json['name']),
      lastActiveAt: serializer.fromJson<DateTime?>(json['lastActiveAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'isSynced': serializer.toJson<bool>(isSynced),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncAction': serializer.toJson<String?>(syncAction),
      'syncRetryCount': serializer.toJson<int>(syncRetryCount),
      'syncError': serializer.toJson<String?>(syncError),
      'lastSyncAttempt': serializer.toJson<DateTime?>(lastSyncAttempt),
      'id': serializer.toJson<int>(id),
      'uid': serializer.toJson<String>(uid),
      'deviceId': serializer.toJson<String>(deviceId),
      'deviceCode': serializer.toJson<String>(deviceCode),
      'type': serializer.toJson<String>(type),
      'name': serializer.toJson<String?>(name),
      'lastActiveAt': serializer.toJson<DateTime?>(lastActiveAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  DeviceEntity copyWith({
    bool? isSynced,
    Value<DateTime?> deletedAt = const Value.absent(),
    Value<String?> syncAction = const Value.absent(),
    int? syncRetryCount,
    Value<String?> syncError = const Value.absent(),
    Value<DateTime?> lastSyncAttempt = const Value.absent(),
    int? id,
    String? uid,
    String? deviceId,
    String? deviceCode,
    String? type,
    Value<String?> name = const Value.absent(),
    Value<DateTime?> lastActiveAt = const Value.absent(),
    DateTime? updatedAt,
    DateTime? createdAt,
  }) => DeviceEntity(
    isSynced: isSynced ?? this.isSynced,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncAction: syncAction.present ? syncAction.value : this.syncAction,
    syncRetryCount: syncRetryCount ?? this.syncRetryCount,
    syncError: syncError.present ? syncError.value : this.syncError,
    lastSyncAttempt: lastSyncAttempt.present
        ? lastSyncAttempt.value
        : this.lastSyncAttempt,
    id: id ?? this.id,
    uid: uid ?? this.uid,
    deviceId: deviceId ?? this.deviceId,
    deviceCode: deviceCode ?? this.deviceCode,
    type: type ?? this.type,
    name: name.present ? name.value : this.name,
    lastActiveAt: lastActiveAt.present ? lastActiveAt.value : this.lastActiveAt,
    updatedAt: updatedAt ?? this.updatedAt,
    createdAt: createdAt ?? this.createdAt,
  );
  DeviceEntity copyWithCompanion(DevicesCompanion data) {
    return DeviceEntity(
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncAction: data.syncAction.present
          ? data.syncAction.value
          : this.syncAction,
      syncRetryCount: data.syncRetryCount.present
          ? data.syncRetryCount.value
          : this.syncRetryCount,
      syncError: data.syncError.present ? data.syncError.value : this.syncError,
      lastSyncAttempt: data.lastSyncAttempt.present
          ? data.lastSyncAttempt.value
          : this.lastSyncAttempt,
      id: data.id.present ? data.id.value : this.id,
      uid: data.uid.present ? data.uid.value : this.uid,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      deviceCode: data.deviceCode.present
          ? data.deviceCode.value
          : this.deviceCode,
      type: data.type.present ? data.type.value : this.type,
      name: data.name.present ? data.name.value : this.name,
      lastActiveAt: data.lastActiveAt.present
          ? data.lastActiveAt.value
          : this.lastActiveAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DeviceEntity(')
          ..write('isSynced: $isSynced, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncAction: $syncAction, ')
          ..write('syncRetryCount: $syncRetryCount, ')
          ..write('syncError: $syncError, ')
          ..write('lastSyncAttempt: $lastSyncAttempt, ')
          ..write('id: $id, ')
          ..write('uid: $uid, ')
          ..write('deviceId: $deviceId, ')
          ..write('deviceCode: $deviceCode, ')
          ..write('type: $type, ')
          ..write('name: $name, ')
          ..write('lastActiveAt: $lastActiveAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    isSynced,
    deletedAt,
    syncAction,
    syncRetryCount,
    syncError,
    lastSyncAttempt,
    id,
    uid,
    deviceId,
    deviceCode,
    type,
    name,
    lastActiveAt,
    updatedAt,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeviceEntity &&
          other.isSynced == this.isSynced &&
          other.deletedAt == this.deletedAt &&
          other.syncAction == this.syncAction &&
          other.syncRetryCount == this.syncRetryCount &&
          other.syncError == this.syncError &&
          other.lastSyncAttempt == this.lastSyncAttempt &&
          other.id == this.id &&
          other.uid == this.uid &&
          other.deviceId == this.deviceId &&
          other.deviceCode == this.deviceCode &&
          other.type == this.type &&
          other.name == this.name &&
          other.lastActiveAt == this.lastActiveAt &&
          other.updatedAt == this.updatedAt &&
          other.createdAt == this.createdAt);
}

class DevicesCompanion extends UpdateCompanion<DeviceEntity> {
  final Value<bool> isSynced;
  final Value<DateTime?> deletedAt;
  final Value<String?> syncAction;
  final Value<int> syncRetryCount;
  final Value<String?> syncError;
  final Value<DateTime?> lastSyncAttempt;
  final Value<int> id;
  final Value<String> uid;
  final Value<String> deviceId;
  final Value<String> deviceCode;
  final Value<String> type;
  final Value<String?> name;
  final Value<DateTime?> lastActiveAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime> createdAt;
  const DevicesCompanion({
    this.isSynced = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncAction = const Value.absent(),
    this.syncRetryCount = const Value.absent(),
    this.syncError = const Value.absent(),
    this.lastSyncAttempt = const Value.absent(),
    this.id = const Value.absent(),
    this.uid = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.deviceCode = const Value.absent(),
    this.type = const Value.absent(),
    this.name = const Value.absent(),
    this.lastActiveAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DevicesCompanion.insert({
    this.isSynced = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncAction = const Value.absent(),
    this.syncRetryCount = const Value.absent(),
    this.syncError = const Value.absent(),
    this.lastSyncAttempt = const Value.absent(),
    this.id = const Value.absent(),
    required String uid,
    required String deviceId,
    required String deviceCode,
    required String type,
    this.name = const Value.absent(),
    this.lastActiveAt = const Value.absent(),
    required DateTime updatedAt,
    required DateTime createdAt,
  }) : uid = Value(uid),
       deviceId = Value(deviceId),
       deviceCode = Value(deviceCode),
       type = Value(type),
       updatedAt = Value(updatedAt),
       createdAt = Value(createdAt);
  static Insertable<DeviceEntity> custom({
    Expression<bool>? isSynced,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncAction,
    Expression<int>? syncRetryCount,
    Expression<String>? syncError,
    Expression<DateTime>? lastSyncAttempt,
    Expression<int>? id,
    Expression<String>? uid,
    Expression<String>? deviceId,
    Expression<String>? deviceCode,
    Expression<String>? type,
    Expression<String>? name,
    Expression<DateTime>? lastActiveAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (isSynced != null) 'is_synced': isSynced,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncAction != null) 'sync_action': syncAction,
      if (syncRetryCount != null) 'sync_retry_count': syncRetryCount,
      if (syncError != null) 'sync_error': syncError,
      if (lastSyncAttempt != null) 'last_sync_attempt': lastSyncAttempt,
      if (id != null) 'id': id,
      if (uid != null) 'uid': uid,
      if (deviceId != null) 'device_id': deviceId,
      if (deviceCode != null) 'device_code': deviceCode,
      if (type != null) 'type': type,
      if (name != null) 'name': name,
      if (lastActiveAt != null) 'last_active_at': lastActiveAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  DevicesCompanion copyWith({
    Value<bool>? isSynced,
    Value<DateTime?>? deletedAt,
    Value<String?>? syncAction,
    Value<int>? syncRetryCount,
    Value<String?>? syncError,
    Value<DateTime?>? lastSyncAttempt,
    Value<int>? id,
    Value<String>? uid,
    Value<String>? deviceId,
    Value<String>? deviceCode,
    Value<String>? type,
    Value<String?>? name,
    Value<DateTime?>? lastActiveAt,
    Value<DateTime>? updatedAt,
    Value<DateTime>? createdAt,
  }) {
    return DevicesCompanion(
      isSynced: isSynced ?? this.isSynced,
      deletedAt: deletedAt ?? this.deletedAt,
      syncAction: syncAction ?? this.syncAction,
      syncRetryCount: syncRetryCount ?? this.syncRetryCount,
      syncError: syncError ?? this.syncError,
      lastSyncAttempt: lastSyncAttempt ?? this.lastSyncAttempt,
      id: id ?? this.id,
      uid: uid ?? this.uid,
      deviceId: deviceId ?? this.deviceId,
      deviceCode: deviceCode ?? this.deviceCode,
      type: type ?? this.type,
      name: name ?? this.name,
      lastActiveAt: lastActiveAt ?? this.lastActiveAt,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncAction.present) {
      map['sync_action'] = Variable<String>(syncAction.value);
    }
    if (syncRetryCount.present) {
      map['sync_retry_count'] = Variable<int>(syncRetryCount.value);
    }
    if (syncError.present) {
      map['sync_error'] = Variable<String>(syncError.value);
    }
    if (lastSyncAttempt.present) {
      map['last_sync_attempt'] = Variable<DateTime>(lastSyncAttempt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (deviceCode.present) {
      map['device_code'] = Variable<String>(deviceCode.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (lastActiveAt.present) {
      map['last_active_at'] = Variable<DateTime>(lastActiveAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DevicesCompanion(')
          ..write('isSynced: $isSynced, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncAction: $syncAction, ')
          ..write('syncRetryCount: $syncRetryCount, ')
          ..write('syncError: $syncError, ')
          ..write('lastSyncAttempt: $lastSyncAttempt, ')
          ..write('id: $id, ')
          ..write('uid: $uid, ')
          ..write('deviceId: $deviceId, ')
          ..write('deviceCode: $deviceCode, ')
          ..write('type: $type, ')
          ..write('name: $name, ')
          ..write('lastActiveAt: $lastActiveAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $AuthTokensTable extends AuthTokens
    with TableInfo<$AuthTokensTable, AuthTokenRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuthTokensTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _adminUidMeta = const VerificationMeta(
    'adminUid',
  );
  @override
  late final GeneratedColumn<String> adminUid = GeneratedColumn<String>(
    'admin_uid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _accessTokenMeta = const VerificationMeta(
    'accessToken',
  );
  @override
  late final GeneratedColumn<String> accessToken = GeneratedColumn<String>(
    'access_token',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _refreshTokenMeta = const VerificationMeta(
    'refreshToken',
  );
  @override
  late final GeneratedColumn<String> refreshToken = GeneratedColumn<String>(
    'refresh_token',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expiresAtMeta = const VerificationMeta(
    'expiresAt',
  );
  @override
  late final GeneratedColumn<DateTime> expiresAt = GeneratedColumn<DateTime>(
    'expires_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
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
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    adminUid,
    accessToken,
    refreshToken,
    expiresAt,
    createdAt,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'auth_tokens';
  @override
  VerificationContext validateIntegrity(
    Insertable<AuthTokenRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('admin_uid')) {
      context.handle(
        _adminUidMeta,
        adminUid.isAcceptableOrUnknown(data['admin_uid']!, _adminUidMeta),
      );
    } else if (isInserting) {
      context.missing(_adminUidMeta);
    }
    if (data.containsKey('access_token')) {
      context.handle(
        _accessTokenMeta,
        accessToken.isAcceptableOrUnknown(
          data['access_token']!,
          _accessTokenMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_accessTokenMeta);
    }
    if (data.containsKey('refresh_token')) {
      context.handle(
        _refreshTokenMeta,
        refreshToken.isAcceptableOrUnknown(
          data['refresh_token']!,
          _refreshTokenMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_refreshTokenMeta);
    }
    if (data.containsKey('expires_at')) {
      context.handle(
        _expiresAtMeta,
        expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta),
      );
    } else if (isInserting) {
      context.missing(_expiresAtMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AuthTokenRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuthTokenRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      adminUid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}admin_uid'],
      )!,
      accessToken: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}access_token'],
      )!,
      refreshToken: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}refresh_token'],
      )!,
      expiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expires_at'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  $AuthTokensTable createAlias(String alias) {
    return $AuthTokensTable(attachedDatabase, alias);
  }
}

class AuthTokenRecord extends DataClass implements Insertable<AuthTokenRecord> {
  final int id;
  final String adminUid;
  final String accessToken;
  final String refreshToken;
  final DateTime expiresAt;
  final DateTime createdAt;
  final bool isActive;
  const AuthTokenRecord({
    required this.id,
    required this.adminUid,
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAt,
    required this.createdAt,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['admin_uid'] = Variable<String>(adminUid);
    map['access_token'] = Variable<String>(accessToken);
    map['refresh_token'] = Variable<String>(refreshToken);
    map['expires_at'] = Variable<DateTime>(expiresAt);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  AuthTokensCompanion toCompanion(bool nullToAbsent) {
    return AuthTokensCompanion(
      id: Value(id),
      adminUid: Value(adminUid),
      accessToken: Value(accessToken),
      refreshToken: Value(refreshToken),
      expiresAt: Value(expiresAt),
      createdAt: Value(createdAt),
      isActive: Value(isActive),
    );
  }

  factory AuthTokenRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuthTokenRecord(
      id: serializer.fromJson<int>(json['id']),
      adminUid: serializer.fromJson<String>(json['adminUid']),
      accessToken: serializer.fromJson<String>(json['accessToken']),
      refreshToken: serializer.fromJson<String>(json['refreshToken']),
      expiresAt: serializer.fromJson<DateTime>(json['expiresAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      isActive: serializer.fromJson<bool>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'adminUid': serializer.toJson<String>(adminUid),
      'accessToken': serializer.toJson<String>(accessToken),
      'refreshToken': serializer.toJson<String>(refreshToken),
      'expiresAt': serializer.toJson<DateTime>(expiresAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'isActive': serializer.toJson<bool>(isActive),
    };
  }

  AuthTokenRecord copyWith({
    int? id,
    String? adminUid,
    String? accessToken,
    String? refreshToken,
    DateTime? expiresAt,
    DateTime? createdAt,
    bool? isActive,
  }) => AuthTokenRecord(
    id: id ?? this.id,
    adminUid: adminUid ?? this.adminUid,
    accessToken: accessToken ?? this.accessToken,
    refreshToken: refreshToken ?? this.refreshToken,
    expiresAt: expiresAt ?? this.expiresAt,
    createdAt: createdAt ?? this.createdAt,
    isActive: isActive ?? this.isActive,
  );
  AuthTokenRecord copyWithCompanion(AuthTokensCompanion data) {
    return AuthTokenRecord(
      id: data.id.present ? data.id.value : this.id,
      adminUid: data.adminUid.present ? data.adminUid.value : this.adminUid,
      accessToken: data.accessToken.present
          ? data.accessToken.value
          : this.accessToken,
      refreshToken: data.refreshToken.present
          ? data.refreshToken.value
          : this.refreshToken,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuthTokenRecord(')
          ..write('id: $id, ')
          ..write('adminUid: $adminUid, ')
          ..write('accessToken: $accessToken, ')
          ..write('refreshToken: $refreshToken, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    adminUid,
    accessToken,
    refreshToken,
    expiresAt,
    createdAt,
    isActive,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuthTokenRecord &&
          other.id == this.id &&
          other.adminUid == this.adminUid &&
          other.accessToken == this.accessToken &&
          other.refreshToken == this.refreshToken &&
          other.expiresAt == this.expiresAt &&
          other.createdAt == this.createdAt &&
          other.isActive == this.isActive);
}

class AuthTokensCompanion extends UpdateCompanion<AuthTokenRecord> {
  final Value<int> id;
  final Value<String> adminUid;
  final Value<String> accessToken;
  final Value<String> refreshToken;
  final Value<DateTime> expiresAt;
  final Value<DateTime> createdAt;
  final Value<bool> isActive;
  const AuthTokensCompanion({
    this.id = const Value.absent(),
    this.adminUid = const Value.absent(),
    this.accessToken = const Value.absent(),
    this.refreshToken = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  AuthTokensCompanion.insert({
    this.id = const Value.absent(),
    required String adminUid,
    required String accessToken,
    required String refreshToken,
    required DateTime expiresAt,
    required DateTime createdAt,
    this.isActive = const Value.absent(),
  }) : adminUid = Value(adminUid),
       accessToken = Value(accessToken),
       refreshToken = Value(refreshToken),
       expiresAt = Value(expiresAt),
       createdAt = Value(createdAt);
  static Insertable<AuthTokenRecord> custom({
    Expression<int>? id,
    Expression<String>? adminUid,
    Expression<String>? accessToken,
    Expression<String>? refreshToken,
    Expression<DateTime>? expiresAt,
    Expression<DateTime>? createdAt,
    Expression<bool>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (adminUid != null) 'admin_uid': adminUid,
      if (accessToken != null) 'access_token': accessToken,
      if (refreshToken != null) 'refresh_token': refreshToken,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (createdAt != null) 'created_at': createdAt,
      if (isActive != null) 'is_active': isActive,
    });
  }

  AuthTokensCompanion copyWith({
    Value<int>? id,
    Value<String>? adminUid,
    Value<String>? accessToken,
    Value<String>? refreshToken,
    Value<DateTime>? expiresAt,
    Value<DateTime>? createdAt,
    Value<bool>? isActive,
  }) {
    return AuthTokensCompanion(
      id: id ?? this.id,
      adminUid: adminUid ?? this.adminUid,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      expiresAt: expiresAt ?? this.expiresAt,
      createdAt: createdAt ?? this.createdAt,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (adminUid.present) {
      map['admin_uid'] = Variable<String>(adminUid.value);
    }
    if (accessToken.present) {
      map['access_token'] = Variable<String>(accessToken.value);
    }
    if (refreshToken.present) {
      map['refresh_token'] = Variable<String>(refreshToken.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuthTokensCompanion(')
          ..write('id: $id, ')
          ..write('adminUid: $adminUid, ')
          ..write('accessToken: $accessToken, ')
          ..write('refreshToken: $refreshToken, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $SyncQueueTable extends SyncQueue
    with TableInfo<$SyncQueueTable, SyncQueueRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncQueueTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityUidMeta = const VerificationMeta(
    'entityUid',
  );
  @override
  late final GeneratedColumn<String> entityUid = GeneratedColumn<String>(
    'entity_uid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
    'action',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _priorityMeta = const VerificationMeta(
    'priority',
  );
  @override
  late final GeneratedColumn<int> priority = GeneratedColumn<int>(
    'priority',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _retryCountMeta = const VerificationMeta(
    'retryCount',
  );
  @override
  late final GeneratedColumn<int> retryCount = GeneratedColumn<int>(
    'retry_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _errorMeta = const VerificationMeta('error');
  @override
  late final GeneratedColumn<String> error = GeneratedColumn<String>(
    'error',
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
  static const VerificationMeta _scheduledAtMeta = const VerificationMeta(
    'scheduledAt',
  );
  @override
  late final GeneratedColumn<DateTime> scheduledAt = GeneratedColumn<DateTime>(
    'scheduled_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isProcessedMeta = const VerificationMeta(
    'isProcessed',
  );
  @override
  late final GeneratedColumn<bool> isProcessed = GeneratedColumn<bool>(
    'is_processed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_processed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    entityType,
    entityUid,
    action,
    payload,
    priority,
    retryCount,
    error,
    createdAt,
    scheduledAt,
    isProcessed,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_queue';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncQueueRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_uid')) {
      context.handle(
        _entityUidMeta,
        entityUid.isAcceptableOrUnknown(data['entity_uid']!, _entityUidMeta),
      );
    } else if (isInserting) {
      context.missing(_entityUidMeta);
    }
    if (data.containsKey('action')) {
      context.handle(
        _actionMeta,
        action.isAcceptableOrUnknown(data['action']!, _actionMeta),
      );
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    }
    if (data.containsKey('priority')) {
      context.handle(
        _priorityMeta,
        priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta),
      );
    }
    if (data.containsKey('retry_count')) {
      context.handle(
        _retryCountMeta,
        retryCount.isAcceptableOrUnknown(data['retry_count']!, _retryCountMeta),
      );
    }
    if (data.containsKey('error')) {
      context.handle(
        _errorMeta,
        error.isAcceptableOrUnknown(data['error']!, _errorMeta),
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
    if (data.containsKey('scheduled_at')) {
      context.handle(
        _scheduledAtMeta,
        scheduledAt.isAcceptableOrUnknown(
          data['scheduled_at']!,
          _scheduledAtMeta,
        ),
      );
    }
    if (data.containsKey('is_processed')) {
      context.handle(
        _isProcessedMeta,
        isProcessed.isAcceptableOrUnknown(
          data['is_processed']!,
          _isProcessedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncQueueRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncQueueRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      entityUid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_uid'],
      )!,
      action: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      ),
      priority: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}priority'],
      )!,
      retryCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}retry_count'],
      )!,
      error: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}error'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      scheduledAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}scheduled_at'],
      ),
      isProcessed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_processed'],
      )!,
    );
  }

  @override
  $SyncQueueTable createAlias(String alias) {
    return $SyncQueueTable(attachedDatabase, alias);
  }
}

class SyncQueueRecord extends DataClass implements Insertable<SyncQueueRecord> {
  final int id;
  final String entityType;
  final String entityUid;
  final String action;
  final String? payload;
  final int priority;
  final int retryCount;
  final String? error;
  final DateTime createdAt;
  final DateTime? scheduledAt;
  final bool isProcessed;
  const SyncQueueRecord({
    required this.id,
    required this.entityType,
    required this.entityUid,
    required this.action,
    this.payload,
    required this.priority,
    required this.retryCount,
    this.error,
    required this.createdAt,
    this.scheduledAt,
    required this.isProcessed,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['entity_type'] = Variable<String>(entityType);
    map['entity_uid'] = Variable<String>(entityUid);
    map['action'] = Variable<String>(action);
    if (!nullToAbsent || payload != null) {
      map['payload'] = Variable<String>(payload);
    }
    map['priority'] = Variable<int>(priority);
    map['retry_count'] = Variable<int>(retryCount);
    if (!nullToAbsent || error != null) {
      map['error'] = Variable<String>(error);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || scheduledAt != null) {
      map['scheduled_at'] = Variable<DateTime>(scheduledAt);
    }
    map['is_processed'] = Variable<bool>(isProcessed);
    return map;
  }

  SyncQueueCompanion toCompanion(bool nullToAbsent) {
    return SyncQueueCompanion(
      id: Value(id),
      entityType: Value(entityType),
      entityUid: Value(entityUid),
      action: Value(action),
      payload: payload == null && nullToAbsent
          ? const Value.absent()
          : Value(payload),
      priority: Value(priority),
      retryCount: Value(retryCount),
      error: error == null && nullToAbsent
          ? const Value.absent()
          : Value(error),
      createdAt: Value(createdAt),
      scheduledAt: scheduledAt == null && nullToAbsent
          ? const Value.absent()
          : Value(scheduledAt),
      isProcessed: Value(isProcessed),
    );
  }

  factory SyncQueueRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncQueueRecord(
      id: serializer.fromJson<int>(json['id']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityUid: serializer.fromJson<String>(json['entityUid']),
      action: serializer.fromJson<String>(json['action']),
      payload: serializer.fromJson<String?>(json['payload']),
      priority: serializer.fromJson<int>(json['priority']),
      retryCount: serializer.fromJson<int>(json['retryCount']),
      error: serializer.fromJson<String?>(json['error']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      scheduledAt: serializer.fromJson<DateTime?>(json['scheduledAt']),
      isProcessed: serializer.fromJson<bool>(json['isProcessed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entityType': serializer.toJson<String>(entityType),
      'entityUid': serializer.toJson<String>(entityUid),
      'action': serializer.toJson<String>(action),
      'payload': serializer.toJson<String?>(payload),
      'priority': serializer.toJson<int>(priority),
      'retryCount': serializer.toJson<int>(retryCount),
      'error': serializer.toJson<String?>(error),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'scheduledAt': serializer.toJson<DateTime?>(scheduledAt),
      'isProcessed': serializer.toJson<bool>(isProcessed),
    };
  }

  SyncQueueRecord copyWith({
    int? id,
    String? entityType,
    String? entityUid,
    String? action,
    Value<String?> payload = const Value.absent(),
    int? priority,
    int? retryCount,
    Value<String?> error = const Value.absent(),
    DateTime? createdAt,
    Value<DateTime?> scheduledAt = const Value.absent(),
    bool? isProcessed,
  }) => SyncQueueRecord(
    id: id ?? this.id,
    entityType: entityType ?? this.entityType,
    entityUid: entityUid ?? this.entityUid,
    action: action ?? this.action,
    payload: payload.present ? payload.value : this.payload,
    priority: priority ?? this.priority,
    retryCount: retryCount ?? this.retryCount,
    error: error.present ? error.value : this.error,
    createdAt: createdAt ?? this.createdAt,
    scheduledAt: scheduledAt.present ? scheduledAt.value : this.scheduledAt,
    isProcessed: isProcessed ?? this.isProcessed,
  );
  SyncQueueRecord copyWithCompanion(SyncQueueCompanion data) {
    return SyncQueueRecord(
      id: data.id.present ? data.id.value : this.id,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      entityUid: data.entityUid.present ? data.entityUid.value : this.entityUid,
      action: data.action.present ? data.action.value : this.action,
      payload: data.payload.present ? data.payload.value : this.payload,
      priority: data.priority.present ? data.priority.value : this.priority,
      retryCount: data.retryCount.present
          ? data.retryCount.value
          : this.retryCount,
      error: data.error.present ? data.error.value : this.error,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      scheduledAt: data.scheduledAt.present
          ? data.scheduledAt.value
          : this.scheduledAt,
      isProcessed: data.isProcessed.present
          ? data.isProcessed.value
          : this.isProcessed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueRecord(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityUid: $entityUid, ')
          ..write('action: $action, ')
          ..write('payload: $payload, ')
          ..write('priority: $priority, ')
          ..write('retryCount: $retryCount, ')
          ..write('error: $error, ')
          ..write('createdAt: $createdAt, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('isProcessed: $isProcessed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    entityType,
    entityUid,
    action,
    payload,
    priority,
    retryCount,
    error,
    createdAt,
    scheduledAt,
    isProcessed,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncQueueRecord &&
          other.id == this.id &&
          other.entityType == this.entityType &&
          other.entityUid == this.entityUid &&
          other.action == this.action &&
          other.payload == this.payload &&
          other.priority == this.priority &&
          other.retryCount == this.retryCount &&
          other.error == this.error &&
          other.createdAt == this.createdAt &&
          other.scheduledAt == this.scheduledAt &&
          other.isProcessed == this.isProcessed);
}

class SyncQueueCompanion extends UpdateCompanion<SyncQueueRecord> {
  final Value<int> id;
  final Value<String> entityType;
  final Value<String> entityUid;
  final Value<String> action;
  final Value<String?> payload;
  final Value<int> priority;
  final Value<int> retryCount;
  final Value<String?> error;
  final Value<DateTime> createdAt;
  final Value<DateTime?> scheduledAt;
  final Value<bool> isProcessed;
  const SyncQueueCompanion({
    this.id = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityUid = const Value.absent(),
    this.action = const Value.absent(),
    this.payload = const Value.absent(),
    this.priority = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.error = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.scheduledAt = const Value.absent(),
    this.isProcessed = const Value.absent(),
  });
  SyncQueueCompanion.insert({
    this.id = const Value.absent(),
    required String entityType,
    required String entityUid,
    required String action,
    this.payload = const Value.absent(),
    this.priority = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.error = const Value.absent(),
    required DateTime createdAt,
    this.scheduledAt = const Value.absent(),
    this.isProcessed = const Value.absent(),
  }) : entityType = Value(entityType),
       entityUid = Value(entityUid),
       action = Value(action),
       createdAt = Value(createdAt);
  static Insertable<SyncQueueRecord> custom({
    Expression<int>? id,
    Expression<String>? entityType,
    Expression<String>? entityUid,
    Expression<String>? action,
    Expression<String>? payload,
    Expression<int>? priority,
    Expression<int>? retryCount,
    Expression<String>? error,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? scheduledAt,
    Expression<bool>? isProcessed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entityType != null) 'entity_type': entityType,
      if (entityUid != null) 'entity_uid': entityUid,
      if (action != null) 'action': action,
      if (payload != null) 'payload': payload,
      if (priority != null) 'priority': priority,
      if (retryCount != null) 'retry_count': retryCount,
      if (error != null) 'error': error,
      if (createdAt != null) 'created_at': createdAt,
      if (scheduledAt != null) 'scheduled_at': scheduledAt,
      if (isProcessed != null) 'is_processed': isProcessed,
    });
  }

  SyncQueueCompanion copyWith({
    Value<int>? id,
    Value<String>? entityType,
    Value<String>? entityUid,
    Value<String>? action,
    Value<String?>? payload,
    Value<int>? priority,
    Value<int>? retryCount,
    Value<String?>? error,
    Value<DateTime>? createdAt,
    Value<DateTime?>? scheduledAt,
    Value<bool>? isProcessed,
  }) {
    return SyncQueueCompanion(
      id: id ?? this.id,
      entityType: entityType ?? this.entityType,
      entityUid: entityUid ?? this.entityUid,
      action: action ?? this.action,
      payload: payload ?? this.payload,
      priority: priority ?? this.priority,
      retryCount: retryCount ?? this.retryCount,
      error: error ?? this.error,
      createdAt: createdAt ?? this.createdAt,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      isProcessed: isProcessed ?? this.isProcessed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityUid.present) {
      map['entity_uid'] = Variable<String>(entityUid.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    if (retryCount.present) {
      map['retry_count'] = Variable<int>(retryCount.value);
    }
    if (error.present) {
      map['error'] = Variable<String>(error.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (scheduledAt.present) {
      map['scheduled_at'] = Variable<DateTime>(scheduledAt.value);
    }
    if (isProcessed.present) {
      map['is_processed'] = Variable<bool>(isProcessed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueCompanion(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityUid: $entityUid, ')
          ..write('action: $action, ')
          ..write('payload: $payload, ')
          ..write('priority: $priority, ')
          ..write('retryCount: $retryCount, ')
          ..write('error: $error, ')
          ..write('createdAt: $createdAt, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('isProcessed: $isProcessed')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AdminsTable admins = $AdminsTable(this);
  late final $DevicesTable devices = $DevicesTable(this);
  late final $AuthTokensTable authTokens = $AuthTokensTable(this);
  late final $SyncQueueTable syncQueue = $SyncQueueTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    admins,
    devices,
    authTokens,
    syncQueue,
  ];
}

typedef $$AdminsTableCreateCompanionBuilder =
    AdminsCompanion Function({
      Value<bool> isSynced,
      Value<DateTime?> deletedAt,
      Value<String?> syncAction,
      Value<int> syncRetryCount,
      Value<String?> syncError,
      Value<DateTime?> lastSyncAttempt,
      Value<int> id,
      required String uid,
      required String phone,
      Value<String?> firstName,
      Value<String?> lastName,
      Value<String?> email,
      required DateTime updatedAt,
      required DateTime createdAt,
    });
typedef $$AdminsTableUpdateCompanionBuilder =
    AdminsCompanion Function({
      Value<bool> isSynced,
      Value<DateTime?> deletedAt,
      Value<String?> syncAction,
      Value<int> syncRetryCount,
      Value<String?> syncError,
      Value<DateTime?> lastSyncAttempt,
      Value<int> id,
      Value<String> uid,
      Value<String> phone,
      Value<String?> firstName,
      Value<String?> lastName,
      Value<String?> email,
      Value<DateTime> updatedAt,
      Value<DateTime> createdAt,
    });

class $$AdminsTableFilterComposer
    extends Composer<_$AppDatabase, $AdminsTable> {
  $$AdminsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncAction => $composableBuilder(
    column: $table.syncAction,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncRetryCount => $composableBuilder(
    column: $table.syncRetryCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncError => $composableBuilder(
    column: $table.syncError,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastSyncAttempt => $composableBuilder(
    column: $table.lastSyncAttempt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
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

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AdminsTableOrderingComposer
    extends Composer<_$AppDatabase, $AdminsTable> {
  $$AdminsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncAction => $composableBuilder(
    column: $table.syncAction,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncRetryCount => $composableBuilder(
    column: $table.syncRetryCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncError => $composableBuilder(
    column: $table.syncError,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastSyncAttempt => $composableBuilder(
    column: $table.lastSyncAttempt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
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

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AdminsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AdminsTable> {
  $$AdminsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncAction => $composableBuilder(
    column: $table.syncAction,
    builder: (column) => column,
  );

  GeneratedColumn<int> get syncRetryCount => $composableBuilder(
    column: $table.syncRetryCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncError =>
      $composableBuilder(column: $table.syncError, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncAttempt => $composableBuilder(
    column: $table.lastSyncAttempt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$AdminsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AdminsTable,
          AdminRecord,
          $$AdminsTableFilterComposer,
          $$AdminsTableOrderingComposer,
          $$AdminsTableAnnotationComposer,
          $$AdminsTableCreateCompanionBuilder,
          $$AdminsTableUpdateCompanionBuilder,
          (
            AdminRecord,
            BaseReferences<_$AppDatabase, $AdminsTable, AdminRecord>,
          ),
          AdminRecord,
          PrefetchHooks Function()
        > {
  $$AdminsTableTableManager(_$AppDatabase db, $AdminsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AdminsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AdminsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AdminsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<bool> isSynced = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> syncAction = const Value.absent(),
                Value<int> syncRetryCount = const Value.absent(),
                Value<String?> syncError = const Value.absent(),
                Value<DateTime?> lastSyncAttempt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String> uid = const Value.absent(),
                Value<String> phone = const Value.absent(),
                Value<String?> firstName = const Value.absent(),
                Value<String?> lastName = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => AdminsCompanion(
                isSynced: isSynced,
                deletedAt: deletedAt,
                syncAction: syncAction,
                syncRetryCount: syncRetryCount,
                syncError: syncError,
                lastSyncAttempt: lastSyncAttempt,
                id: id,
                uid: uid,
                phone: phone,
                firstName: firstName,
                lastName: lastName,
                email: email,
                updatedAt: updatedAt,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<bool> isSynced = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> syncAction = const Value.absent(),
                Value<int> syncRetryCount = const Value.absent(),
                Value<String?> syncError = const Value.absent(),
                Value<DateTime?> lastSyncAttempt = const Value.absent(),
                Value<int> id = const Value.absent(),
                required String uid,
                required String phone,
                Value<String?> firstName = const Value.absent(),
                Value<String?> lastName = const Value.absent(),
                Value<String?> email = const Value.absent(),
                required DateTime updatedAt,
                required DateTime createdAt,
              }) => AdminsCompanion.insert(
                isSynced: isSynced,
                deletedAt: deletedAt,
                syncAction: syncAction,
                syncRetryCount: syncRetryCount,
                syncError: syncError,
                lastSyncAttempt: lastSyncAttempt,
                id: id,
                uid: uid,
                phone: phone,
                firstName: firstName,
                lastName: lastName,
                email: email,
                updatedAt: updatedAt,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AdminsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AdminsTable,
      AdminRecord,
      $$AdminsTableFilterComposer,
      $$AdminsTableOrderingComposer,
      $$AdminsTableAnnotationComposer,
      $$AdminsTableCreateCompanionBuilder,
      $$AdminsTableUpdateCompanionBuilder,
      (AdminRecord, BaseReferences<_$AppDatabase, $AdminsTable, AdminRecord>),
      AdminRecord,
      PrefetchHooks Function()
    >;
typedef $$DevicesTableCreateCompanionBuilder =
    DevicesCompanion Function({
      Value<bool> isSynced,
      Value<DateTime?> deletedAt,
      Value<String?> syncAction,
      Value<int> syncRetryCount,
      Value<String?> syncError,
      Value<DateTime?> lastSyncAttempt,
      Value<int> id,
      required String uid,
      required String deviceId,
      required String deviceCode,
      required String type,
      Value<String?> name,
      Value<DateTime?> lastActiveAt,
      required DateTime updatedAt,
      required DateTime createdAt,
    });
typedef $$DevicesTableUpdateCompanionBuilder =
    DevicesCompanion Function({
      Value<bool> isSynced,
      Value<DateTime?> deletedAt,
      Value<String?> syncAction,
      Value<int> syncRetryCount,
      Value<String?> syncError,
      Value<DateTime?> lastSyncAttempt,
      Value<int> id,
      Value<String> uid,
      Value<String> deviceId,
      Value<String> deviceCode,
      Value<String> type,
      Value<String?> name,
      Value<DateTime?> lastActiveAt,
      Value<DateTime> updatedAt,
      Value<DateTime> createdAt,
    });

class $$DevicesTableFilterComposer
    extends Composer<_$AppDatabase, $DevicesTable> {
  $$DevicesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncAction => $composableBuilder(
    column: $table.syncAction,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncRetryCount => $composableBuilder(
    column: $table.syncRetryCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncError => $composableBuilder(
    column: $table.syncError,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastSyncAttempt => $composableBuilder(
    column: $table.lastSyncAttempt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceCode => $composableBuilder(
    column: $table.deviceCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastActiveAt => $composableBuilder(
    column: $table.lastActiveAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DevicesTableOrderingComposer
    extends Composer<_$AppDatabase, $DevicesTable> {
  $$DevicesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncAction => $composableBuilder(
    column: $table.syncAction,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncRetryCount => $composableBuilder(
    column: $table.syncRetryCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncError => $composableBuilder(
    column: $table.syncError,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastSyncAttempt => $composableBuilder(
    column: $table.lastSyncAttempt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceCode => $composableBuilder(
    column: $table.deviceCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastActiveAt => $composableBuilder(
    column: $table.lastActiveAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DevicesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DevicesTable> {
  $$DevicesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncAction => $composableBuilder(
    column: $table.syncAction,
    builder: (column) => column,
  );

  GeneratedColumn<int> get syncRetryCount => $composableBuilder(
    column: $table.syncRetryCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncError =>
      $composableBuilder(column: $table.syncError, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncAttempt => $composableBuilder(
    column: $table.lastSyncAttempt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<String> get deviceCode => $composableBuilder(
    column: $table.deviceCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get lastActiveAt => $composableBuilder(
    column: $table.lastActiveAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$DevicesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DevicesTable,
          DeviceEntity,
          $$DevicesTableFilterComposer,
          $$DevicesTableOrderingComposer,
          $$DevicesTableAnnotationComposer,
          $$DevicesTableCreateCompanionBuilder,
          $$DevicesTableUpdateCompanionBuilder,
          (
            DeviceEntity,
            BaseReferences<_$AppDatabase, $DevicesTable, DeviceEntity>,
          ),
          DeviceEntity,
          PrefetchHooks Function()
        > {
  $$DevicesTableTableManager(_$AppDatabase db, $DevicesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DevicesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DevicesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DevicesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<bool> isSynced = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> syncAction = const Value.absent(),
                Value<int> syncRetryCount = const Value.absent(),
                Value<String?> syncError = const Value.absent(),
                Value<DateTime?> lastSyncAttempt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String> uid = const Value.absent(),
                Value<String> deviceId = const Value.absent(),
                Value<String> deviceCode = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<DateTime?> lastActiveAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => DevicesCompanion(
                isSynced: isSynced,
                deletedAt: deletedAt,
                syncAction: syncAction,
                syncRetryCount: syncRetryCount,
                syncError: syncError,
                lastSyncAttempt: lastSyncAttempt,
                id: id,
                uid: uid,
                deviceId: deviceId,
                deviceCode: deviceCode,
                type: type,
                name: name,
                lastActiveAt: lastActiveAt,
                updatedAt: updatedAt,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<bool> isSynced = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> syncAction = const Value.absent(),
                Value<int> syncRetryCount = const Value.absent(),
                Value<String?> syncError = const Value.absent(),
                Value<DateTime?> lastSyncAttempt = const Value.absent(),
                Value<int> id = const Value.absent(),
                required String uid,
                required String deviceId,
                required String deviceCode,
                required String type,
                Value<String?> name = const Value.absent(),
                Value<DateTime?> lastActiveAt = const Value.absent(),
                required DateTime updatedAt,
                required DateTime createdAt,
              }) => DevicesCompanion.insert(
                isSynced: isSynced,
                deletedAt: deletedAt,
                syncAction: syncAction,
                syncRetryCount: syncRetryCount,
                syncError: syncError,
                lastSyncAttempt: lastSyncAttempt,
                id: id,
                uid: uid,
                deviceId: deviceId,
                deviceCode: deviceCode,
                type: type,
                name: name,
                lastActiveAt: lastActiveAt,
                updatedAt: updatedAt,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DevicesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DevicesTable,
      DeviceEntity,
      $$DevicesTableFilterComposer,
      $$DevicesTableOrderingComposer,
      $$DevicesTableAnnotationComposer,
      $$DevicesTableCreateCompanionBuilder,
      $$DevicesTableUpdateCompanionBuilder,
      (
        DeviceEntity,
        BaseReferences<_$AppDatabase, $DevicesTable, DeviceEntity>,
      ),
      DeviceEntity,
      PrefetchHooks Function()
    >;
typedef $$AuthTokensTableCreateCompanionBuilder =
    AuthTokensCompanion Function({
      Value<int> id,
      required String adminUid,
      required String accessToken,
      required String refreshToken,
      required DateTime expiresAt,
      required DateTime createdAt,
      Value<bool> isActive,
    });
typedef $$AuthTokensTableUpdateCompanionBuilder =
    AuthTokensCompanion Function({
      Value<int> id,
      Value<String> adminUid,
      Value<String> accessToken,
      Value<String> refreshToken,
      Value<DateTime> expiresAt,
      Value<DateTime> createdAt,
      Value<bool> isActive,
    });

class $$AuthTokensTableFilterComposer
    extends Composer<_$AppDatabase, $AuthTokensTable> {
  $$AuthTokensTableFilterComposer({
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

  ColumnFilters<String> get adminUid => $composableBuilder(
    column: $table.adminUid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accessToken => $composableBuilder(
    column: $table.accessToken,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get refreshToken => $composableBuilder(
    column: $table.refreshToken,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AuthTokensTableOrderingComposer
    extends Composer<_$AppDatabase, $AuthTokensTable> {
  $$AuthTokensTableOrderingComposer({
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

  ColumnOrderings<String> get adminUid => $composableBuilder(
    column: $table.adminUid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accessToken => $composableBuilder(
    column: $table.accessToken,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get refreshToken => $composableBuilder(
    column: $table.refreshToken,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AuthTokensTableAnnotationComposer
    extends Composer<_$AppDatabase, $AuthTokensTable> {
  $$AuthTokensTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get adminUid =>
      $composableBuilder(column: $table.adminUid, builder: (column) => column);

  GeneratedColumn<String> get accessToken => $composableBuilder(
    column: $table.accessToken,
    builder: (column) => column,
  );

  GeneratedColumn<String> get refreshToken => $composableBuilder(
    column: $table.refreshToken,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);
}

class $$AuthTokensTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AuthTokensTable,
          AuthTokenRecord,
          $$AuthTokensTableFilterComposer,
          $$AuthTokensTableOrderingComposer,
          $$AuthTokensTableAnnotationComposer,
          $$AuthTokensTableCreateCompanionBuilder,
          $$AuthTokensTableUpdateCompanionBuilder,
          (
            AuthTokenRecord,
            BaseReferences<_$AppDatabase, $AuthTokensTable, AuthTokenRecord>,
          ),
          AuthTokenRecord,
          PrefetchHooks Function()
        > {
  $$AuthTokensTableTableManager(_$AppDatabase db, $AuthTokensTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuthTokensTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuthTokensTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuthTokensTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> adminUid = const Value.absent(),
                Value<String> accessToken = const Value.absent(),
                Value<String> refreshToken = const Value.absent(),
                Value<DateTime> expiresAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
              }) => AuthTokensCompanion(
                id: id,
                adminUid: adminUid,
                accessToken: accessToken,
                refreshToken: refreshToken,
                expiresAt: expiresAt,
                createdAt: createdAt,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String adminUid,
                required String accessToken,
                required String refreshToken,
                required DateTime expiresAt,
                required DateTime createdAt,
                Value<bool> isActive = const Value.absent(),
              }) => AuthTokensCompanion.insert(
                id: id,
                adminUid: adminUid,
                accessToken: accessToken,
                refreshToken: refreshToken,
                expiresAt: expiresAt,
                createdAt: createdAt,
                isActive: isActive,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AuthTokensTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AuthTokensTable,
      AuthTokenRecord,
      $$AuthTokensTableFilterComposer,
      $$AuthTokensTableOrderingComposer,
      $$AuthTokensTableAnnotationComposer,
      $$AuthTokensTableCreateCompanionBuilder,
      $$AuthTokensTableUpdateCompanionBuilder,
      (
        AuthTokenRecord,
        BaseReferences<_$AppDatabase, $AuthTokensTable, AuthTokenRecord>,
      ),
      AuthTokenRecord,
      PrefetchHooks Function()
    >;
typedef $$SyncQueueTableCreateCompanionBuilder =
    SyncQueueCompanion Function({
      Value<int> id,
      required String entityType,
      required String entityUid,
      required String action,
      Value<String?> payload,
      Value<int> priority,
      Value<int> retryCount,
      Value<String?> error,
      required DateTime createdAt,
      Value<DateTime?> scheduledAt,
      Value<bool> isProcessed,
    });
typedef $$SyncQueueTableUpdateCompanionBuilder =
    SyncQueueCompanion Function({
      Value<int> id,
      Value<String> entityType,
      Value<String> entityUid,
      Value<String> action,
      Value<String?> payload,
      Value<int> priority,
      Value<int> retryCount,
      Value<String?> error,
      Value<DateTime> createdAt,
      Value<DateTime?> scheduledAt,
      Value<bool> isProcessed,
    });

class $$SyncQueueTableFilterComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableFilterComposer({
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

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityUid => $composableBuilder(
    column: $table.entityUid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get error => $composableBuilder(
    column: $table.error,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isProcessed => $composableBuilder(
    column: $table.isProcessed,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncQueueTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableOrderingComposer({
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

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityUid => $composableBuilder(
    column: $table.entityUid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get error => $composableBuilder(
    column: $table.error,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isProcessed => $composableBuilder(
    column: $table.isProcessed,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncQueueTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entityUid =>
      $composableBuilder(column: $table.entityUid, builder: (column) => column);

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<int> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get error =>
      $composableBuilder(column: $table.error, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isProcessed => $composableBuilder(
    column: $table.isProcessed,
    builder: (column) => column,
  );
}

class $$SyncQueueTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncQueueTable,
          SyncQueueRecord,
          $$SyncQueueTableFilterComposer,
          $$SyncQueueTableOrderingComposer,
          $$SyncQueueTableAnnotationComposer,
          $$SyncQueueTableCreateCompanionBuilder,
          $$SyncQueueTableUpdateCompanionBuilder,
          (
            SyncQueueRecord,
            BaseReferences<_$AppDatabase, $SyncQueueTable, SyncQueueRecord>,
          ),
          SyncQueueRecord,
          PrefetchHooks Function()
        > {
  $$SyncQueueTableTableManager(_$AppDatabase db, $SyncQueueTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncQueueTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncQueueTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncQueueTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<String> entityUid = const Value.absent(),
                Value<String> action = const Value.absent(),
                Value<String?> payload = const Value.absent(),
                Value<int> priority = const Value.absent(),
                Value<int> retryCount = const Value.absent(),
                Value<String?> error = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> scheduledAt = const Value.absent(),
                Value<bool> isProcessed = const Value.absent(),
              }) => SyncQueueCompanion(
                id: id,
                entityType: entityType,
                entityUid: entityUid,
                action: action,
                payload: payload,
                priority: priority,
                retryCount: retryCount,
                error: error,
                createdAt: createdAt,
                scheduledAt: scheduledAt,
                isProcessed: isProcessed,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String entityType,
                required String entityUid,
                required String action,
                Value<String?> payload = const Value.absent(),
                Value<int> priority = const Value.absent(),
                Value<int> retryCount = const Value.absent(),
                Value<String?> error = const Value.absent(),
                required DateTime createdAt,
                Value<DateTime?> scheduledAt = const Value.absent(),
                Value<bool> isProcessed = const Value.absent(),
              }) => SyncQueueCompanion.insert(
                id: id,
                entityType: entityType,
                entityUid: entityUid,
                action: action,
                payload: payload,
                priority: priority,
                retryCount: retryCount,
                error: error,
                createdAt: createdAt,
                scheduledAt: scheduledAt,
                isProcessed: isProcessed,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncQueueTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncQueueTable,
      SyncQueueRecord,
      $$SyncQueueTableFilterComposer,
      $$SyncQueueTableOrderingComposer,
      $$SyncQueueTableAnnotationComposer,
      $$SyncQueueTableCreateCompanionBuilder,
      $$SyncQueueTableUpdateCompanionBuilder,
      (
        SyncQueueRecord,
        BaseReferences<_$AppDatabase, $SyncQueueTable, SyncQueueRecord>,
      ),
      SyncQueueRecord,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AdminsTableTableManager get admins =>
      $$AdminsTableTableManager(_db, _db.admins);
  $$DevicesTableTableManager get devices =>
      $$DevicesTableTableManager(_db, _db.devices);
  $$AuthTokensTableTableManager get authTokens =>
      $$AuthTokensTableTableManager(_db, _db.authTokens);
  $$SyncQueueTableTableManager get syncQueue =>
      $$SyncQueueTableTableManager(_db, _db.syncQueue);
}
