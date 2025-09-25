import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/entities/province/country_entity.dart';
import '../../domain/entities/province/district_entity.dart';
import '../../domain/entities/province/province_entity.dart';
import '../../domain/entities/province/road_category_entity.dart';
import '../../domain/entities/province/road_entity.dart';
import '../../domain/entities/scope_of_work/dropdown_option.dart';
import '../../domain/entities/scope_of_work/quantity_field.dart';
import '../../domain/entities/scope_of_work/scope_of_work.dart';
import '../../domain/entities/scope_of_work/work_equipment.dart';
import '../../domain/entities/scope_of_work/work_quantity_type.dart';

import '../models/province/district_model.dart';
import '../models/province/province_model.dart';
import '../models/province/road_model.dart';
import '../models/scope_of_work/scope_of_work_model.dart';
import '../models/scope_of_work/work_quantity_type_model.dart';

abstract class DailyReportCreationLocalDatasource {
  // Foundation
  Future<void> clearCache();
  Future<void> clearProvinceCache();
  Future<void> clearDistrictCache();
  Future<void> clearRoadCache();

  ///------------------------- GET scope
  Future<List<ScopeOfWork>?> getCachedScopeOfWorks();
  Future<void> cacheScopeOfWorks(List<ScopeOfWork> scopeOfWorks);
  // scope getOfflineFirst
  Future<List<ScopeOfWorkModel>> getCachedWorkScopeModels();
  Future<void> cacheWorkScopeModels(List<ScopeOfWorkModel> models);
  // GET equipments
  Future<List<WorkEquipment>?> getCachedWorkEquipments();
  Future<void> cacheWorkEquipments(List<WorkEquipment> equipments);

  ///------------------------- GET Province
  Future<List<Province>?> getCachedProvinces();
  Future<void> cacheProvinces(List<Province> provinces);
  // province getOfflineFirst
  Future<List<ProvinceModel>> getCachedProvinceModels();
  Future<void> cacheProvinceModels(List<ProvinceModel> models);

  ///------------------------- GET District
  Future<List<District>?> getCachedDistricts();
  Future<void> cacheDistricts(List<District> districts);
  // district getOfflineFirst
  Future<List<DistrictModel>> getCachedDistrictModels();
  Future<void> cacheDistrictModels(List<DistrictModel> models);

  ///------------------------- GET Road
  Future<List<Road>?> getCachedRoads();
  Future<void> cacheRoads(List<Road> roads);
  // roads getOfflineFirst
  Future<List<RoadModel>> getCachedRoadModels();
  Future<void> cacheRoadModels(List<RoadModel> models);

  ///------------------------- GET Quantity
  Future<List<WorkQuantityType>?> getCachedQuantities({
    required String companyUID,
    required String workScopeUID,
  });

  Future<void> cacheQuantities(
    List<WorkQuantityType> quantities, {
    required String companyUID,
    required String workScopeUID,
  });

  Future<List<WorkQuantityTypeModel>> getCachedQuantityModels({
    required String companyUID,
    required String workScopeUID,
  });

  Future<void> cacheQuantityModels(
    List<WorkQuantityTypeModel> models, {
    required String companyUID,
    required String workScopeUID,
  });

  Future<void> clearQuantitiesCache();
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

  // Model-based methods for getOfflineFirst pattern
  @override
  Future<List<ScopeOfWorkModel>> getCachedWorkScopeModels() async {
    final entities = await getCachedScopeOfWorks();
    if (entities == null) return [];

    return entities
        .map((entity) => ScopeOfWorkModel.fromEntity(entity))
        .toList();
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

  @override
  Future<void> cacheWorkScopeModels(List<ScopeOfWorkModel> models) async {
    final entities = models.map((model) => model.toEntity()).toList();
    await cacheScopeOfWorks(entities);
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

  /* 
  // Private helper methods
  */

  Future<void> _insertScopeOfWorkWithRelations(ScopeOfWork scopeOfWork) async {
    // 1. Insert ScopeOfWork
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

    // 2. Insert WorkQuantityTypes with relations
    await _insertWorkQuantityTypesWithRelations(
      scopeOfWork.workQuantityTypes,
      scopeOfWork.id,
    );

    // 3. Insert WorkEquipments with relations
    await _insertWorkEquipmentsWithRelations(
      scopeOfWork.workEquipments,
      scopeOfWork.id,
    );
  }

  Future<void> _insertWorkQuantityTypesWithRelations(
    List<WorkQuantityType> quantityTypes,
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
    List<QuantityField> fields,
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
              ..where((tbl) => tbl.quantityTypeID.equals(workQuantityTypeId))
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
      return WorkEquipment(
        id: equipment.id,
        uid: equipment.uid,
        name: equipment.name,
        code: equipment.code,
      );
    }).toList();
  }

