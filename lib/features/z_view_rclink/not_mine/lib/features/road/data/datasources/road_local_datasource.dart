import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/database/app_database.dart';
import '../models/country_model.dart';
import '../models/district_model.dart';
import '../models/package_data_response_model.dart';
import '../models/package_model.dart';
import '../models/package_road_model.dart';
import '../models/province_model.dart';
import '../models/road_category_model.dart';
import '../models/road_model.dart';

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
  Future<void> clearRoadCache() async {
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
      final districtsQuery = _database.select(_database.districts).join([
        leftOuterJoin(
          _database.provinces,
          _database.provinces.id.equalsExp(_database.districts.stateId),
        ),
        leftOuterJoin(
          _database.countries,
          _database.countries.id.equalsExp(_database.provinces.countryID),
        ),
      ]);
      final districtResults = await districtsQuery.get();

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

      // Get all package roads
      final packageRoadsQuery = _database.select(_database.packageRoads).join([
        leftOuterJoin(
          _database.roads,
          _database.roads.id.equalsExp(_database.packageRoads.roadId),
        ),
      ]);
      final packageRoadResults = await packageRoadsQuery.get();

      // Convert to models
      final packageModel = PackageModel(
        id: packageRecord.id,
        uid: packageRecord.uid,
        name: packageRecord.name,
        contractRelationUID: packageRecord.contractRelationUID,
        createdAt: packageRecord.createdAt.toIso8601String(),
        updatedAt: packageRecord.updatedAt.toIso8601String(),
      );

      final countryModels = countryRecords
          .map(
            (country) => CountryModel(
              id: country.id,
              uid: country.uid,
              name: country.name,
              createdAt: country.createdAt.toIso8601String(),
              updatedAt: country.updatedAt.toIso8601String(),
            ),
          )
          .toList();

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

      final districtModels = districtResults.map((row) {
        final district = row.readTable(_database.districts);
        final province = row.readTableOrNull(_database.provinces);
        final country = row.readTableOrNull(_database.countries);

        return DistrictModel(
          id: district.id,
          uid: district.uid,
          name: district.name,
          stateID: district.stateId,
          state: province != null
              ? ProvinceModel(
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
                )
              : null,
        );
      }).toList();

      final roadModels = <RoadModel>[];
      for (final row in roadResults) {
        final road = row.readTable(_database.roads);
        final district = row.readTableOrNull(_database.districts);
        final mainCategory = row.readTableOrNull(_database.roadCategories);

        // Get secondary category separately if it exists
        RoadCategoryModel? secondaryCategory;
        if (road.secondaryCategoryId != null) {
          final secondaryCategoryQuery = _database.select(
            _database.roadCategories,
          )..where((tbl) => tbl.id.equals(road.secondaryCategoryId!));

          final secondaryCategoryResults = await secondaryCategoryQuery.get();
          if (secondaryCategoryResults.isNotEmpty) {
            final secCat = secondaryCategoryResults.first;
            secondaryCategory = RoadCategoryModel(
              id: secCat.id,
              uid: secCat.uid,
              name: secCat.name,
              createdAt: secCat.createdAt.toIso8601String(),
              updatedAt: secCat.updatedAt.toIso8601String(),
            );
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
            secondaryCategory: secondaryCategory,
          ),
        );
      }

      final packageRoadModels = packageRoadResults.map((row) {
        final packageRoad = row.readTable(_database.packageRoads);
        final road = row.readTableOrNull(_database.roads);

        return PackageRoadModel(
          id: packageRoad.id,
          packageUID: packageRoad.packageUID,
          roadUID: packageRoad.roadUID,
          createdAt: packageRoad.createdAt.toIso8601String(),
          updatedAt: packageRoad.updatedAt.toIso8601String(),
          road: road != null
              ? RoadModel(
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
                )
              : null,
        );
      }).toList();

      print('💾 Retrieved cached package data from database');
      return PackageDataResponseModel(
        packages: [packageModel],
        countries: countryModels,
        states: provinceModels,
        districts: districtModels,
        roads: roadModels,
        packageRoads: packageRoadModels,
      );
    } catch (e) {
      print('❌ Error loading cached package data: $e');
      return null;
    }
  }

  @override
  Future<void> cachePackageData(PackageDataResponseModel packageData) async {
    try {
      await _database.transaction(() async {
        // Cache countries
        if (packageData.countries != null) {
          for (final country in packageData.countries!) {
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

        // Cache provinces/states
        if (packageData.states != null) {
          for (final province in packageData.states!) {
            await _database
                .into(_database.provinces)
                .insertOnConflictUpdate(
                  ProvincesCompanion(
                    id: Value(province.id!),
                    uid: Value(province.uid!),
                    name: Value(province.name!),
                    countryID: Value(province.countryID!),
                    createdAt: Value(DateTime.parse(province.createdAt!)),
                    updatedAt: Value(DateTime.parse(province.updatedAt!)),
                    isSynced: const Value(true),
                  ),
                );
          }
        }

        // Cache districts
        if (packageData.districts != null) {
          for (final district in packageData.districts!) {
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

        // Cache road categories (extract from roads)
        if (packageData.roads != null) {
          final categories = <int, RoadCategoryModel>{};
          for (final road in packageData.roads!) {
            if (road.mainCategory != null && road.mainCategory!.id != null) {
              categories[road.mainCategory!.id!] = road.mainCategory!;
            }
            if (road.secondaryCategory != null &&
                road.secondaryCategory!.id != null) {
              categories[road.secondaryCategory!.id!] = road.secondaryCategory!;
            }
          }

          for (final category in categories.values) {
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

        // Cache roads
        if (packageData.roads != null) {
          for (final road in packageData.roads!) {
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

        // Cache packages
        if (packageData.packages != null) {
          for (final package in packageData.packages!) {
            await _database
                .into(_database.packages)
                .insertOnConflictUpdate(
                  PackagesCompanion(
                    id: Value(package.id!),
                    uid: Value(package.uid!),
                    name: Value(package.name!),
                    contractRelationUID: Value(package.contractRelationUID),
                    createdAt: Value(DateTime.parse(package.createdAt!)),
                    updatedAt: Value(DateTime.parse(package.updatedAt!)),
                    isSynced: const Value(true),
                  ),
                );
          }
        }

        // Cache package roads
        if (packageData.packageRoads != null) {
          for (final packageRoad in packageData.packageRoads!) {
            await _database
                .into(_database.packageRoads)
                .insertOnConflictUpdate(
                  PackageRoadsCompanion(
                    id: Value(packageRoad.id!),
                    packageUID: Value(packageRoad.packageUID!),
                    roadUID: Value(packageRoad.roadUID!),
                    createdAt: Value(DateTime.parse(packageRoad.createdAt!)),
                    updatedAt: Value(DateTime.parse(packageRoad.updatedAt!)),
                    isSynced: const Value(true),
                  ),
                );
          }
        }
      });

      print('💾 Cached complete package data');
    } catch (e) {
      print('❌ Error caching package data: $e');
    }
  }
}
