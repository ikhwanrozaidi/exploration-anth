import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/entities/dropdown_option.dart';
import '../../domain/entities/quantity_field.dart';
import '../../domain/entities/scope_of_work.dart';
import '../../domain/entities/work_equipment.dart';
import '../../domain/entities/work_quantity_type.dart';

abstract class DailyReportCreationLocalDatasource {
  // Foundation
  Future<void> clearCache();

  // GET scope
  Future<List<ScopeOfWork>?> getCachedScopeOfWorks();
  Future<void> cacheScopeOfWorks(List<ScopeOfWork> scopeOfWorks);

  // GET equipments
  Future<List<WorkEquipment>?> getCachedWorkEquipments();
  Future<void> cacheWorkEquipments(List<WorkEquipment> equipments);

  // GET by id
  Future<ScopeOfWork?> getCachedScopeOfWorkById(int id);
  Future<ScopeOfWork?> getCachedScopeOfWorkByUid(String uid);
  Future<void> cacheScopeOfWork(ScopeOfWork scopeOfWork);
}

@LazySingleton(as: DailyReportCreationLocalDatasource)
class DailyReportCreationLocalDatasourceImpl
    implements DailyReportCreationLocalDatasource {
  final DatabaseService _databaseService;

  DailyReportCreationLocalDatasourceImpl(this._databaseService);

  AppDatabase get _database => _databaseService.database;

  // GET from database
  @override
  Future<List<ScopeOfWork>?> getCachedScopeOfWorks() async {
    try {
      final scopeRecords = await _database.select(_database.workScopes).get();

      if (scopeRecords.isEmpty) {
        return null;
      }

      // Convert database records to domain entities
      final List<ScopeOfWork> scopeOfWorks = [];

      for (final record in scopeRecords) {
        final workQuantityTypes = await _getWorkQuantityTypesByScopeId(
          record.id,
        );
        final workEquipments = await _getWorkEquipmentsByScopeId(record.id);

        scopeOfWorks.add(
          ScopeOfWork(
            id: record.id,
            uid: record.uid,
            name: record.name,
            code: record.code,
            description: record.description,
            allowMultipleQuantities: record.allowMultipleQuantities,
            createdAt: record.createdAt,
            updatedAt: record.updatedAt,
            deletedAt: record.deletedAt,
            companyID: record.companyID,
            workQuantityTypes: workQuantityTypes,
            workEquipments: workEquipments,
          ),
        );
      }

      return scopeOfWorks.isEmpty ? null : scopeOfWorks;
    } catch (e) {
      print('Error loading cached scope of works: $e');
      return null;
    }
  }

  // Delete and insert new one
  @override
  Future<void> cacheScopeOfWorks(List<ScopeOfWork> scopeOfWorks) async {
    try {
      await _database.transaction(() async {
        // Clear existing data
        await _database.delete(_database.workQuantityFieldOptions).go();
        await _database.delete(_database.workQuantityFields).go();
        await _database.delete(_database.workQuantityTypes).go();
        await _database.delete(_database.workScopeEquipment).go();
        await _database.delete(_database.workScopeEquipments).go();
        await _database.delete(_database.workScopes).go();

        // Insert new data
        for (final scopeOfWork in scopeOfWorks) {
          await _insertScopeOfWorkWithRelations(scopeOfWork);
        }
      });
    } catch (e) {
      print('Error caching scope of works: $e');
    }
  }

  // GET scope of work by id
  @override
  Future<ScopeOfWork?> getCachedScopeOfWorkById(int id) async {
    try {
      final scopeRecord = await (_database.select(
        _database.workScopes,
      )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

      if (scopeRecord == null) return null;

      final workQuantityTypes = await _getWorkQuantityTypesByScopeId(
        scopeRecord.id,
      );
      final workEquipments = await _getWorkEquipmentsByScopeId(scopeRecord.id);

      return ScopeOfWork(
        id: scopeRecord.id,
        uid: scopeRecord.uid,
        name: scopeRecord.name,
        code: scopeRecord.code,
        description: scopeRecord.description,
        allowMultipleQuantities: scopeRecord.allowMultipleQuantities,
        createdAt: scopeRecord.createdAt,
        updatedAt: scopeRecord.updatedAt,
        deletedAt: scopeRecord.deletedAt,
        companyID: scopeRecord.companyID,
        workQuantityTypes: workQuantityTypes,
        workEquipments: workEquipments,
      );
    } catch (e) {
      print('Error loading cached scope of work by id: $e');
      return null;
    }
  }

  // GET scope of work by uid (may not need this)
  @override
  Future<ScopeOfWork?> getCachedScopeOfWorkByUid(String uid) async {
    try {
      final scopeRecord = await (_database.select(
        _database.workScopes,
      )..where((tbl) => tbl.uid.equals(uid))).getSingleOrNull();

      if (scopeRecord == null) return null;

      final workQuantityTypes = await _getWorkQuantityTypesByScopeId(
        scopeRecord.id,
      );
      final workEquipments = await _getWorkEquipmentsByScopeId(scopeRecord.id);

      return ScopeOfWork(
        id: scopeRecord.id,
        uid: scopeRecord.uid,
        name: scopeRecord.name,
        code: scopeRecord.code,
        description: scopeRecord.description,
        allowMultipleQuantities: scopeRecord.allowMultipleQuantities,
        createdAt: scopeRecord.createdAt,
        updatedAt: scopeRecord.updatedAt,
        deletedAt: scopeRecord.deletedAt,
        companyID: scopeRecord.companyID,
        workQuantityTypes: workQuantityTypes,
        workEquipments: workEquipments,
      );
    } catch (e) {
      print('Error loading cached scope of work by uid: $e');
      return null;
    }
  }

  @override
  Future<void> cacheScopeOfWork(ScopeOfWork scopeOfWork) async {
    try {
      await _database.transaction(() async {
        await _insertScopeOfWorkWithRelations(scopeOfWork);
      });
    } catch (e) {
      print('Error caching scope of work: $e');
    }
  }

  // Delete all related in Scope of Work
  @override
  Future<void> clearCache() async {
    try {
      await _database.transaction(() async {
        // Delete in proper order (foreign key constraints)
        await _database.delete(_database.workQuantityFieldOptions).go();
        await _database.delete(_database.workQuantityFields).go();
        await _database.delete(_database.workQuantityTypes).go();
        await _database.delete(_database.workScopeEquipment).go();
        await _database.delete(_database.workScopeEquipments).go();
        await _database.delete(_database.workScopes).go();
      });
    } catch (e) {
      print('Error clearing scope of work cache: $e');
    }
  }

  // GET local database work equipment
  @override
  Future<List<WorkEquipment>?> getCachedWorkEquipments() async {
    try {
      final equipmentRecords = await _database
          .select(_database.workScopeEquipments)
          .get();

      if (equipmentRecords.isEmpty) {
        return null;
      }

      final equipments = equipmentRecords
          .map(
            (record) => WorkEquipment(
              id: record.id,
              uid: record.uid,
              name: record.name,
              code: record.code,
            ),
          )
          .toList();

      return equipments.isEmpty ? null : equipments;
    } catch (e) {
      print('Error loading cached work equipments: $e');
      return null;
    }
  }

  // INSERT local database work equipment
  @override
  Future<void> cacheWorkEquipments(List<WorkEquipment> equipments) async {
    try {
      for (final equipment in equipments) {
        await _database
            .into(_database.workScopeEquipments)
            .insertOnConflictUpdate(
              WorkScopeEquipmentsCompanion(
                id: Value(equipment.id),
                uid: Value(equipment.uid),
                name: Value(equipment.name),
                code: Value(equipment.code),
                isSynced: const Value(true),
              ),
            );
      }
    } catch (e) {
      print('Error caching work equipments: $e');
    }
  }

  // Private helper methods

  Future<void> _insertScopeOfWorkWithRelations(ScopeOfWork scopeOfWork) async {
    // 1. Insert/Update main ScopeOfWork
    await _database
        .into(_database.workScopes)
        .insertOnConflictUpdate(
          WorkScopesCompanion(
            id: Value(scopeOfWork.id),
            uid: Value(scopeOfWork.uid),
            name: Value(scopeOfWork.name),
            code: Value(scopeOfWork.code),
            description: Value(scopeOfWork.description),
            allowMultipleQuantities: Value(scopeOfWork.allowMultipleQuantities),
            createdAt: Value(scopeOfWork.createdAt),
            updatedAt: Value(scopeOfWork.updatedAt),
            deletedAt: Value(scopeOfWork.deletedAt),
            companyID: Value(scopeOfWork.companyID),
            isSynced: const Value(true),
          ),
        );

    // 2. Insert WorkQuantityTypes and their relations
    for (final quantityType in scopeOfWork.workQuantityTypes) {
      await _insertWorkQuantityTypeWithRelations(quantityType, scopeOfWork.id);
    }

    // 3. Insert WorkEquipments and their relations
    await _insertWorkEquipmentsWithRelations(
      scopeOfWork.workEquipments,
      scopeOfWork.id,
    );
  }

  Future<void> _insertWorkQuantityTypeWithRelations(
    WorkQuantityType quantityType,
    int scopeOfWorkId,
  ) async {
    // Insert/Update WorkQuantityType
    await _database
        .into(_database.workQuantityTypes)
        .insertOnConflictUpdate(
          WorkQuantityTypesCompanion(
            id: Value(quantityType.id),
            uid: Value(quantityType.uid),
            name: Value(quantityType.name),
            code: Value(quantityType.code),
            displayOrder: Value(quantityType.displayOrder),
            hasSegmentBreakdown: Value(quantityType.hasSegmentBreakdown),
            segmentSize: Value(quantityType.segmentSize),
            maxSegmentLength: Value(quantityType.maxSegmentLength),
            workScopeID: Value(scopeOfWorkId),
            isSynced: const Value(true),
          ),
        );

    // Insert QuantityFields and their relations
    for (final field in quantityType.quantityFields) {
      await _insertQuantityFieldWithRelations(field, quantityType.id);
    }
  }

  Future<void> _insertQuantityFieldWithRelations(
    QuantityField field,
    int workQuantityTypeId,
  ) async {
    // Insert/Update QuantityField
    await _database
        .into(_database.workQuantityFields)
        .insertOnConflictUpdate(
          WorkQuantityFieldsCompanion(
            id: Value(field.id),
            uid: Value(field.uid),
            name: Value(field.name),
            code: Value(field.code),
            fieldType: Value(field.fieldType),
            unit: Value(field.unit),
            validationRules: Value(field.validationRules),
            displayOrder: Value(field.displayOrder),
            isRequired: Value(field.isRequired),
            isForSegment: Value(field.isForSegment),
            defaultValue: Value(field.defaultValue),
            placeholder: Value(field.placeholder),
            helpText: Value(field.helpText),
            quantityTypeID: Value(workQuantityTypeId),
            isSynced: const Value(true),
          ),
        );

    // Insert DropdownOptions
    for (final option in field.dropdownOptions) {
      await _database
          .into(_database.workQuantityFieldOptions)
          .insertOnConflictUpdate(
            WorkQuantityFieldOptionsCompanion(
              id: Value(option.id),
              uid: Value(option.uid),
              value: Value(option.value),
              displayOrder: Value(option.displayOrder),
              fieldID: Value(field.id),
              isSynced: const Value(true),
            ),
          );
    }
  }

  Future<void> _insertWorkEquipmentsWithRelations(
    List<WorkEquipment> equipments,
    int scopeOfWorkId,
  ) async {
    // Remove existing relationships for this scope of work
    await (_database.delete(
      _database.workScopeEquipment,
    )..where((tbl) => tbl.workScopeID.equals(scopeOfWorkId))).go();

    for (final equipment in equipments) {
      // Insert/Update WorkEquipment
      await _database
          .into(_database.workScopeEquipments)
          .insertOnConflictUpdate(
            WorkScopeEquipmentsCompanion(
              id: Value(equipment.id),
              uid: Value(equipment.uid),
              name: Value(equipment.name),
              code: Value(equipment.code),
              isSynced: const Value(true),
            ),
          );

      // Create relationship
      await _database
          .into(_database.workScopeEquipment)
          .insertOnConflictUpdate(
            WorkScopeEquipmentCompanion(
              workScopeID: Value(scopeOfWorkId),
              workEquipmentID: Value(equipment.id),
              isSynced: const Value(true),
            ),
          );
    }
  }

  Future<List<WorkQuantityType>> _getWorkQuantityTypesByScopeId(
    int scopeOfWorkId,
  ) async {
    final quantityTypeRecords =
        await (_database.select(_database.workQuantityTypes)
              ..where((tbl) => tbl.workScopeID.equals(scopeOfWorkId))
              ..orderBy([(t) => OrderingTerm.asc(t.displayOrder)]))
            .get();

    final List<WorkQuantityType> quantityTypes = [];

    for (final record in quantityTypeRecords) {
      final quantityFields = await _getQuantityFieldsByTypeId(record.id);

      quantityTypes.add(
        WorkQuantityType(
          id: record.id,
          uid: record.uid,
          name: record.name,
          code: record.code,
          displayOrder: record.displayOrder,
          hasSegmentBreakdown: record.hasSegmentBreakdown,
          segmentSize: record.segmentSize,
          maxSegmentLength: record.maxSegmentLength,
          quantityFields: quantityFields,
        ),
      );
    }

    return quantityTypes;
  }

  Future<List<QuantityField>> _getQuantityFieldsByTypeId(
    int workQuantityTypeId,
  ) async {
    final fieldRecords =
        await (_database.select(_database.workQuantityFields)
              ..where(
                (tbl) => tbl.quantityTypeID.equals(workQuantityTypeId),
              )
              ..orderBy([(t) => OrderingTerm.asc(t.displayOrder)]))
            .get();

    final List<QuantityField> fields = [];

    for (final record in fieldRecords) {
      final dropdownOptions = await _getDropdownOptionsByFieldId(record.id);

      fields.add(
        QuantityField(
          id: record.id,
          uid: record.uid,
          name: record.name,
          code: record.code,
          fieldType: record.fieldType,
          unit: record.unit,
          validationRules: record.validationRules,
          displayOrder: record.displayOrder,
          isRequired: record.isRequired,
          isForSegment: record.isForSegment,
          defaultValue: record.defaultValue,
          placeholder: record.placeholder,
          helpText: record.helpText,
          dropdownOptions: dropdownOptions,
        ),
      );
    }

    return fields;
  }

  Future<List<DropdownOption>> _getDropdownOptionsByFieldId(
    int quantityFieldId,
  ) async {
    final optionRecords =
        await (_database.select(_database.workQuantityFieldOptions)
              ..where((tbl) => tbl.fieldID.equals(quantityFieldId))
              ..orderBy([(t) => OrderingTerm.asc(t.displayOrder)]))
            .get();

    return optionRecords
        .map(
          (record) => DropdownOption(
            id: record.id,
            uid: record.uid,
            value: record.value,
            displayOrder: record.displayOrder,
          ),
        )
        .toList();
  }

  Future<List<WorkEquipment>> _getWorkEquipmentsByScopeId(
    int scopeOfWorkId,
  ) async {
    final query =
        _database.select(_database.workScopeEquipments).join([
          innerJoin(
            _database.workScopeEquipment,
            _database.workScopeEquipment.workEquipmentID.equalsExp(
              _database.workScopeEquipments.id,
            ),
          ),
        ])..where(
          _database.workScopeEquipment.workScopeID.equals(scopeOfWorkId),
        );

    final results = await query.get();

    return results.map((row) {
      final equipment = row.readTable(_database.workScopeEquipments);
      return WorkEquipment(
        id: equipment.id,
        uid: equipment.uid,
        name: equipment.name,
        code: equipment.code,
      );
    }).toList();
  }
}