  /* 
  // Province datasource
  */
  @override
  Future<void> clearProvinceCache() async {
    try {
      await _database.transaction(() async {
        // Clear in proper order due to foreign key constraints
        await _database.delete(_database.roads).go();
        await _database.delete(_database.districts).go();
        await _database.delete(_database.provinces).go();
        await _database.delete(_database.countries).go();
        await _database
            .delete(_database.roadCategories)
            .go(); // No FK constraints
      });
      print('✅ Province cache cleared from database');
    } catch (e) {
      print('❌ Error clearing province cache: $e');
    }
  }

  @override
  Future<List<Province>?> getCachedProvinces() async {
    try {
      // Get provinces with their country information using join
      final query = _database.select(_database.provinces).join([
        leftOuterJoin(
          _database.countries,
          _database.countries.id.equalsExp(_database.provinces.countryID),
        ),
      ]);

      final results = await query.get();

      if (results.isEmpty) {
        print('💾 No cached provinces found');
        return null;
      }

      final provinces = results.map((row) {
        final province = row.readTable(_database.provinces);
        final country = row.readTableOrNull(_database.countries);

        return Province(
          id: province.id,
          uid: province.uid,
          name: province.name,
          countryId: province.countryID,
          createdAt: province.createdAt.toIso8601String(),
          updatedAt: province.updatedAt.toIso8601String(),
          country: country != null
              ? Countryr(
                  id: country.id,
                  uid: country.uid,
                  name: country.name,
                  createdAt: country.createdAt.toIso8601String(),
                  updatedAt: country.updatedAt.toIso8601String(),
                )
              : null,
        );
      }).toList();

      print('💾 Retrieved ${provinces.length} provinces from database');
      return provinces;
    } catch (e) {
      print('❌ Error loading cached provinces: $e');
      return null;
    }
  }

  @override
  Future<void> cacheProvinces(List<Province> provinces) async {
    try {
      await _database.transaction(() async {
        // First, cache all unique countries
        final uniqueCountries = <int, Countryr>{};
        for (final province in provinces) {
          if (province.country != null && province.country!.id != null) {
            uniqueCountries[province.country!.id!] = province.country!;
          }
        }

        // Insert/update countries
        for (final country in uniqueCountries.values) {
          await _database
              .into(_database.countries)
              .insertOnConflictUpdate(
                CountriesCompanion(
                  id: Value(country.id!),
                  uid: Value(country.uid!),
                  name: Value(country.name!),
                  createdAt: Value(DateTime.parse(country.createdAt!)),
                  updatedAt: Value(DateTime.parse(country.updatedAt!)),
                  isSynced: const Value(true),
                ),
              );
        }

        // Insert/update provinces
        for (final province in provinces) {
          await _database
              .into(_database.provinces)
              .insertOnConflictUpdate(
                ProvincesCompanion(
                  id: Value(province.id!),
                  uid: Value(province.uid!),
                  name: Value(province.name!),
                  countryID: Value(province.countryId!),
                  createdAt: Value(DateTime.parse(province.createdAt!)),
                  updatedAt: Value(DateTime.parse(province.updatedAt!)),
                  isSynced: const Value(true),
                ),
              );
        }
      });

      print('💾 Cached ${provinces.length} provinces in database');
    } catch (e) {
      print('❌ Error caching provinces: $e');
    }
  }

  @override
  Future<List<ProvinceModel>> getCachedProvinceModels() async {
    final entities = await getCachedProvinces();
    if (entities == null) return [];

    return entities.map((entity) => ProvinceModel.fromEntity(entity)).toList();
  }

