import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:rclink_app/features/work_scope/data/models/dropdown_option_model.dart';
import 'package:rclink_app/features/work_scope/data/models/quantity_field_model.dart';
import '../../../../core/database/app_database.dart';
import '../models/work_scope_model.dart';
import '../models/work_equipment_model.dart';
import '../models/work_quantity_type_model.dart';

abstract class WorkScopeLocalDataSource {
  // Cache clearing
  Future<void> clearCache();
  Future<void> clearQuantitiesCache();
  Future<void> clearEquipmentsCache();

  // Scope of work caching
  Future<List<WorkScopeModel>?> getCachedScopeOfWorks();
  Future<List<WorkScopeModel>> getCachedWorkScopeModels();
  Future<void> cacheWorkScopeModels(List<WorkScopeModel> models);

  // Work equipment caching
  Future<List<WorkEquipmentModel>?> getCachedWorkEquipments();
  Future<void> cacheWorkEquipments(List<WorkEquipmentModel> equipments);

  // Quantity caching
  Future<List<WorkQuantityTypeModel>?> getCachedQuantities({
    required String companyUID,
    required String workScopeUID,
  });
  Future<void> cacheQuantities(
    List<WorkQuantityTypeModel> models, {
    required String companyUID,
    required String workScopeUID,
  });

  // Equipment caching
  Future<List<WorkEquipmentModel>?> getCachedEquipments({
    required String companyUID,
    required String workScopeUID,
  });
  Future<void> cacheEquipments(
    List<WorkEquipmentModel> models, {
    required String companyUID,
    required String workScopeUID,
  });
}

@LazySingleton(as: WorkScopeLocalDataSource)
class WorkScopeLocalDataSourceImpl implements WorkScopeLocalDataSource {
  final DatabaseService _databaseService;

  WorkScopeLocalDataSourceImpl(this._databaseService);

  AppDatabase get _database => _databaseService.database;

  /*
  // Scope of work datasource
  */

