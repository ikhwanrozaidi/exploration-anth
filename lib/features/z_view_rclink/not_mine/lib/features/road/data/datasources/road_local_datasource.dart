import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:rclink_app/features/road/data/models/country_model.dart';
import 'package:rclink_app/features/road/data/models/district_model.dart';
import 'package:rclink_app/features/road/data/models/province_model.dart';
import 'package:rclink_app/features/road/data/models/road_category_model.dart';
import 'package:rclink_app/features/road/data/models/road_model.dart';
import '../../../../core/database/app_database.dart';
import '../models/package_data_response_model.dart';
import '../models/package_model.dart';
import '../models/package_road_model.dart';

abstract class RoadLocalDataSource {
  // Package data methods
  Future<PackageDataResponseModel?> getCachedPackageData();
  Future<void> cachePackageData(PackageDataResponseModel packageData);

  Future<void> clearRoadCache();
}

@LazySingleton(as: RoadLocalDataSource)
class RoadLocalDataSourceImpl implements RoadLocalDataSource {
  final DatabaseService _databaseService;

  RoadLocalDataSourceImpl(this._databaseService);

  AppDatabase get _database => _databaseService.database;

  @override
  Future<void> clearCache() async {
    try {
      await _database.transaction(() async {
        // Clear in proper order due to foreign key constraints
        await _database.delete(_database.packageRoads).go();
        await _database.delete(_database.packages).go();
        await _database.delete(_database.roads).go();
        await _database.delete(_database.districts).go();
        await _database.delete(_database.provinces).go();
        await _database.delete(_database.countries).go();
        await _database.delete(_database.roadCategories).go();
      });
      print('✅ Road cache cleared from database');
    } catch (e) {
      print('❌ Error clearing road cache: $e');
    }
  }