  @override
  Future<void> cacheProvinceModels(List<ProvinceModel> models) async {
    final entities = models.map((model) => model.toEntity()).toList();
    await cacheProvinces(entities);
  }

  /* 
  // District datasource
  */
  @override
  Future<void> clearDistrictCache() async {
    try {
      await _database.transaction(() async {
        // Clear in proper order due to foreign key constraints
        await _database.delete(_database.roads).go();
        await _database.delete(_database.districts).go();
      });
      print('✅ District cache cleared from database');
    } catch (e) {
      print('❌ Error clearing district cache: $e');
    }
  }

  @override
  Future<List<District>?> getCachedDistricts() async {
    try {
      // Get districts with their state and country information using joins
      final query = _database.select(_database.districts).join([
        leftOuterJoin(
          _database.provinces,
          _database.provinces.id.equalsExp(_database.districts.stateId),
        ),
        leftOuterJoin(
          _database.countries,
          _database.countries.id.equalsExp(_database.provinces.countryID),
        ),
      ]);

      final results = await query.get();

      if (results.isEmpty) {
        print('💾 No cached districts found');
        return null;
      }

      final districts = results.map((row) {
        final district = row.readTable(_database.districts);
        final province = row.readTableOrNull(_database.provinces);
        final country = row.readTableOrNull(_database.countries);

        return District(
          id: district.id,
          uid: district.uid,
          name: district.name,
          stateId: district.stateId,
          state: province != null
              ? Province(
                  id: province.id,
                  uid: province.uid,
                  name: province.name,
                  countryId: province.countryID,
                  createdAt: province.createdAt.toIso8601String(),
                  updatedAt: province.updatedAt.toIso8601String(),
                  country: country != null
                      ? Countryr(
                          id: country.id,
                          uid: country.uid,
                          name: country.name,
                          createdAt: country.createdAt.toIso8601String(),
                          updatedAt: country.updatedAt.toIso8601String(),
                        )
                      : null,
                )
              : null,
        );
      }).toList();

      print('💾 Retrieved ${districts.length} districts from database');
      return districts;
    } catch (e) {
      print('❌ Error loading cached districts: $e');
      return null;
    }
  }

  @override
  Future<void> cacheDistricts(List<District> districts) async {
    try {
      await _database.transaction(() async {
        // First, cache all unique provinces and countries
        final uniqueProvinces = <int, Province>{};
        final uniqueCountries = <int, Countryr>{};

        for (final district in districts) {
          if (district.state != null && district.state!.id != null) {
            uniqueProvinces[district.state!.id!] = district.state!;

            if (district.state!.country != null &&
                district.state!.country!.id != null) {
              uniqueCountries[district.state!.country!.id!] =
                  district.state!.country!;
            }
          }
        }

        // Insert/update countries first
        for (final country in uniqueCountries.values) {
          await _database
              .into(_database.countries)
              .insertOnConflictUpdate(
                CountriesCompanion(
                  id: Value(country.id!),
                  uid: Value(country.uid!),
                  name: Value(country.name!),
                  createdAt: Value(DateTime.parse(country.createdAt!)),
                  updatedAt: Value(DateTime.parse(country.updatedAt!)),
                  isSynced: const Value(true),
                ),
              );
        }

        // Insert/update provinces
        for (final province in uniqueProvinces.values) {
          await _database
              .into(_database.provinces)
              .insertOnConflictUpdate(
                ProvincesCompanion(
                  id: Value(province.id!),
                  uid: Value(province.uid!),
                  name: Value(province.name!),
                  countryID: Value(province.countryId!),
                  createdAt: Value(DateTime.parse(province.createdAt!)),
                  updatedAt: Value(DateTime.parse(province.updatedAt!)),
                  isSynced: const Value(true),
                ),
              );
        }

        // Insert/update districts
        for (final district in districts) {
          await _database
              .into(_database.districts)
              .insertOnConflictUpdate(
                DistrictsCompanion(
                  id: Value(district.id!),
                  uid: Value(district.uid!),
                  name: Value(district.name!),
                  stateId: Value(district.stateId!),
                  createdAt: Value(
                    DateTime.now(),
                  ), // API response doesn't include timestamps for districts
                  updatedAt: Value(DateTime.now()),
                  isSynced: const Value(true),
                ),
              );
        }
      });

      print('💾 Cached ${districts.length} districts in database');
    } catch (e) {
      print('❌ Error caching districts: $e');
    }
  }