  @override
  Future<List<WorkScopeModel>?> getCachedScopeOfWorks() async {
    try {
      final scopeRecords = await _database.select(_database.workScopes).get();

      if (scopeRecords.isEmpty) {
        return null;
      }

      // Convert database records to domain entities
      final List<WorkScopeModel> scopeOfWorks = [];

      for (final record in scopeRecords) {
        final workQuantityTypes = await _getWorkQuantityTypesByScopeId(
          record.id,
        );
        final workEquipments = await _getWorkEquipmentsByScopeId(record.id);

        scopeOfWorks.add(
          WorkScopeModel(
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

  @override
  Future<void> cacheWorkScopeModels(List<WorkScopeModel> workScopes) async {
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
        for (final workScope in workScopes) {
          await _insertScopeOfWorkWithRelations(workScope);
        }
      });
    } catch (e) {
      print('Error caching scope of works: $e');
    }
  }

  @override
  Future<List<WorkScopeModel>> getCachedWorkScopeModels() async {
    final entities = await getCachedScopeOfWorks();
    if (entities == null) return [];

    return entities;
  }

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

  @override
  Future<List<WorkEquipmentModel>?> getCachedWorkEquipments() async {
    try {
      final equipmentRecords = await _database
          .select(_database.workScopeEquipments)
          .get();

      if (equipmentRecords.isEmpty) {
        return null;
      }

      final equipments = equipmentRecords
          .map(
            (record) => WorkEquipmentModel(
              id: record.id,
              uid: record.uid,
              name: record.name,
              code: record.code,
            ),
          )
          .toList();

      return equipments;
    } catch (e) {
      print('Error loading cached work equipments: $e');
      return null;
    }
  }

  @override
  Future<void> cacheWorkEquipments(List<WorkEquipmentModel> equipments) async {
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

  /* 
  // Private helper methods
  */

  Future<void> _insertScopeOfWorkWithRelations(
    WorkScopeModel workScopeModel,
  ) async {
    // 1. Insert WorkScopeModel
    await _database
        .into(_database.workScopes)
        .insertOnConflictUpdate(
          WorkScopesCompanion(
            id: Value(workScopeModel.id),
            uid: Value(workScopeModel.uid),
            name: Value(workScopeModel.name),
            code: Value(workScopeModel.code),
            description: Value(workScopeModel.description),
            allowMultipleQuantities: Value(
              workScopeModel.allowMultipleQuantities,
            ),
            createdAt: Value(workScopeModel.createdAt),
            updatedAt: Value(workScopeModel.updatedAt),
            deletedAt: Value(workScopeModel.deletedAt),
            companyID: Value(workScopeModel.companyID),
            isSynced: const Value(true),
          ),
        );

    // 2. Insert WorkQuantityTypes with relations
    await _insertWorkQuantityTypesWithRelations(
      workScopeModel.workQuantityTypes,
      workScopeModel.id,
    );

    // 3. Insert WorkEquipments with relations
    await _insertWorkEquipmentsWithRelations(
      workScopeModel.workEquipments,
      workScopeModel.id,
    );
  }

  Future<void> _insertWorkQuantityTypesWithRelations(
    List<WorkQuantityTypeModel> quantityTypes,
    int scopeOfWorkId,
  ) async {
    for (final quantityType in quantityTypes) {
      // Insert WorkQuantityType
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

      // Insert QuantityFields
      await _insertQuantityFieldsWithRelations(
        quantityType.quantityFields,
        quantityType.id,
      );
    }
  }

  Future<void> _insertQuantityFieldsWithRelations(
    List<QuantityFieldModel> fields,
    int workQuantityTypeId,
  ) async {
    for (final field in fields) {
      // Insert QuantityField
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
  }

  Future<void> _insertWorkEquipmentsWithRelations(
    List<WorkEquipmentModel> equipments,
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

  Future<List<WorkQuantityTypeModel>> _getWorkQuantityTypesByScopeId(
    int scopeOfWorkId,
  ) async {
    final quantityTypeRecords =
        await (_database.select(_database.workQuantityTypes)
              ..where((tbl) => tbl.workScopeID.equals(scopeOfWorkId))
              ..orderBy([(t) => OrderingTerm.asc(t.displayOrder)]))
            .get();

    final List<WorkQuantityTypeModel> quantityTypes = [];

    for (final record in quantityTypeRecords) {
      final quantityFields = await _getQuantityFieldsByTypeId(record.id);

      quantityTypes.add(
        WorkQuantityTypeModel(
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

  Future<List<QuantityFieldModel>> _getQuantityFieldsByTypeId(
    int workQuantityTypeId,
  ) async {
    final fieldRecords =
        await (_database.select(_database.workQuantityFields)
              ..where((tbl) => tbl.quantityTypeID.equals(workQuantityTypeId))
              ..orderBy([(t) => OrderingTerm.asc(t.displayOrder)]))
            .get();

    final List<QuantityFieldModel> fields = [];

    for (final record in fieldRecords) {
      final dropdownOptions = await _getDropdownOptionsByFieldId(record.id);

      fields.add(
        QuantityFieldModel(
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

  Future<List<DropdownOptionModel>> _getDropdownOptionsByFieldId(
    int quantityFieldId,
  ) async {
    final optionRecords =
        await (_database.select(_database.workQuantityFieldOptions)
              ..where((tbl) => tbl.fieldID.equals(quantityFieldId))
              ..orderBy([(t) => OrderingTerm.asc(t.displayOrder)]))
            .get();

    return optionRecords
        .map(
          (record) => DropdownOptionModel(
            id: record.id,
            uid: record.uid,
            value: record.value,
            displayOrder: record.displayOrder,
          ),
        )
        .toList();
  }

  Future<List<WorkEquipmentModel>> _getWorkEquipmentsByScopeId(
    int scopeOfWorkId,
  ) async {
    final query = _database.select(_database.workScopeEquipments).join([
      innerJoin(
        _database.workScopeEquipment,
        _database.workScopeEquipment.workEquipmentID.equalsExp(
          _database.workScopeEquipments.id,
        ),
      ),
    ])..where(_database.workScopeEquipment.workScopeID.equals(scopeOfWorkId));

    final results = await query.get();

    return results.map((row) {
      final equipment = row.readTable(_database.workScopeEquipments);
      return WorkEquipmentModel(
        id: equipment.id,
        uid: equipment.uid,
        name: equipment.name,
        code: equipment.code,
      );
    }).toList();
  }
  /* 
  // Quantity datasource
  */

  @override
  Future<List<WorkQuantityTypeModel>?> getCachedQuantities({
    required String companyUID,
    required String workScopeUID,
  }) async {
    try {
      // Find the work scope first
      final scopeRecords = await (_database.select(
        _database.workScopes,
      )..where((tbl) => tbl.uid.equals(workScopeUID))).get();

      if (scopeRecords.isEmpty) {
        return null;
      }

      final scopeRecord = scopeRecords.first;

      // Get quantity types for this scope
      final quantityTypes = await _getWorkQuantityTypesByScopeId(
        scopeRecord.id,
      );

      return quantityTypes.isEmpty ? null : quantityTypes;
    } catch (e) {
      print('Error loading cached quantities: $e');
      return null;
    }
  }

  @override
  Future<void> cacheQuantities(
    List<WorkQuantityTypeModel> quantities, {
    required String companyUID,
    required String workScopeUID,
  }) async {
    try {
      await _database.transaction(() async {
        // Find the work scope
        final scopeRecords = await (_database.select(
          _database.workScopes,
        )..where((tbl) => tbl.uid.equals(workScopeUID))).get();

        if (scopeRecords.isEmpty) {
          throw Exception('Work scope not found: $workScopeUID');
        }

        final scopeId = scopeRecords.first.id;

        // Get all quantity type IDs for this scope to delete related data
        final existingQuantityTypes = await (_database.select(
          _database.workQuantityTypes,
        )..where((tbl) => tbl.workScopeID.equals(scopeId))).get();

        // Delete related data in correct order
        for (final quantityType in existingQuantityTypes) {
          // Delete field options first
          final fields = await (_database.select(
            _database.workQuantityFields,
          )..where((tbl) => tbl.quantityTypeID.equals(quantityType.id))).get();

          for (final field in fields) {
            await (_database.delete(
              _database.workQuantityFieldOptions,
            )..where((tbl) => tbl.fieldID.equals(field.id))).go();
          }

          // Delete fields
          await (_database.delete(
            _database.workQuantityFields,
          )..where((tbl) => tbl.quantityTypeID.equals(quantityType.id))).go();
        }

        // Delete quantity types
        await (_database.delete(
          _database.workQuantityTypes,
        )..where((tbl) => tbl.workScopeID.equals(scopeId))).go();

        // Insert new quantity types
        await _insertWorkQuantityTypesWithRelations(quantities, scopeId);
      });
    } catch (e) {
      print('Error caching quantities: $e');
      throw e;
    }
  }

  @override
  Future<void> clearQuantitiesCache() async {
    try {
      await _database.transaction(() async {
        // Get all quantity type IDs first
        final allQuantityTypes = await _database
            .select(_database.workQuantityTypes)
            .get();

        // Delete field options first
        for (final quantityType in allQuantityTypes) {
          final fields = await (_database.select(
            _database.workQuantityFields,
          )..where((tbl) => tbl.quantityTypeID.equals(quantityType.id))).get();

          for (final field in fields) {
            await (_database.delete(
              _database.workQuantityFieldOptions,
            )..where((tbl) => tbl.fieldID.equals(field.id))).go();
          }
        }

        // Delete all fields
        await _database.delete(_database.workQuantityFields).go();

        // Delete all quantity types
        await _database.delete(_database.workQuantityTypes).go();
      });
    } catch (e) {
      print('Error clearing quantities cache: $e');
      throw e;
    }
  }

  /* 
  // Equipment datasource
  */

  @override
  Future<List<WorkEquipmentModel>?> getCachedEquipments({
    required String companyUID,
    required String workScopeUID,
  }) async {
    try {
      // Find the work scope first
      final scopeRecords = await (_database.select(
        _database.workScopes,
      )..where((tbl) => tbl.uid.equals(workScopeUID))).get();

      if (scopeRecords.isEmpty) {
        return null;
      }

      final scopeId = scopeRecords.first.id;

      // Get equipment IDs for this scope from junction table
      final junctionRecords = await (_database.select(
        _database.workScopeEquipment,
      )..where((tbl) => tbl.workScopeID.equals(scopeId))).get();

      if (junctionRecords.isEmpty) {
        return null;
      }

      final equipmentIds = junctionRecords
          .map((j) => j.workEquipmentID)
          .toList();

      // Get the actual equipment records
      final equipmentRecords = await (_database.select(
        _database.workScopeEquipments,
      )..where((tbl) => tbl.id.isIn(equipmentIds))).get();

      return equipmentRecords
          .map(
            (record) => WorkEquipmentModel(
              id: record.id,
              uid: record.uid,
              name: record.name,
              code: record.code,
            ),
          )
          .toList();
    } catch (e) {
      print('Error loading cached equipments: $e');
      return null;
    }
  }

  @override
  Future<void> cacheEquipments(
    List<WorkEquipmentModel> equipments, {
    required String companyUID,
    required String workScopeUID,
  }) async {
    try {
      await _database.transaction(() async {
        // Find the work scope
        final scopeRecords = await (_database.select(
          _database.workScopes,
        )..where((tbl) => tbl.uid.equals(workScopeUID))).get();

        if (scopeRecords.isEmpty) {
          throw Exception('Work scope not found: $workScopeUID');
        }

        final scopeId = scopeRecords.first.id;

        // Delete existing junction records for this scope
        await (_database.delete(
          _database.workScopeEquipment,
        )..where((tbl) => tbl.workScopeID.equals(scopeId))).go();

        // Insert/update equipment records and create junction records
        for (final equipment in equipments) {
          // Insert or update the equipment record
          final existingEquipment = await (_database.select(
            _database.workScopeEquipments,
          )..where((tbl) => tbl.uid.equals(equipment.uid))).getSingleOrNull();

          int equipmentId;

          if (existingEquipment != null) {
            // Update existing equipment
            await (_database.update(
              _database.workScopeEquipments,
            )..where((tbl) => tbl.id.equals(existingEquipment.id))).write(
              WorkScopeEquipmentsCompanion(
                name: Value(equipment.name),
                code: Value(equipment.code),
                isSynced: const Value(true),
                syncAction: const Value(null),
                syncError: const Value(null),
              ),
            );
            equipmentId = existingEquipment.id;
          } else {
            // Insert new equipment
            equipmentId = await _database
                .into(_database.workScopeEquipments)
                .insert(
                  WorkScopeEquipmentsCompanion(
                    uid: Value(equipment.uid),
                    name: Value(equipment.name),
                    code: Value(equipment.code),
                    isSynced: const Value(true),
                    syncAction: const Value(null),
                    syncError: const Value(null),
                  ),
                );
          }

          // Create junction record
          await _database
              .into(_database.workScopeEquipment)
              .insert(
                WorkScopeEquipmentCompanion(
                  workScopeID: Value(scopeId),
                  workEquipmentID: Value(equipmentId),
                  isSynced: const Value(true),
                  syncAction: const Value(null),
                  syncError: const Value(null),
                ),
              );
        }
      });
    } catch (e) {
      print('Error caching equipments: $e');
      throw e;
    }
  }

  @override
  Future<void> clearEquipmentsCache() async {
    try {
      await _database.transaction(() async {
        // Delete all junction records first
        await _database.delete(_database.workScopeEquipment).go();

        // Delete all equipment records
        await _database.delete(_database.workScopeEquipments).go();
      });
    } catch (e) {
      print('Error clearing equipments cache: $e');
      throw e;
    }
  }
}