  @override
  Future<PackageDataResponseModel?> getCachedPackageData() async {
    try {
      // Get package (assuming only one package at a time)
      final packageQuery = _database.select(_database.packages);
      final packageResults = await packageQuery.get();

      if (packageResults.isEmpty) {
        print('💾 No cached package data found');
        return null;
      }

      final packageRecord = packageResults.first;

      // Get all countries
      final countriesQuery = _database.select(_database.countries);
      final countryRecords = await countriesQuery.get();

      // Get all provinces/states
      final provincesQuery = _database.select(_database.provinces).join([
        leftOuterJoin(
          _database.countries,
          _database.countries.id.equalsExp(_database.provinces.countryID),
        ),
      ]);
      final provinceResults = await provincesQuery.get();

      // Get all districts
      final districtsQuery = _database.select(_database.districts);
      final districtRecords = await districtsQuery.get();

      // Get all roads with categories and districts
      final roadsQuery = _database.select(_database.roads).join([
        leftOuterJoin(
          _database.districts,
          _database.districts.id.equalsExp(_database.roads.districtId),
        ),
        leftOuterJoin(
          _database.roadCategories,
          _database.roadCategories.id.equalsExp(_database.roads.mainCategoryId),
        ),
      ]);
      final roadResults = await roadsQuery.get();

      // Get all packageRoads
      final packageRoadsQuery = _database.select(_database.packageRoads);
      final packageRoadRecords = await packageRoadsQuery.get();

      // Convert to models
      final packageModel = PackageModel(
        id: packageRecord.id,
        uid: packageRecord.uid,
        name: packageRecord.name,
        description: packageRecord.description,
        createdAt: packageRecord.createdAt.toIso8601String(),
        updatedAt: packageRecord.updatedAt.toIso8601String(),
      );

      final countryModels = countryRecords.map((country) {
        return CountryModel(
          id: country.id,
          uid: country.uid,
          name: country.name,
          createdAt: country.createdAt.toIso8601String(),
          updatedAt: country.updatedAt.toIso8601String(),
        );
      }).toList();

      final provinceModels = provinceResults.map((row) {
        final province = row.readTable(_database.provinces);
        final country = row.readTableOrNull(_database.countries);

        return ProvinceModel(
          id: province.id,
          uid: province.uid,
          name: province.name,
          countryID: province.countryID,
          createdAt: province.createdAt.toIso8601String(),
          updatedAt: province.updatedAt.toIso8601String(),
          country: country != null
              ? CountryModel(
                  id: country.id,
                  uid: country.uid,
                  name: country.name,
                  createdAt: country.createdAt.toIso8601String(),
                  updatedAt: country.updatedAt.toIso8601String(),
                )
              : null,
        );
      }).toList();

      final districtModels = districtRecords.map((district) {
        return DistrictModel(
          id: district.id,
          uid: district.uid,
          name: district.name,
          stateID: district.stateId,
          state: null, // Don't fetch nested to avoid complexity
        );
      }).toList();

      final roadModels = <RoadModel>[];
      for (final row in roadResults) {
        final road = row.readTable(_database.roads);
        final district = row.readTableOrNull(_database.districts);
        final mainCategory = row.readTableOrNull(_database.roadCategories);

        // Get secondary category separately if exists
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

        roadModels.add(
          RoadModel(
            id: road.id,
            uid: road.uid,
            name: road.name,
            roadNo: road.roadNo,
            sectionStart: road.sectionStart,
            sectionFinish: road.sectionFinish,
            mainCategoryID: road.mainCategoryId,
            secondaryCategoryID: road.secondaryCategoryId,
            districtID: road.districtId,
            createdAt: road.createdAt.toIso8601String(),
            updatedAt: road.updatedAt.toIso8601String(),
            district: district != null
                ? DistrictModel(
                    id: district.id,
                    uid: district.uid,
                    name: district.name,
                    stateID: district.stateId,
                    state: null,
                  )
                : null,
            mainCategory: mainCategory != null
                ? RoadCategoryModel(
                    id: mainCategory.id,
                    uid: mainCategory.uid,
                    name: mainCategory.name,
                    createdAt: mainCategory.createdAt.toIso8601String(),
                    updatedAt: mainCategory.updatedAt.toIso8601String(),
                  )
                : null,
            secondaryCategory: secondaryCategory != null
                ? RoadCategoryModel(
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

      final packageRoadModels = packageRoadRecords.map((pr) {
        return PackageRoadModel(
          uid: pr.uid,
          roadUID: pr.roadUID,
          sectionStart: pr.sectionStart,
          sectionFinish: pr.sectionFinish,
        );
      }).toList();

      final response = PackageDataResponseModel(
        package: packageModel,
        countries: countryModels,
        states: provinceModels,
        districts: districtModels,
        roads: roadModels,
        packageRoads: packageRoadModels,
      );

      print('💾 Retrieved cached package data from database');
      return response;
    } catch (e) {
      print('❌ Error loading cached package data: $e');
      return null;
    }
  }

  @override
  Future<void> cachePackageData(PackageDataResponseModel data) async {
    try {
      await _database.transaction(() async {
        // 1. Cache package
        if (data.package != null) {
          await _database
              .into(_database.packages)
              .insertOnConflictUpdate(
                PackagesCompanion(
                  id: Value(data.package!.id!),
                  uid: Value(data.package!.uid!),
                  name: Value(data.package!.name!),
                  description: Value(data.package!.description!),
                  createdAt: Value(DateTime.parse(data.package!.createdAt!)),
                  updatedAt: Value(DateTime.parse(data.package!.updatedAt!)),
                  isSynced: const Value(true),
                ),
              );
        }

        // 2. Cache countries
        if (data.countries != null) {
          for (final country in data.countries!) {
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
        }

        // 3. Cache states/provinces
        if (data.states != null) {
          for (final state in data.states!) {
            await _database
                .into(_database.provinces)
                .insertOnConflictUpdate(
                  ProvincesCompanion(
                    id: Value(state.id!),
                    uid: Value(state.uid!),
                    name: Value(state.name!),
                    countryID: Value(state.countryID!),
                    createdAt: Value(DateTime.parse(state.createdAt!)),
                    updatedAt: Value(DateTime.parse(state.updatedAt!)),
                    isSynced: const Value(true),
                  ),
                );
          }
        }

        // 4. Cache districts
        if (data.districts != null) {
          for (final district in data.districts!) {
            await _database
                .into(_database.districts)
                .insertOnConflictUpdate(
                  DistrictsCompanion(
                    id: Value(district.id!),
                    uid: Value(district.uid!),
                    name: Value(district.name!),
                    stateId: Value(district.stateID!),
                    createdAt: Value(DateTime.now()),
                    updatedAt: Value(DateTime.now()),
                    isSynced: const Value(true),
                  ),
                );
          }
        }

        // 5. Cache road categories (from roads)
        if (data.roads != null) {
          final uniqueMainCategories = <int, RoadCategoryModel>{};
          final uniqueSecondaryCategories = <int, RoadCategoryModel>{};

          for (final road in data.roads!) {
            if (road.mainCategory != null && road.mainCategory!.id != null) {
              uniqueMainCategories[road.mainCategory!.id!] = road.mainCategory!;
            }
            if (road.secondaryCategory != null &&
                road.secondaryCategory!.id != null) {
              uniqueSecondaryCategories[road.secondaryCategory!.id!] =
                  road.secondaryCategory!;
            }
          }

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
        }

        // 6. Cache roads
        if (data.roads != null) {
          for (final road in data.roads!) {
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
                    mainCategoryId: Value(road.mainCategoryID),
                    secondaryCategoryId: Value(road.secondaryCategoryID),
                    districtId: Value(road.districtID!),
                    createdAt: Value(DateTime.parse(road.createdAt!)),
                    updatedAt: Value(DateTime.parse(road.updatedAt!)),
                    isSynced: const Value(true),
                  ),
                );
          }
        }

        // 7. Cache packageRoads
        if (data.packageRoads != null) {
          for (final packageRoad in data.packageRoads!) {
            await _database
                .into(_database.packageRoads)
                .insertOnConflictUpdate(
                  PackageRoadsCompanion(
                    uid: Value(packageRoad.uid!),
                    roadUID: Value(packageRoad.roadUID!),
                    sectionStart: Value(packageRoad.sectionStart),
                    sectionFinish: Value(packageRoad.sectionFinish),
                    createdAt: Value(DateTime.now()),
                    updatedAt: Value(DateTime.now()),
                    isSynced: const Value(true),
                  ),
                );
          }
        }
      });

      print('💾 Cached package data in database');
    } catch (e) {
      print('❌ Error caching package data: $e');
    }
  }
}