  @override
  Future<List<DistrictModel>> getCachedDistrictModels() async {
    final entities = await getCachedDistricts();
    if (entities == null) return [];

    return entities.map((entity) => DistrictModel.fromEntity(entity)).toList();
  }

  @override
  Future<void> cacheDistrictModels(List<DistrictModel> models) async {
    final entities = models.map((model) => model.toEntity()).toList();
    await cacheDistricts(entities);
  }

  /* 
  // Road datasource
  */
  @override
  Future<void> clearRoadCache() async {
    try {
      // Clear roads only (no foreign key dependencies from other tables)
      await _database.delete(_database.roads).go();
      print('✅ Road cache cleared from database');
    } catch (e) {
      print('❌ Error clearing road cache: $e');
    }
  }

  @override
  Future<List<Road>?> getCachedRoads() async {
    try {
      // Get roads with their district and main category information
      final query = _database.select(_database.roads).join([
        leftOuterJoin(
          _database.districts,
          _database.districts.id.equalsExp(_database.roads.districtId),
        ),
        leftOuterJoin(
          _database.roadCategories,
          _database.roadCategories.id.equalsExp(_database.roads.mainCategoryId),
        ),
      ]);

      final results = await query.get();

      if (results.isEmpty) {
        print('💾 No cached roads found');
        return null;
      }

      final roads = <Road>[];

      for (final row in results) {
        final road = row.readTable(_database.roads);
        final district = row.readTableOrNull(_database.districts);
        final mainCategory = row.readTableOrNull(_database.roadCategories);

        // Get secondary category separately if it exists
        RoadCategoryRecord? secondaryCategory;
        if (road.secondaryCategoryId != null) {
          final secondaryCategoryQuery = _database.select(
            _database.roadCategories,
          )..where((tbl) => tbl.id.equals(road.secondaryCategoryId!));
          final secondaryCategoryResults = await secondaryCategoryQuery.get();
          if (secondaryCategoryResults.isNotEmpty) {
            secondaryCategory = secondaryCategoryResults.first;
          }
        }

        roads.add(
          Road(
            id: road.id,
            uid: road.uid,
            name: road.name,
            roadNo: road.roadNo,
            sectionStart: road.sectionStart,
            sectionFinish: road.sectionFinish,
            mainCategoryId: road.mainCategoryId,
            secondaryCategoryId: road.secondaryCategoryId,
            districtId: road.districtId,
            createdAt: road.createdAt.toIso8601String(),
            updatedAt: road.updatedAt.toIso8601String(),
            district: district != null
                ? District(
                    id: district.id,
                    uid: district.uid,
                    name: district.name,
                    stateId: district.stateId,
                    state:
                        null, // Don't fetch nested state to avoid complex joins
                  )
                : null,
            mainCategory: mainCategory != null
                ? RoadCategory(
                    id: mainCategory.id,
                    uid: mainCategory.uid,
                    name: mainCategory.name,
                    createdAt: mainCategory.createdAt.toIso8601String(),
                    updatedAt: mainCategory.updatedAt.toIso8601String(),
                  )
                : null,
            secondaryCategory: secondaryCategory != null
                ? RoadCategory(
                    id: secondaryCategory.id,
                    uid: secondaryCategory.uid,
                    name: secondaryCategory.name,
                    createdAt: secondaryCategory.createdAt.toIso8601String(),
                    updatedAt: secondaryCategory.updatedAt.toIso8601String(),
                  )
                : null,
          ),
        );
      }

      print('💾 Retrieved ${roads.length} roads from database');
      return roads;
    } catch (e) {
      print('❌ Error loading cached roads: $e');
      return null;
    }
  }

