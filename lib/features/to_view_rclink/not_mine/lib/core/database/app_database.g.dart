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

class $RolesTable extends Roles with TableInfo<$RolesTable, RoleRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RolesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _companyIDMeta = const VerificationMeta(
    'companyID',
  );
  @override
  late final GeneratedColumn<int> companyID = GeneratedColumn<int>(
    'company_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSystemRoleMeta = const VerificationMeta(
    'isSystemRole',
  );
  @override
  late final GeneratedColumn<bool> isSystemRole = GeneratedColumn<bool>(
    'is_system_role',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_system_role" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
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
    name,
    description,
    companyID,
    isSystemRole,
    isActive,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'roles';
  @override
  VerificationContext validateIntegrity(
    Insertable<RoleRecord> instance, {
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
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('company_i_d')) {
      context.handle(
        _companyIDMeta,
        companyID.isAcceptableOrUnknown(data['company_i_d']!, _companyIDMeta),
      );
    } else if (isInserting) {
      context.missing(_companyIDMeta);
    }
    if (data.containsKey('is_system_role')) {
      context.handle(
        _isSystemRoleMeta,
        isSystemRole.isAcceptableOrUnknown(
          data['is_system_role']!,
          _isSystemRoleMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
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
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoleRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoleRecord(
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
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      companyID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}company_i_d'],
      )!,
      isSystemRole: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_system_role'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $RolesTable createAlias(String alias) {
    return $RolesTable(attachedDatabase, alias);
  }
}

class RoleRecord extends DataClass implements Insertable<RoleRecord> {
  final bool isSynced;
  final DateTime? deletedAt;
  final String? syncAction;
  final int syncRetryCount;
  final String? syncError;
  final DateTime? lastSyncAttempt;
  final int id;
  final String uid;
  final String name;
  final String? description;
  final int companyID;
  final bool isSystemRole;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  const RoleRecord({
    required this.isSynced,
    this.deletedAt,
    this.syncAction,
    required this.syncRetryCount,
    this.syncError,
    this.lastSyncAttempt,
    required this.id,
    required this.uid,
    required this.name,
    this.description,
    required this.companyID,
    required this.isSystemRole,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
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
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['company_i_d'] = Variable<int>(companyID);
    map['is_system_role'] = Variable<bool>(isSystemRole);
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  RolesCompanion toCompanion(bool nullToAbsent) {
    return RolesCompanion(
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
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      companyID: Value(companyID),
      isSystemRole: Value(isSystemRole),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory RoleRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoleRecord(
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncAction: serializer.fromJson<String?>(json['syncAction']),
      syncRetryCount: serializer.fromJson<int>(json['syncRetryCount']),
      syncError: serializer.fromJson<String?>(json['syncError']),
      lastSyncAttempt: serializer.fromJson<DateTime?>(json['lastSyncAttempt']),
      id: serializer.fromJson<int>(json['id']),
      uid: serializer.fromJson<String>(json['uid']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      companyID: serializer.fromJson<int>(json['companyID']),
      isSystemRole: serializer.fromJson<bool>(json['isSystemRole']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
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
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'companyID': serializer.toJson<int>(companyID),
      'isSystemRole': serializer.toJson<bool>(isSystemRole),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  RoleRecord copyWith({
    bool? isSynced,
    Value<DateTime?> deletedAt = const Value.absent(),
    Value<String?> syncAction = const Value.absent(),
    int? syncRetryCount,
    Value<String?> syncError = const Value.absent(),
    Value<DateTime?> lastSyncAttempt = const Value.absent(),
    int? id,
    String? uid,
    String? name,
    Value<String?> description = const Value.absent(),
    int? companyID,
    bool? isSystemRole,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => RoleRecord(
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
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    companyID: companyID ?? this.companyID,
    isSystemRole: isSystemRole ?? this.isSystemRole,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  RoleRecord copyWithCompanion(RolesCompanion data) {
    return RoleRecord(
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
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      companyID: data.companyID.present ? data.companyID.value : this.companyID,
      isSystemRole: data.isSystemRole.present
          ? data.isSystemRole.value
          : this.isSystemRole,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoleRecord(')
          ..write('isSynced: $isSynced, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncAction: $syncAction, ')
          ..write('syncRetryCount: $syncRetryCount, ')
          ..write('syncError: $syncError, ')
          ..write('lastSyncAttempt: $lastSyncAttempt, ')
          ..write('id: $id, ')
          ..write('uid: $uid, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('companyID: $companyID, ')
          ..write('isSystemRole: $isSystemRole, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
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
    name,
    description,
    companyID,
    isSystemRole,
    isActive,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoleRecord &&
          other.isSynced == this.isSynced &&
          other.deletedAt == this.deletedAt &&
          other.syncAction == this.syncAction &&
          other.syncRetryCount == this.syncRetryCount &&
          other.syncError == this.syncError &&
          other.lastSyncAttempt == this.lastSyncAttempt &&
          other.id == this.id &&
          other.uid == this.uid &&
          other.name == this.name &&
          other.description == this.description &&
          other.companyID == this.companyID &&
          other.isSystemRole == this.isSystemRole &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class RolesCompanion extends UpdateCompanion<RoleRecord> {
  final Value<bool> isSynced;
  final Value<DateTime?> deletedAt;
  final Value<String?> syncAction;
  final Value<int> syncRetryCount;
  final Value<String?> syncError;
  final Value<DateTime?> lastSyncAttempt;
  final Value<int> id;
  final Value<String> uid;
  final Value<String> name;
  final Value<String?> description;
  final Value<int> companyID;
  final Value<bool> isSystemRole;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const RolesCompanion({
    this.isSynced = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncAction = const Value.absent(),
    this.syncRetryCount = const Value.absent(),
    this.syncError = const Value.absent(),
    this.lastSyncAttempt = const Value.absent(),
    this.id = const Value.absent(),
    this.uid = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.companyID = const Value.absent(),
    this.isSystemRole = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  RolesCompanion.insert({
    this.isSynced = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncAction = const Value.absent(),
    this.syncRetryCount = const Value.absent(),
    this.syncError = const Value.absent(),
    this.lastSyncAttempt = const Value.absent(),
    this.id = const Value.absent(),
    required String uid,
    required String name,
    this.description = const Value.absent(),
    required int companyID,
    this.isSystemRole = const Value.absent(),
    this.isActive = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : uid = Value(uid),
       name = Value(name),
       companyID = Value(companyID),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<RoleRecord> custom({
    Expression<bool>? isSynced,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncAction,
    Expression<int>? syncRetryCount,
    Expression<String>? syncError,
    Expression<DateTime>? lastSyncAttempt,
    Expression<int>? id,
    Expression<String>? uid,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? companyID,
    Expression<bool>? isSystemRole,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
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
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (companyID != null) 'company_i_d': companyID,
      if (isSystemRole != null) 'is_system_role': isSystemRole,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  RolesCompanion copyWith({
    Value<bool>? isSynced,
    Value<DateTime?>? deletedAt,
    Value<String?>? syncAction,
    Value<int>? syncRetryCount,
    Value<String?>? syncError,
    Value<DateTime?>? lastSyncAttempt,
    Value<int>? id,
    Value<String>? uid,
    Value<String>? name,
    Value<String?>? description,
    Value<int>? companyID,
    Value<bool>? isSystemRole,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return RolesCompanion(
      isSynced: isSynced ?? this.isSynced,
      deletedAt: deletedAt ?? this.deletedAt,
      syncAction: syncAction ?? this.syncAction,
      syncRetryCount: syncRetryCount ?? this.syncRetryCount,
      syncError: syncError ?? this.syncError,
      lastSyncAttempt: lastSyncAttempt ?? this.lastSyncAttempt,
      id: id ?? this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      description: description ?? this.description,
      companyID: companyID ?? this.companyID,
      isSystemRole: isSystemRole ?? this.isSystemRole,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
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
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (companyID.present) {
      map['company_i_d'] = Variable<int>(companyID.value);
    }
    if (isSystemRole.present) {
      map['is_system_role'] = Variable<bool>(isSystemRole.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RolesCompanion(')
          ..write('isSynced: $isSynced, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncAction: $syncAction, ')
          ..write('syncRetryCount: $syncRetryCount, ')
          ..write('syncError: $syncError, ')
          ..write('lastSyncAttempt: $lastSyncAttempt, ')
          ..write('id: $id, ')
          ..write('uid: $uid, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('companyID: $companyID, ')
          ..write('isSystemRole: $isSystemRole, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $PermissionsTable extends Permissions
    with TableInfo<$PermissionsTable, PermissionRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PermissionsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
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
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scopeMeta = const VerificationMeta('scope');
  @override
  late final GeneratedColumn<String> scope = GeneratedColumn<String>(
    'scope',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roleIDMeta = const VerificationMeta('roleID');
  @override
  late final GeneratedColumn<int> roleID = GeneratedColumn<int>(
    'role_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
    code,
    name,
    description,
    category,
    scope,
    roleID,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'permissions';
  @override
  VerificationContext validateIntegrity(
    Insertable<PermissionRecord> instance, {
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
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('scope')) {
      context.handle(
        _scopeMeta,
        scope.isAcceptableOrUnknown(data['scope']!, _scopeMeta),
      );
    } else if (isInserting) {
      context.missing(_scopeMeta);
    }
    if (data.containsKey('role_i_d')) {
      context.handle(
        _roleIDMeta,
        roleID.isAcceptableOrUnknown(data['role_i_d']!, _roleIDMeta),
      );
    } else if (isInserting) {
      context.missing(_roleIDMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PermissionRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PermissionRecord(
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
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      scope: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}scope'],
      )!,
      roleID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}role_i_d'],
      )!,
    );
  }

  @override
  $PermissionsTable createAlias(String alias) {
    return $PermissionsTable(attachedDatabase, alias);
  }
}

class PermissionRecord extends DataClass
    implements Insertable<PermissionRecord> {
  final bool isSynced;
  final DateTime? deletedAt;
  final String? syncAction;
  final int syncRetryCount;
  final String? syncError;
  final DateTime? lastSyncAttempt;
  final int id;
  final String uid;
  final String code;
  final String name;
  final String? description;
  final String category;
  final String scope;
  final int roleID;
  const PermissionRecord({
    required this.isSynced,
    this.deletedAt,
    this.syncAction,
    required this.syncRetryCount,
    this.syncError,
    this.lastSyncAttempt,
    required this.id,
    required this.uid,
    required this.code,
    required this.name,
    this.description,
    required this.category,
    required this.scope,
    required this.roleID,
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
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['category'] = Variable<String>(category);
    map['scope'] = Variable<String>(scope);
    map['role_i_d'] = Variable<int>(roleID);
    return map;
  }

  PermissionsCompanion toCompanion(bool nullToAbsent) {
    return PermissionsCompanion(
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
      code: Value(code),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      category: Value(category),
      scope: Value(scope),
      roleID: Value(roleID),
    );
  }

  factory PermissionRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PermissionRecord(
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncAction: serializer.fromJson<String?>(json['syncAction']),
      syncRetryCount: serializer.fromJson<int>(json['syncRetryCount']),
      syncError: serializer.fromJson<String?>(json['syncError']),
      lastSyncAttempt: serializer.fromJson<DateTime?>(json['lastSyncAttempt']),
      id: serializer.fromJson<int>(json['id']),
      uid: serializer.fromJson<String>(json['uid']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      category: serializer.fromJson<String>(json['category']),
      scope: serializer.fromJson<String>(json['scope']),
      roleID: serializer.fromJson<int>(json['roleID']),
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
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'category': serializer.toJson<String>(category),
      'scope': serializer.toJson<String>(scope),
      'roleID': serializer.toJson<int>(roleID),
    };
  }

  PermissionRecord copyWith({
    bool? isSynced,
    Value<DateTime?> deletedAt = const Value.absent(),
    Value<String?> syncAction = const Value.absent(),
    int? syncRetryCount,
    Value<String?> syncError = const Value.absent(),
    Value<DateTime?> lastSyncAttempt = const Value.absent(),
    int? id,
    String? uid,
    String? code,
    String? name,
    Value<String?> description = const Value.absent(),
    String? category,
    String? scope,
    int? roleID,
  }) => PermissionRecord(
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
    code: code ?? this.code,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    category: category ?? this.category,
    scope: scope ?? this.scope,
    roleID: roleID ?? this.roleID,
  );
  PermissionRecord copyWithCompanion(PermissionsCompanion data) {
    return PermissionRecord(
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
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      category: data.category.present ? data.category.value : this.category,
      scope: data.scope.present ? data.scope.value : this.scope,
      roleID: data.roleID.present ? data.roleID.value : this.roleID,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PermissionRecord(')
          ..write('isSynced: $isSynced, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncAction: $syncAction, ')
          ..write('syncRetryCount: $syncRetryCount, ')
          ..write('syncError: $syncError, ')
          ..write('lastSyncAttempt: $lastSyncAttempt, ')
          ..write('id: $id, ')
          ..write('uid: $uid, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('scope: $scope, ')
          ..write('roleID: $roleID')
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
    code,
    name,
    description,
    category,
    scope,
    roleID,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PermissionRecord &&
          other.isSynced == this.isSynced &&
          other.deletedAt == this.deletedAt &&
          other.syncAction == this.syncAction &&
          other.syncRetryCount == this.syncRetryCount &&
          other.syncError == this.syncError &&
          other.lastSyncAttempt == this.lastSyncAttempt &&
          other.id == this.id &&
          other.uid == this.uid &&
          other.code == this.code &&
          other.name == this.name &&
          other.description == this.description &&
          other.category == this.category &&
          other.scope == this.scope &&
          other.roleID == this.roleID);
}

class PermissionsCompanion extends UpdateCompanion<PermissionRecord> {
  final Value<bool> isSynced;
  final Value<DateTime?> deletedAt;
  final Value<String?> syncAction;
  final Value<int> syncRetryCount;
  final Value<String?> syncError;
  final Value<DateTime?> lastSyncAttempt;
  final Value<int> id;
  final Value<String> uid;
  final Value<String> code;
  final Value<String> name;
  final Value<String?> description;
  final Value<String> category;
  final Value<String> scope;
  final Value<int> roleID;
  const PermissionsCompanion({
    this.isSynced = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncAction = const Value.absent(),
    this.syncRetryCount = const Value.absent(),
    this.syncError = const Value.absent(),
    this.lastSyncAttempt = const Value.absent(),
    this.id = const Value.absent(),
    this.uid = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.category = const Value.absent(),
    this.scope = const Value.absent(),
    this.roleID = const Value.absent(),
  });
  PermissionsCompanion.insert({
    this.isSynced = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncAction = const Value.absent(),
    this.syncRetryCount = const Value.absent(),
    this.syncError = const Value.absent(),
    this.lastSyncAttempt = const Value.absent(),
    this.id = const Value.absent(),
    required String uid,
    required String code,
    required String name,
    this.description = const Value.absent(),
    required String category,
    required String scope,
    required int roleID,
  }) : uid = Value(uid),
       code = Value(code),
       name = Value(name),
       category = Value(category),
       scope = Value(scope),
       roleID = Value(roleID);
  static Insertable<PermissionRecord> custom({
    Expression<bool>? isSynced,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncAction,
    Expression<int>? syncRetryCount,
    Expression<String>? syncError,
    Expression<DateTime>? lastSyncAttempt,
    Expression<int>? id,
    Expression<String>? uid,
    Expression<String>? code,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? category,
    Expression<String>? scope,
    Expression<int>? roleID,
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
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (category != null) 'category': category,
      if (scope != null) 'scope': scope,
      if (roleID != null) 'role_i_d': roleID,
    });
  }

  PermissionsCompanion copyWith({
    Value<bool>? isSynced,
    Value<DateTime?>? deletedAt,
    Value<String?>? syncAction,
    Value<int>? syncRetryCount,
    Value<String?>? syncError,
    Value<DateTime?>? lastSyncAttempt,
    Value<int>? id,
    Value<String>? uid,
    Value<String>? code,
    Value<String>? name,
    Value<String?>? description,
    Value<String>? category,
    Value<String>? scope,
    Value<int>? roleID,
  }) {
    return PermissionsCompanion(
      isSynced: isSynced ?? this.isSynced,
      deletedAt: deletedAt ?? this.deletedAt,
      syncAction: syncAction ?? this.syncAction,
      syncRetryCount: syncRetryCount ?? this.syncRetryCount,
      syncError: syncError ?? this.syncError,
      lastSyncAttempt: lastSyncAttempt ?? this.lastSyncAttempt,
      id: id ?? this.id,
      uid: uid ?? this.uid,
      code: code ?? this.code,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      scope: scope ?? this.scope,
      roleID: roleID ?? this.roleID,
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
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (scope.present) {
      map['scope'] = Variable<String>(scope.value);
    }
    if (roleID.present) {
      map['role_i_d'] = Variable<int>(roleID.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PermissionsCompanion(')
          ..write('isSynced: $isSynced, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncAction: $syncAction, ')
          ..write('syncRetryCount: $syncRetryCount, ')
          ..write('syncError: $syncError, ')
          ..write('lastSyncAttempt: $lastSyncAttempt, ')
          ..write('id: $id, ')
          ..write('uid: $uid, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('scope: $scope, ')
          ..write('roleID: $roleID')
          ..write(')'))
        .toString();
  }
}

class $CompaniesTable extends Companies
    with TableInfo<$CompaniesTable, CompanyRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CompaniesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _regNoMeta = const VerificationMeta('regNo');
  @override
  late final GeneratedColumn<String> regNo = GeneratedColumn<String>(
    'reg_no',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cidbNoMeta = const VerificationMeta('cidbNo');
  @override
  late final GeneratedColumn<String> cidbNo = GeneratedColumn<String>(
    'cidb_no',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
  static const VerificationMeta _postalCodeMeta = const VerificationMeta(
    'postalCode',
  );
  @override
  late final GeneratedColumn<String> postalCode = GeneratedColumn<String>(
    'postal_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
    'city',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
    'state',
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
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
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
  static const VerificationMeta _websiteMeta = const VerificationMeta(
    'website',
  );
  @override
  late final GeneratedColumn<String> website = GeneratedColumn<String>(
    'website',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _companyTypeMeta = const VerificationMeta(
    'companyType',
  );
  @override
  late final GeneratedColumn<String> companyType = GeneratedColumn<String>(
    'company_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ownerIDMeta = const VerificationMeta(
    'ownerID',
  );
  @override
  late final GeneratedColumn<int> ownerID = GeneratedColumn<int>(
    'owner_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _defaultBankAccMeta = const VerificationMeta(
    'defaultBankAcc',
  );
  @override
  late final GeneratedColumn<String> defaultBankAcc = GeneratedColumn<String>(
    'default_bank_acc',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _defaultBankAccTypeMeta =
      const VerificationMeta('defaultBankAccType');
  @override
  late final GeneratedColumn<String> defaultBankAccType =
      GeneratedColumn<String>(
        'default_bank_acc_type',
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
    requiredDuringInsert: true,
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
  static const VerificationMeta _adminRoleUidMeta = const VerificationMeta(
    'adminRoleUid',
  );
  @override
  late final GeneratedColumn<String> adminRoleUid = GeneratedColumn<String>(
    'admin_role_uid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _adminRoleNameMeta = const VerificationMeta(
    'adminRoleName',
  );
  @override
  late final GeneratedColumn<String> adminRoleName = GeneratedColumn<String>(
    'admin_role_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bumiputeraMeta = const VerificationMeta(
    'bumiputera',
  );
  @override
  late final GeneratedColumn<bool> bumiputera = GeneratedColumn<bool>(
    'bumiputera',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("bumiputera" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _einvoiceTinNoMeta = const VerificationMeta(
    'einvoiceTinNo',
  );
  @override
  late final GeneratedColumn<String> einvoiceTinNo = GeneratedColumn<String>(
    'einvoice_tin_no',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _registrationDateMeta = const VerificationMeta(
    'registrationDate',
  );
  @override
  late final GeneratedColumn<DateTime> registrationDate =
      GeneratedColumn<DateTime>(
        'registration_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    uid,
    name,
    regNo,
    cidbNo,
    address,
    postalCode,
    city,
    state,
    country,
    phone,
    email,
    website,
    companyType,
    ownerID,
    defaultBankAcc,
    defaultBankAccType,
    createdAt,
    updatedAt,
    deletedAt,
    adminRoleUid,
    adminRoleName,
    bumiputera,
    einvoiceTinNo,
    registrationDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'companies';
  @override
  VerificationContext validateIntegrity(
    Insertable<CompanyRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
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
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('reg_no')) {
      context.handle(
        _regNoMeta,
        regNo.isAcceptableOrUnknown(data['reg_no']!, _regNoMeta),
      );
    }
    if (data.containsKey('cidb_no')) {
      context.handle(
        _cidbNoMeta,
        cidbNo.isAcceptableOrUnknown(data['cidb_no']!, _cidbNoMeta),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('postal_code')) {
      context.handle(
        _postalCodeMeta,
        postalCode.isAcceptableOrUnknown(data['postal_code']!, _postalCodeMeta),
      );
    }
    if (data.containsKey('city')) {
      context.handle(
        _cityMeta,
        city.isAcceptableOrUnknown(data['city']!, _cityMeta),
      );
    }
    if (data.containsKey('state')) {
      context.handle(
        _stateMeta,
        state.isAcceptableOrUnknown(data['state']!, _stateMeta),
      );
    }
    if (data.containsKey('country')) {
      context.handle(
        _countryMeta,
        country.isAcceptableOrUnknown(data['country']!, _countryMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('website')) {
      context.handle(
        _websiteMeta,
        website.isAcceptableOrUnknown(data['website']!, _websiteMeta),
      );
    }
    if (data.containsKey('company_type')) {
      context.handle(
        _companyTypeMeta,
        companyType.isAcceptableOrUnknown(
          data['company_type']!,
          _companyTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_companyTypeMeta);
    }
    if (data.containsKey('owner_i_d')) {
      context.handle(
        _ownerIDMeta,
        ownerID.isAcceptableOrUnknown(data['owner_i_d']!, _ownerIDMeta),
      );
    } else if (isInserting) {
      context.missing(_ownerIDMeta);
    }
    if (data.containsKey('default_bank_acc')) {
      context.handle(
        _defaultBankAccMeta,
        defaultBankAcc.isAcceptableOrUnknown(
          data['default_bank_acc']!,
          _defaultBankAccMeta,
        ),
      );
    }
    if (data.containsKey('default_bank_acc_type')) {
      context.handle(
        _defaultBankAccTypeMeta,
        defaultBankAccType.isAcceptableOrUnknown(
          data['default_bank_acc_type']!,
          _defaultBankAccTypeMeta,
        ),
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
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('admin_role_uid')) {
      context.handle(
        _adminRoleUidMeta,
        adminRoleUid.isAcceptableOrUnknown(
          data['admin_role_uid']!,
          _adminRoleUidMeta,
        ),
      );
    }
    if (data.containsKey('admin_role_name')) {
      context.handle(
        _adminRoleNameMeta,
        adminRoleName.isAcceptableOrUnknown(
          data['admin_role_name']!,
          _adminRoleNameMeta,
        ),
      );
    }
    if (data.containsKey('bumiputera')) {
      context.handle(
        _bumiputeraMeta,
        bumiputera.isAcceptableOrUnknown(data['bumiputera']!, _bumiputeraMeta),
      );
    }
    if (data.containsKey('einvoice_tin_no')) {
      context.handle(
        _einvoiceTinNoMeta,
        einvoiceTinNo.isAcceptableOrUnknown(
          data['einvoice_tin_no']!,
          _einvoiceTinNoMeta,
        ),
      );
    }
    if (data.containsKey('registration_date')) {
      context.handle(
        _registrationDateMeta,
        registrationDate.isAcceptableOrUnknown(
          data['registration_date']!,
          _registrationDateMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {uid},
  ];
  @override
  CompanyRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CompanyRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uid'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      regNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reg_no'],
      ),
      cidbNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cidb_no'],
      ),
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      postalCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}postal_code'],
      ),
      city: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city'],
      ),
      state: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}state'],
      ),
      country: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      website: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}website'],
      ),
      companyType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}company_type'],
      )!,
      ownerID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}owner_i_d'],
      )!,
      defaultBankAcc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}default_bank_acc'],
      ),
      defaultBankAccType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}default_bank_acc_type'],
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
      adminRoleUid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}admin_role_uid'],
      ),
      adminRoleName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}admin_role_name'],
      ),
      bumiputera: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}bumiputera'],
      )!,
      einvoiceTinNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}einvoice_tin_no'],
      ),
      registrationDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}registration_date'],
      ),
    );
  }

  @override
  $CompaniesTable createAlias(String alias) {
    return $CompaniesTable(attachedDatabase, alias);
  }
}

class CompanyRecord extends DataClass implements Insertable<CompanyRecord> {
  final int id;
  final String uid;
  final String name;
  final String? regNo;
  final String? cidbNo;
  final String? address;
  final String? postalCode;
  final String? city;
  final String? state;
  final String? country;
  final String? phone;
  final String? email;
  final String? website;
  final String companyType;
  final int ownerID;
  final String? defaultBankAcc;
  final String? defaultBankAccType;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String? adminRoleUid;
  final String? adminRoleName;
  final bool bumiputera;
  final String? einvoiceTinNo;
  final DateTime? registrationDate;
  const CompanyRecord({
    required this.id,
    required this.uid,
    required this.name,
    this.regNo,
    this.cidbNo,
    this.address,
    this.postalCode,
    this.city,
    this.state,
    this.country,
    this.phone,
    this.email,
    this.website,
    required this.companyType,
    required this.ownerID,
    this.defaultBankAcc,
    this.defaultBankAccType,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.adminRoleUid,
    this.adminRoleName,
    required this.bumiputera,
    this.einvoiceTinNo,
    this.registrationDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uid'] = Variable<String>(uid);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || regNo != null) {
      map['reg_no'] = Variable<String>(regNo);
    }
    if (!nullToAbsent || cidbNo != null) {
      map['cidb_no'] = Variable<String>(cidbNo);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || postalCode != null) {
      map['postal_code'] = Variable<String>(postalCode);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    if (!nullToAbsent || state != null) {
      map['state'] = Variable<String>(state);
    }
    if (!nullToAbsent || country != null) {
      map['country'] = Variable<String>(country);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || website != null) {
      map['website'] = Variable<String>(website);
    }
    map['company_type'] = Variable<String>(companyType);
    map['owner_i_d'] = Variable<int>(ownerID);
    if (!nullToAbsent || defaultBankAcc != null) {
      map['default_bank_acc'] = Variable<String>(defaultBankAcc);
    }
    if (!nullToAbsent || defaultBankAccType != null) {
      map['default_bank_acc_type'] = Variable<String>(defaultBankAccType);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    if (!nullToAbsent || adminRoleUid != null) {
      map['admin_role_uid'] = Variable<String>(adminRoleUid);
    }
    if (!nullToAbsent || adminRoleName != null) {
      map['admin_role_name'] = Variable<String>(adminRoleName);
    }
    map['bumiputera'] = Variable<bool>(bumiputera);
    if (!nullToAbsent || einvoiceTinNo != null) {
      map['einvoice_tin_no'] = Variable<String>(einvoiceTinNo);
    }
    if (!nullToAbsent || registrationDate != null) {
      map['registration_date'] = Variable<DateTime>(registrationDate);
    }
    return map;
  }

  CompaniesCompanion toCompanion(bool nullToAbsent) {
    return CompaniesCompanion(
      id: Value(id),
      uid: Value(uid),
      name: Value(name),
      regNo: regNo == null && nullToAbsent
          ? const Value.absent()
          : Value(regNo),
      cidbNo: cidbNo == null && nullToAbsent
          ? const Value.absent()
          : Value(cidbNo),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      postalCode: postalCode == null && nullToAbsent
          ? const Value.absent()
          : Value(postalCode),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      state: state == null && nullToAbsent
          ? const Value.absent()
          : Value(state),
      country: country == null && nullToAbsent
          ? const Value.absent()
          : Value(country),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      website: website == null && nullToAbsent
          ? const Value.absent()
          : Value(website),
      companyType: Value(companyType),
      ownerID: Value(ownerID),
      defaultBankAcc: defaultBankAcc == null && nullToAbsent
          ? const Value.absent()
          : Value(defaultBankAcc),
      defaultBankAccType: defaultBankAccType == null && nullToAbsent
          ? const Value.absent()
          : Value(defaultBankAccType),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      adminRoleUid: adminRoleUid == null && nullToAbsent
          ? const Value.absent()
          : Value(adminRoleUid),
      adminRoleName: adminRoleName == null && nullToAbsent
          ? const Value.absent()
          : Value(adminRoleName),
      bumiputera: Value(bumiputera),
      einvoiceTinNo: einvoiceTinNo == null && nullToAbsent
          ? const Value.absent()
          : Value(einvoiceTinNo),
      registrationDate: registrationDate == null && nullToAbsent
          ? const Value.absent()
          : Value(registrationDate),
    );
  }

  factory CompanyRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CompanyRecord(
      id: serializer.fromJson<int>(json['id']),
      uid: serializer.fromJson<String>(json['uid']),
      name: serializer.fromJson<String>(json['name']),
      regNo: serializer.fromJson<String?>(json['regNo']),
      cidbNo: serializer.fromJson<String?>(json['cidbNo']),
      address: serializer.fromJson<String?>(json['address']),
      postalCode: serializer.fromJson<String?>(json['postalCode']),
      city: serializer.fromJson<String?>(json['city']),
      state: serializer.fromJson<String?>(json['state']),
      country: serializer.fromJson<String?>(json['country']),
      phone: serializer.fromJson<String?>(json['phone']),
      email: serializer.fromJson<String?>(json['email']),
      website: serializer.fromJson<String?>(json['website']),
      companyType: serializer.fromJson<String>(json['companyType']),
      ownerID: serializer.fromJson<int>(json['ownerID']),
      defaultBankAcc: serializer.fromJson<String?>(json['defaultBankAcc']),
      defaultBankAccType: serializer.fromJson<String?>(
        json['defaultBankAccType'],
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      adminRoleUid: serializer.fromJson<String?>(json['adminRoleUid']),
      adminRoleName: serializer.fromJson<String?>(json['adminRoleName']),
      bumiputera: serializer.fromJson<bool>(json['bumiputera']),
      einvoiceTinNo: serializer.fromJson<String?>(json['einvoiceTinNo']),
      registrationDate: serializer.fromJson<DateTime?>(
        json['registrationDate'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uid': serializer.toJson<String>(uid),
      'name': serializer.toJson<String>(name),
      'regNo': serializer.toJson<String?>(regNo),
      'cidbNo': serializer.toJson<String?>(cidbNo),
      'address': serializer.toJson<String?>(address),
      'postalCode': serializer.toJson<String?>(postalCode),
      'city': serializer.toJson<String?>(city),
      'state': serializer.toJson<String?>(state),
      'country': serializer.toJson<String?>(country),
      'phone': serializer.toJson<String?>(phone),
      'email': serializer.toJson<String?>(email),
      'website': serializer.toJson<String?>(website),
      'companyType': serializer.toJson<String>(companyType),
      'ownerID': serializer.toJson<int>(ownerID),
      'defaultBankAcc': serializer.toJson<String?>(defaultBankAcc),
      'defaultBankAccType': serializer.toJson<String?>(defaultBankAccType),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'adminRoleUid': serializer.toJson<String?>(adminRoleUid),
      'adminRoleName': serializer.toJson<String?>(adminRoleName),
      'bumiputera': serializer.toJson<bool>(bumiputera),
      'einvoiceTinNo': serializer.toJson<String?>(einvoiceTinNo),
      'registrationDate': serializer.toJson<DateTime?>(registrationDate),
    };
  }

  CompanyRecord copyWith({
    int? id,
    String? uid,
    String? name,
    Value<String?> regNo = const Value.absent(),
    Value<String?> cidbNo = const Value.absent(),
    Value<String?> address = const Value.absent(),
    Value<String?> postalCode = const Value.absent(),
    Value<String?> city = const Value.absent(),
    Value<String?> state = const Value.absent(),
    Value<String?> country = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> email = const Value.absent(),
    Value<String?> website = const Value.absent(),
    String? companyType,
    int? ownerID,
    Value<String?> defaultBankAcc = const Value.absent(),
    Value<String?> defaultBankAccType = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    Value<String?> adminRoleUid = const Value.absent(),
    Value<String?> adminRoleName = const Value.absent(),
    bool? bumiputera,
    Value<String?> einvoiceTinNo = const Value.absent(),
    Value<DateTime?> registrationDate = const Value.absent(),
  }) => CompanyRecord(
    id: id ?? this.id,
    uid: uid ?? this.uid,
    name: name ?? this.name,
    regNo: regNo.present ? regNo.value : this.regNo,
    cidbNo: cidbNo.present ? cidbNo.value : this.cidbNo,
    address: address.present ? address.value : this.address,
    postalCode: postalCode.present ? postalCode.value : this.postalCode,
    city: city.present ? city.value : this.city,
    state: state.present ? state.value : this.state,
    country: country.present ? country.value : this.country,
    phone: phone.present ? phone.value : this.phone,
    email: email.present ? email.value : this.email,
    website: website.present ? website.value : this.website,
    companyType: companyType ?? this.companyType,
    ownerID: ownerID ?? this.ownerID,
    defaultBankAcc: defaultBankAcc.present
        ? defaultBankAcc.value
        : this.defaultBankAcc,
    defaultBankAccType: defaultBankAccType.present
        ? defaultBankAccType.value
        : this.defaultBankAccType,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    adminRoleUid: adminRoleUid.present ? adminRoleUid.value : this.adminRoleUid,
    adminRoleName: adminRoleName.present
        ? adminRoleName.value
        : this.adminRoleName,
    bumiputera: bumiputera ?? this.bumiputera,
    einvoiceTinNo: einvoiceTinNo.present
        ? einvoiceTinNo.value
        : this.einvoiceTinNo,
    registrationDate: registrationDate.present
        ? registrationDate.value
        : this.registrationDate,
  );
  CompanyRecord copyWithCompanion(CompaniesCompanion data) {
    return CompanyRecord(
      id: data.id.present ? data.id.value : this.id,
      uid: data.uid.present ? data.uid.value : this.uid,
      name: data.name.present ? data.name.value : this.name,
      regNo: data.regNo.present ? data.regNo.value : this.regNo,
      cidbNo: data.cidbNo.present ? data.cidbNo.value : this.cidbNo,
      address: data.address.present ? data.address.value : this.address,
      postalCode: data.postalCode.present
          ? data.postalCode.value
          : this.postalCode,
      city: data.city.present ? data.city.value : this.city,
      state: data.state.present ? data.state.value : this.state,
      country: data.country.present ? data.country.value : this.country,
      phone: data.phone.present ? data.phone.value : this.phone,
      email: data.email.present ? data.email.value : this.email,
      website: data.website.present ? data.website.value : this.website,
      companyType: data.companyType.present
          ? data.companyType.value
          : this.companyType,
      ownerID: data.ownerID.present ? data.ownerID.value : this.ownerID,
      defaultBankAcc: data.defaultBankAcc.present
          ? data.defaultBankAcc.value
          : this.defaultBankAcc,
      defaultBankAccType: data.defaultBankAccType.present
          ? data.defaultBankAccType.value
          : this.defaultBankAccType,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      adminRoleUid: data.adminRoleUid.present
          ? data.adminRoleUid.value
          : this.adminRoleUid,
      adminRoleName: data.adminRoleName.present
          ? data.adminRoleName.value
          : this.adminRoleName,
      bumiputera: data.bumiputera.present
          ? data.bumiputera.value
          : this.bumiputera,
      einvoiceTinNo: data.einvoiceTinNo.present
          ? data.einvoiceTinNo.value
          : this.einvoiceTinNo,
      registrationDate: data.registrationDate.present
          ? data.registrationDate.value
          : this.registrationDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CompanyRecord(')
          ..write('id: $id, ')
          ..write('uid: $uid, ')
          ..write('name: $name, ')
          ..write('regNo: $regNo, ')
          ..write('cidbNo: $cidbNo, ')
          ..write('address: $address, ')
          ..write('postalCode: $postalCode, ')
          ..write('city: $city, ')
          ..write('state: $state, ')
          ..write('country: $country, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('website: $website, ')
          ..write('companyType: $companyType, ')
          ..write('ownerID: $ownerID, ')
          ..write('defaultBankAcc: $defaultBankAcc, ')
          ..write('defaultBankAccType: $defaultBankAccType, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('adminRoleUid: $adminRoleUid, ')
          ..write('adminRoleName: $adminRoleName, ')
          ..write('bumiputera: $bumiputera, ')
          ..write('einvoiceTinNo: $einvoiceTinNo, ')
          ..write('registrationDate: $registrationDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    uid,
    name,
    regNo,
    cidbNo,
    address,
    postalCode,
    city,
    state,
    country,
    phone,
    email,
    website,
    companyType,
    ownerID,
    defaultBankAcc,
    defaultBankAccType,
    createdAt,
    updatedAt,
    deletedAt,
    adminRoleUid,
    adminRoleName,
    bumiputera,
    einvoiceTinNo,
    registrationDate,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CompanyRecord &&
          other.id == this.id &&
          other.uid == this.uid &&
          other.name == this.name &&
          other.regNo == this.regNo &&
          other.cidbNo == this.cidbNo &&
          other.address == this.address &&
          other.postalCode == this.postalCode &&
          other.city == this.city &&
          other.state == this.state &&
          other.country == this.country &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.website == this.website &&
          other.companyType == this.companyType &&
          other.ownerID == this.ownerID &&
          other.defaultBankAcc == this.defaultBankAcc &&
          other.defaultBankAccType == this.defaultBankAccType &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.adminRoleUid == this.adminRoleUid &&
          other.adminRoleName == this.adminRoleName &&
          other.bumiputera == this.bumiputera &&
          other.einvoiceTinNo == this.einvoiceTinNo &&
          other.registrationDate == this.registrationDate);
}

class CompaniesCompanion extends UpdateCompanion<CompanyRecord> {
  final Value<int> id;
  final Value<String> uid;
  final Value<String> name;
  final Value<String?> regNo;
  final Value<String?> cidbNo;
  final Value<String?> address;
  final Value<String?> postalCode;
  final Value<String?> city;
  final Value<String?> state;
  final Value<String?> country;
  final Value<String?> phone;
  final Value<String?> email;
  final Value<String?> website;
  final Value<String> companyType;
  final Value<int> ownerID;
  final Value<String?> defaultBankAcc;
  final Value<String?> defaultBankAccType;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String?> adminRoleUid;
  final Value<String?> adminRoleName;
  final Value<bool> bumiputera;
  final Value<String?> einvoiceTinNo;
  final Value<DateTime?> registrationDate;
  const CompaniesCompanion({
    this.id = const Value.absent(),
    this.uid = const Value.absent(),
    this.name = const Value.absent(),
    this.regNo = const Value.absent(),
    this.cidbNo = const Value.absent(),
    this.address = const Value.absent(),
    this.postalCode = const Value.absent(),
    this.city = const Value.absent(),
    this.state = const Value.absent(),
    this.country = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.website = const Value.absent(),
    this.companyType = const Value.absent(),
    this.ownerID = const Value.absent(),
    this.defaultBankAcc = const Value.absent(),
    this.defaultBankAccType = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.adminRoleUid = const Value.absent(),
    this.adminRoleName = const Value.absent(),
    this.bumiputera = const Value.absent(),
    this.einvoiceTinNo = const Value.absent(),
    this.registrationDate = const Value.absent(),
  });
  CompaniesCompanion.insert({
    this.id = const Value.absent(),
    required String uid,
    required String name,
    this.regNo = const Value.absent(),
    this.cidbNo = const Value.absent(),
    this.address = const Value.absent(),
    this.postalCode = const Value.absent(),
    this.city = const Value.absent(),
    this.state = const Value.absent(),
    this.country = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.website = const Value.absent(),
    required String companyType,
    required int ownerID,
    this.defaultBankAcc = const Value.absent(),
    this.defaultBankAccType = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.adminRoleUid = const Value.absent(),
    this.adminRoleName = const Value.absent(),
    this.bumiputera = const Value.absent(),
    this.einvoiceTinNo = const Value.absent(),
    this.registrationDate = const Value.absent(),
  }) : uid = Value(uid),
       name = Value(name),
       companyType = Value(companyType),
       ownerID = Value(ownerID),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<CompanyRecord> custom({
    Expression<int>? id,
    Expression<String>? uid,
    Expression<String>? name,
    Expression<String>? regNo,
    Expression<String>? cidbNo,
    Expression<String>? address,
    Expression<String>? postalCode,
    Expression<String>? city,
    Expression<String>? state,
    Expression<String>? country,
    Expression<String>? phone,
    Expression<String>? email,
    Expression<String>? website,
    Expression<String>? companyType,
    Expression<int>? ownerID,
    Expression<String>? defaultBankAcc,
    Expression<String>? defaultBankAccType,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? adminRoleUid,
    Expression<String>? adminRoleName,
    Expression<bool>? bumiputera,
    Expression<String>? einvoiceTinNo,
    Expression<DateTime>? registrationDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uid != null) 'uid': uid,
      if (name != null) 'name': name,
      if (regNo != null) 'reg_no': regNo,
      if (cidbNo != null) 'cidb_no': cidbNo,
      if (address != null) 'address': address,
      if (postalCode != null) 'postal_code': postalCode,
      if (city != null) 'city': city,
      if (state != null) 'state': state,
      if (country != null) 'country': country,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (website != null) 'website': website,
      if (companyType != null) 'company_type': companyType,
      if (ownerID != null) 'owner_i_d': ownerID,
      if (defaultBankAcc != null) 'default_bank_acc': defaultBankAcc,
      if (defaultBankAccType != null)
        'default_bank_acc_type': defaultBankAccType,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (adminRoleUid != null) 'admin_role_uid': adminRoleUid,
      if (adminRoleName != null) 'admin_role_name': adminRoleName,
      if (bumiputera != null) 'bumiputera': bumiputera,
      if (einvoiceTinNo != null) 'einvoice_tin_no': einvoiceTinNo,
      if (registrationDate != null) 'registration_date': registrationDate,
    });
  }

  CompaniesCompanion copyWith({
    Value<int>? id,
    Value<String>? uid,
    Value<String>? name,
    Value<String?>? regNo,
    Value<String?>? cidbNo,
    Value<String?>? address,
    Value<String?>? postalCode,
    Value<String?>? city,
    Value<String?>? state,
    Value<String?>? country,
    Value<String?>? phone,
    Value<String?>? email,
    Value<String?>? website,
    Value<String>? companyType,
    Value<int>? ownerID,
    Value<String?>? defaultBankAcc,
    Value<String?>? defaultBankAccType,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String?>? adminRoleUid,
    Value<String?>? adminRoleName,
    Value<bool>? bumiputera,
    Value<String?>? einvoiceTinNo,
    Value<DateTime?>? registrationDate,
  }) {
    return CompaniesCompanion(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      regNo: regNo ?? this.regNo,
      cidbNo: cidbNo ?? this.cidbNo,
      address: address ?? this.address,
      postalCode: postalCode ?? this.postalCode,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      website: website ?? this.website,
      companyType: companyType ?? this.companyType,
      ownerID: ownerID ?? this.ownerID,
      defaultBankAcc: defaultBankAcc ?? this.defaultBankAcc,
      defaultBankAccType: defaultBankAccType ?? this.defaultBankAccType,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      adminRoleUid: adminRoleUid ?? this.adminRoleUid,
      adminRoleName: adminRoleName ?? this.adminRoleName,
      bumiputera: bumiputera ?? this.bumiputera,
      einvoiceTinNo: einvoiceTinNo ?? this.einvoiceTinNo,
      registrationDate: registrationDate ?? this.registrationDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (regNo.present) {
      map['reg_no'] = Variable<String>(regNo.value);
    }
    if (cidbNo.present) {
      map['cidb_no'] = Variable<String>(cidbNo.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (postalCode.present) {
      map['postal_code'] = Variable<String>(postalCode.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (website.present) {
      map['website'] = Variable<String>(website.value);
    }
    if (companyType.present) {
      map['company_type'] = Variable<String>(companyType.value);
    }
    if (ownerID.present) {
      map['owner_i_d'] = Variable<int>(ownerID.value);
    }
    if (defaultBankAcc.present) {
      map['default_bank_acc'] = Variable<String>(defaultBankAcc.value);
    }
    if (defaultBankAccType.present) {
      map['default_bank_acc_type'] = Variable<String>(defaultBankAccType.value);
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
    if (adminRoleUid.present) {
      map['admin_role_uid'] = Variable<String>(adminRoleUid.value);
    }
    if (adminRoleName.present) {
      map['admin_role_name'] = Variable<String>(adminRoleName.value);
    }
    if (bumiputera.present) {
      map['bumiputera'] = Variable<bool>(bumiputera.value);
    }
    if (einvoiceTinNo.present) {
      map['einvoice_tin_no'] = Variable<String>(einvoiceTinNo.value);
    }
    if (registrationDate.present) {
      map['registration_date'] = Variable<DateTime>(registrationDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CompaniesCompanion(')
          ..write('id: $id, ')
          ..write('uid: $uid, ')
          ..write('name: $name, ')
          ..write('regNo: $regNo, ')
          ..write('cidbNo: $cidbNo, ')
          ..write('address: $address, ')
          ..write('postalCode: $postalCode, ')
          ..write('city: $city, ')
          ..write('state: $state, ')
          ..write('country: $country, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('website: $website, ')
          ..write('companyType: $companyType, ')
          ..write('ownerID: $ownerID, ')
          ..write('defaultBankAcc: $defaultBankAcc, ')
          ..write('defaultBankAccType: $defaultBankAccType, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('adminRoleUid: $adminRoleUid, ')
          ..write('adminRoleName: $adminRoleName, ')
          ..write('bumiputera: $bumiputera, ')
          ..write('einvoiceTinNo: $einvoiceTinNo, ')
          ..write('registrationDate: $registrationDate')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabase.connect(DatabaseConnection c) : super.connect(c);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AdminsTable admins = $AdminsTable(this);
  late final $SyncQueueTable syncQueue = $SyncQueueTable(this);
  late final $RolesTable roles = $RolesTable(this);
  late final $PermissionsTable permissions = $PermissionsTable(this);
  late final $CompaniesTable companies = $CompaniesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    admins,
    syncQueue,
    roles,
    permissions,
    companies,
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
typedef $$RolesTableCreateCompanionBuilder =
    RolesCompanion Function({
      Value<bool> isSynced,
      Value<DateTime?> deletedAt,
      Value<String?> syncAction,
      Value<int> syncRetryCount,
      Value<String?> syncError,
      Value<DateTime?> lastSyncAttempt,
      Value<int> id,
      required String uid,
      required String name,
      Value<String?> description,
      required int companyID,
      Value<bool> isSystemRole,
      Value<bool> isActive,
      required DateTime createdAt,
      required DateTime updatedAt,
    });
typedef $$RolesTableUpdateCompanionBuilder =
    RolesCompanion Function({
      Value<bool> isSynced,
      Value<DateTime?> deletedAt,
      Value<String?> syncAction,
      Value<int> syncRetryCount,
      Value<String?> syncError,
      Value<DateTime?> lastSyncAttempt,
      Value<int> id,
      Value<String> uid,
      Value<String> name,
      Value<String?> description,
      Value<int> companyID,
      Value<bool> isSystemRole,
      Value<bool> isActive,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$RolesTableFilterComposer extends Composer<_$AppDatabase, $RolesTable> {
  $$RolesTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get companyID => $composableBuilder(
    column: $table.companyID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSystemRole => $composableBuilder(
    column: $table.isSystemRole,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
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
}

class $$RolesTableOrderingComposer
    extends Composer<_$AppDatabase, $RolesTable> {
  $$RolesTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get companyID => $composableBuilder(
    column: $table.companyID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSystemRole => $composableBuilder(
    column: $table.isSystemRole,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
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
}

class $$RolesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RolesTable> {
  $$RolesTableAnnotationComposer({
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

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get companyID =>
      $composableBuilder(column: $table.companyID, builder: (column) => column);

  GeneratedColumn<bool> get isSystemRole => $composableBuilder(
    column: $table.isSystemRole,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$RolesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RolesTable,
          RoleRecord,
          $$RolesTableFilterComposer,
          $$RolesTableOrderingComposer,
          $$RolesTableAnnotationComposer,
          $$RolesTableCreateCompanionBuilder,
          $$RolesTableUpdateCompanionBuilder,
          (RoleRecord, BaseReferences<_$AppDatabase, $RolesTable, RoleRecord>),
          RoleRecord,
          PrefetchHooks Function()
        > {
  $$RolesTableTableManager(_$AppDatabase db, $RolesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RolesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RolesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RolesTableAnnotationComposer($db: db, $table: table),
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
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> companyID = const Value.absent(),
                Value<bool> isSystemRole = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => RolesCompanion(
                isSynced: isSynced,
                deletedAt: deletedAt,
                syncAction: syncAction,
                syncRetryCount: syncRetryCount,
                syncError: syncError,
                lastSyncAttempt: lastSyncAttempt,
                id: id,
                uid: uid,
                name: name,
                description: description,
                companyID: companyID,
                isSystemRole: isSystemRole,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
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
                required String name,
                Value<String?> description = const Value.absent(),
                required int companyID,
                Value<bool> isSystemRole = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
              }) => RolesCompanion.insert(
                isSynced: isSynced,
                deletedAt: deletedAt,
                syncAction: syncAction,
                syncRetryCount: syncRetryCount,
                syncError: syncError,
                lastSyncAttempt: lastSyncAttempt,
                id: id,
                uid: uid,
                name: name,
                description: description,
                companyID: companyID,
                isSystemRole: isSystemRole,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RolesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RolesTable,
      RoleRecord,
      $$RolesTableFilterComposer,
      $$RolesTableOrderingComposer,
      $$RolesTableAnnotationComposer,
      $$RolesTableCreateCompanionBuilder,
      $$RolesTableUpdateCompanionBuilder,
      (RoleRecord, BaseReferences<_$AppDatabase, $RolesTable, RoleRecord>),
      RoleRecord,
      PrefetchHooks Function()
    >;
typedef $$PermissionsTableCreateCompanionBuilder =
    PermissionsCompanion Function({
      Value<bool> isSynced,
      Value<DateTime?> deletedAt,
      Value<String?> syncAction,
      Value<int> syncRetryCount,
      Value<String?> syncError,
      Value<DateTime?> lastSyncAttempt,
      Value<int> id,
      required String uid,
      required String code,
      required String name,
      Value<String?> description,
      required String category,
      required String scope,
      required int roleID,
    });
typedef $$PermissionsTableUpdateCompanionBuilder =
    PermissionsCompanion Function({
      Value<bool> isSynced,
      Value<DateTime?> deletedAt,
      Value<String?> syncAction,
      Value<int> syncRetryCount,
      Value<String?> syncError,
      Value<DateTime?> lastSyncAttempt,
      Value<int> id,
      Value<String> uid,
      Value<String> code,
      Value<String> name,
      Value<String?> description,
      Value<String> category,
      Value<String> scope,
      Value<int> roleID,
    });

class $$PermissionsTableFilterComposer
    extends Composer<_$AppDatabase, $PermissionsTable> {
  $$PermissionsTableFilterComposer({
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

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get scope => $composableBuilder(
    column: $table.scope,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get roleID => $composableBuilder(
    column: $table.roleID,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PermissionsTableOrderingComposer
    extends Composer<_$AppDatabase, $PermissionsTable> {
  $$PermissionsTableOrderingComposer({
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

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get scope => $composableBuilder(
    column: $table.scope,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get roleID => $composableBuilder(
    column: $table.roleID,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PermissionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PermissionsTable> {
  $$PermissionsTableAnnotationComposer({
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

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get scope =>
      $composableBuilder(column: $table.scope, builder: (column) => column);

  GeneratedColumn<int> get roleID =>
      $composableBuilder(column: $table.roleID, builder: (column) => column);
}

class $$PermissionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PermissionsTable,
          PermissionRecord,
          $$PermissionsTableFilterComposer,
          $$PermissionsTableOrderingComposer,
          $$PermissionsTableAnnotationComposer,
          $$PermissionsTableCreateCompanionBuilder,
          $$PermissionsTableUpdateCompanionBuilder,
          (
            PermissionRecord,
            BaseReferences<_$AppDatabase, $PermissionsTable, PermissionRecord>,
          ),
          PermissionRecord,
          PrefetchHooks Function()
        > {
  $$PermissionsTableTableManager(_$AppDatabase db, $PermissionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PermissionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PermissionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PermissionsTableAnnotationComposer($db: db, $table: table),
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
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> scope = const Value.absent(),
                Value<int> roleID = const Value.absent(),
              }) => PermissionsCompanion(
                isSynced: isSynced,
                deletedAt: deletedAt,
                syncAction: syncAction,
                syncRetryCount: syncRetryCount,
                syncError: syncError,
                lastSyncAttempt: lastSyncAttempt,
                id: id,
                uid: uid,
                code: code,
                name: name,
                description: description,
                category: category,
                scope: scope,
                roleID: roleID,
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
                required String code,
                required String name,
                Value<String?> description = const Value.absent(),
                required String category,
                required String scope,
                required int roleID,
              }) => PermissionsCompanion.insert(
                isSynced: isSynced,
                deletedAt: deletedAt,
                syncAction: syncAction,
                syncRetryCount: syncRetryCount,
                syncError: syncError,
                lastSyncAttempt: lastSyncAttempt,
                id: id,
                uid: uid,
                code: code,
                name: name,
                description: description,
                category: category,
                scope: scope,
                roleID: roleID,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PermissionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PermissionsTable,
      PermissionRecord,
      $$PermissionsTableFilterComposer,
      $$PermissionsTableOrderingComposer,
      $$PermissionsTableAnnotationComposer,
      $$PermissionsTableCreateCompanionBuilder,
      $$PermissionsTableUpdateCompanionBuilder,
      (
        PermissionRecord,
        BaseReferences<_$AppDatabase, $PermissionsTable, PermissionRecord>,
      ),
      PermissionRecord,
      PrefetchHooks Function()
    >;
typedef $$CompaniesTableCreateCompanionBuilder =
    CompaniesCompanion Function({
      Value<int> id,
      required String uid,
      required String name,
      Value<String?> regNo,
      Value<String?> cidbNo,
      Value<String?> address,
      Value<String?> postalCode,
      Value<String?> city,
      Value<String?> state,
      Value<String?> country,
      Value<String?> phone,
      Value<String?> email,
      Value<String?> website,
      required String companyType,
      required int ownerID,
      Value<String?> defaultBankAcc,
      Value<String?> defaultBankAccType,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<String?> adminRoleUid,
      Value<String?> adminRoleName,
      Value<bool> bumiputera,
      Value<String?> einvoiceTinNo,
      Value<DateTime?> registrationDate,
    });
typedef $$CompaniesTableUpdateCompanionBuilder =
    CompaniesCompanion Function({
      Value<int> id,
      Value<String> uid,
      Value<String> name,
      Value<String?> regNo,
      Value<String?> cidbNo,
      Value<String?> address,
      Value<String?> postalCode,
      Value<String?> city,
      Value<String?> state,
      Value<String?> country,
      Value<String?> phone,
      Value<String?> email,
      Value<String?> website,
      Value<String> companyType,
      Value<int> ownerID,
      Value<String?> defaultBankAcc,
      Value<String?> defaultBankAccType,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String?> adminRoleUid,
      Value<String?> adminRoleName,
      Value<bool> bumiputera,
      Value<String?> einvoiceTinNo,
      Value<DateTime?> registrationDate,
    });

class $$CompaniesTableFilterComposer
    extends Composer<_$AppDatabase, $CompaniesTable> {
  $$CompaniesTableFilterComposer({
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

  ColumnFilters<String> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get regNo => $composableBuilder(
    column: $table.regNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cidbNo => $composableBuilder(
    column: $table.cidbNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get postalCode => $composableBuilder(
    column: $table.postalCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get website => $composableBuilder(
    column: $table.website,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get companyType => $composableBuilder(
    column: $table.companyType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ownerID => $composableBuilder(
    column: $table.ownerID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get defaultBankAcc => $composableBuilder(
    column: $table.defaultBankAcc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get defaultBankAccType => $composableBuilder(
    column: $table.defaultBankAccType,
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

  ColumnFilters<String> get adminRoleUid => $composableBuilder(
    column: $table.adminRoleUid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get adminRoleName => $composableBuilder(
    column: $table.adminRoleName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get bumiputera => $composableBuilder(
    column: $table.bumiputera,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get einvoiceTinNo => $composableBuilder(
    column: $table.einvoiceTinNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get registrationDate => $composableBuilder(
    column: $table.registrationDate,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CompaniesTableOrderingComposer
    extends Composer<_$AppDatabase, $CompaniesTable> {
  $$CompaniesTableOrderingComposer({
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

  ColumnOrderings<String> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get regNo => $composableBuilder(
    column: $table.regNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cidbNo => $composableBuilder(
    column: $table.cidbNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get postalCode => $composableBuilder(
    column: $table.postalCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get website => $composableBuilder(
    column: $table.website,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get companyType => $composableBuilder(
    column: $table.companyType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ownerID => $composableBuilder(
    column: $table.ownerID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get defaultBankAcc => $composableBuilder(
    column: $table.defaultBankAcc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get defaultBankAccType => $composableBuilder(
    column: $table.defaultBankAccType,
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

  ColumnOrderings<String> get adminRoleUid => $composableBuilder(
    column: $table.adminRoleUid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get adminRoleName => $composableBuilder(
    column: $table.adminRoleName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get bumiputera => $composableBuilder(
    column: $table.bumiputera,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get einvoiceTinNo => $composableBuilder(
    column: $table.einvoiceTinNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get registrationDate => $composableBuilder(
    column: $table.registrationDate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CompaniesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CompaniesTable> {
  $$CompaniesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get regNo =>
      $composableBuilder(column: $table.regNo, builder: (column) => column);

  GeneratedColumn<String> get cidbNo =>
      $composableBuilder(column: $table.cidbNo, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get postalCode => $composableBuilder(
    column: $table.postalCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  GeneratedColumn<String> get country =>
      $composableBuilder(column: $table.country, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get website =>
      $composableBuilder(column: $table.website, builder: (column) => column);

  GeneratedColumn<String> get companyType => $composableBuilder(
    column: $table.companyType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get ownerID =>
      $composableBuilder(column: $table.ownerID, builder: (column) => column);

  GeneratedColumn<String> get defaultBankAcc => $composableBuilder(
    column: $table.defaultBankAcc,
    builder: (column) => column,
  );

  GeneratedColumn<String> get defaultBankAccType => $composableBuilder(
    column: $table.defaultBankAccType,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get adminRoleUid => $composableBuilder(
    column: $table.adminRoleUid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get adminRoleName => $composableBuilder(
    column: $table.adminRoleName,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get bumiputera => $composableBuilder(
    column: $table.bumiputera,
    builder: (column) => column,
  );

  GeneratedColumn<String> get einvoiceTinNo => $composableBuilder(
    column: $table.einvoiceTinNo,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get registrationDate => $composableBuilder(
    column: $table.registrationDate,
    builder: (column) => column,
  );
}

class $$CompaniesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CompaniesTable,
          CompanyRecord,
          $$CompaniesTableFilterComposer,
          $$CompaniesTableOrderingComposer,
          $$CompaniesTableAnnotationComposer,
          $$CompaniesTableCreateCompanionBuilder,
          $$CompaniesTableUpdateCompanionBuilder,
          (
            CompanyRecord,
            BaseReferences<_$AppDatabase, $CompaniesTable, CompanyRecord>,
          ),
          CompanyRecord,
          PrefetchHooks Function()
        > {
  $$CompaniesTableTableManager(_$AppDatabase db, $CompaniesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CompaniesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CompaniesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CompaniesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> uid = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> regNo = const Value.absent(),
                Value<String?> cidbNo = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> postalCode = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<String?> state = const Value.absent(),
                Value<String?> country = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> website = const Value.absent(),
                Value<String> companyType = const Value.absent(),
                Value<int> ownerID = const Value.absent(),
                Value<String?> defaultBankAcc = const Value.absent(),
                Value<String?> defaultBankAccType = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> adminRoleUid = const Value.absent(),
                Value<String?> adminRoleName = const Value.absent(),
                Value<bool> bumiputera = const Value.absent(),
                Value<String?> einvoiceTinNo = const Value.absent(),
                Value<DateTime?> registrationDate = const Value.absent(),
              }) => CompaniesCompanion(
                id: id,
                uid: uid,
                name: name,
                regNo: regNo,
                cidbNo: cidbNo,
                address: address,
                postalCode: postalCode,
                city: city,
                state: state,
                country: country,
                phone: phone,
                email: email,
                website: website,
                companyType: companyType,
                ownerID: ownerID,
                defaultBankAcc: defaultBankAcc,
                defaultBankAccType: defaultBankAccType,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                adminRoleUid: adminRoleUid,
                adminRoleName: adminRoleName,
                bumiputera: bumiputera,
                einvoiceTinNo: einvoiceTinNo,
                registrationDate: registrationDate,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String uid,
                required String name,
                Value<String?> regNo = const Value.absent(),
                Value<String?> cidbNo = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> postalCode = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<String?> state = const Value.absent(),
                Value<String?> country = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> website = const Value.absent(),
                required String companyType,
                required int ownerID,
                Value<String?> defaultBankAcc = const Value.absent(),
                Value<String?> defaultBankAccType = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> adminRoleUid = const Value.absent(),
                Value<String?> adminRoleName = const Value.absent(),
                Value<bool> bumiputera = const Value.absent(),
                Value<String?> einvoiceTinNo = const Value.absent(),
                Value<DateTime?> registrationDate = const Value.absent(),
              }) => CompaniesCompanion.insert(
                id: id,
                uid: uid,
                name: name,
                regNo: regNo,
                cidbNo: cidbNo,
                address: address,
                postalCode: postalCode,
                city: city,
                state: state,
                country: country,
                phone: phone,
                email: email,
                website: website,
                companyType: companyType,
                ownerID: ownerID,
                defaultBankAcc: defaultBankAcc,
                defaultBankAccType: defaultBankAccType,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                adminRoleUid: adminRoleUid,
                adminRoleName: adminRoleName,
                bumiputera: bumiputera,
                einvoiceTinNo: einvoiceTinNo,
                registrationDate: registrationDate,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CompaniesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CompaniesTable,
      CompanyRecord,
      $$CompaniesTableFilterComposer,
      $$CompaniesTableOrderingComposer,
      $$CompaniesTableAnnotationComposer,
      $$CompaniesTableCreateCompanionBuilder,
      $$CompaniesTableUpdateCompanionBuilder,
      (
        CompanyRecord,
        BaseReferences<_$AppDatabase, $CompaniesTable, CompanyRecord>,
      ),
      CompanyRecord,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AdminsTableTableManager get admins =>
      $$AdminsTableTableManager(_db, _db.admins);
  $$SyncQueueTableTableManager get syncQueue =>
      $$SyncQueueTableTableManager(_db, _db.syncQueue);
  $$RolesTableTableManager get roles =>
      $$RolesTableTableManager(_db, _db.roles);
  $$PermissionsTableTableManager get permissions =>
      $$PermissionsTableTableManager(_db, _db.permissions);
  $$CompaniesTableTableManager get companies =>
      $$CompaniesTableTableManager(_db, _db.companies);
}