  @override
  Future<void> cacheRoads(List<Road> roads) async {
    try {
      await _database.transaction(() async {
        // Cache unique districts and road categories first
        final uniqueDistricts = <int, District>{};
        final uniqueMainCategories = <int, RoadCategory>{};
        final uniqueSecondaryCategories = <int, RoadCategory>{};

        for (final road in roads) {
          if (road.district != null && road.district!.id != null) {
            uniqueDistricts[road.district!.id!] = road.district!;
          }
          if (road.mainCategory != null && road.mainCategory!.id != null) {
            uniqueMainCategories[road.mainCategory!.id!] = road.mainCategory!;
          }
          if (road.secondaryCategory != null &&
              road.secondaryCategory!.id != null) {
            uniqueSecondaryCategories[road.secondaryCategory!.id!] =
                road.secondaryCategory!;
          }
        }

        // Insert/update districts (simplified - no state relationship for now)
        for (final district in uniqueDistricts.values) {
          await _database
              .into(_database.districts)
              .insertOnConflictUpdate(
                DistrictsCompanion(
                  id: Value(district.id!),
                  uid: Value(district.uid!),
                  name: Value(district.name!),
                  stateId: Value(district.stateId!),
                  createdAt: Value(DateTime.now()),
                  updatedAt: Value(DateTime.now()),
                  isSynced: const Value(true),
                ),
              );
        }

        // Insert/update road categories (both main and secondary)
        final allCategories = {
          ...uniqueMainCategories.values,
          ...uniqueSecondaryCategories.values,
        };
        for (final category in allCategories) {
          await _database
              .into(_database.roadCategories)
              .insertOnConflictUpdate(
                RoadCategoriesCompanion(
                  id: Value(category.id!),
                  uid: Value(category.uid!),
                  name: Value(category.name!),
                  createdAt: Value(DateTime.parse(category.createdAt!)),
                  updatedAt: Value(DateTime.parse(category.updatedAt!)),
                  isSynced: const Value(true),
                ),
              );
        }

        // Insert/update roads
        for (final road in roads) {
          await _database
              .into(_database.roads)
              .insertOnConflictUpdate(
                RoadsCompanion(
                  id: Value(road.id!),
                  uid: Value(road.uid!),
                  name: Value(road.name!),
                  roadNo: Value(road.roadNo),
                  sectionStart: Value(road.sectionStart),
                  sectionFinish: Value(road.sectionFinish),
                  mainCategoryId: Value(road.mainCategoryId),
                  secondaryCategoryId: Value(road.secondaryCategoryId),
                  districtId: Value(road.districtId!),
                  createdAt: Value(DateTime.parse(road.createdAt!)),
                  updatedAt: Value(DateTime.parse(road.updatedAt!)),
                  isSynced: const Value(true),
                ),
              );
        }
      });

      print('💾 Cached ${roads.length} roads in database');
    } catch (e) {
      print('❌ Error caching roads: $e');
    }
  }

  @override
  Future<List<RoadModel>> getCachedRoadModels() async {
    final entities = await getCachedRoads();
    if (entities == null) return [];

    return entities.map((entity) => RoadModel.fromEntity(entity)).toList();
  }

  @override
  Future<void> cacheRoadModels(List<RoadModel> models) async {
    final entities = models.map((model) => model.toEntity()).toList();
    await cacheRoads(entities);
  }

  /* 
  // Quantity datasource
  */

  @override
  Future<List<WorkQuantityType>?> getCachedQuantities({
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
    List<WorkQuantityType> quantities, {
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

  @override
  Future<List<WorkQuantityTypeModel>> getCachedQuantityModels({
    required String companyUID,
    required String workScopeUID,
  }) async {
    final entities = await getCachedQuantities(
      companyUID: companyUID,
      workScopeUID: workScopeUID,
    );

    if (entities == null) return [];

    return entities
        .map((entity) => WorkQuantityTypeModel.fromEntity(entity))
        .toList();
  }

  @override
  Future<void> cacheQuantityModels(
    List<WorkQuantityTypeModel> models, {
    required String companyUID,
    required String workScopeUID,
  }) async {
    final entities = models.map((model) => model.toEntity()).toList();
    await cacheQuantities(
      entities,
      companyUID: companyUID,
      workScopeUID: workScopeUID,
    );
  }
}
