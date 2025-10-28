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

      // Get all provinces/states with country joins
      final provincesQuery = _database.select(_database.provinces).join([
        leftOuterJoin(
          _database.countries,
          _database.countries.id.equalsExp(_database.provinces.countryID),
        ),
      ]);
      final provinceResults = await provincesQuery.get();

      // Get all districts with province and country joins
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
      final packageRoadsQuery = _database.select(_database.packageRoads);
      final packageRoadResults = await packageRoadsQuery.get();

      // Convert PackageRecord to PackageModel
      final packageModel = PackageModel(
        id: packageRecord.id,
        uid: packageRecord.uid,
        name: packageRecord.name,
        description: packageRecord.description,
        createdAt: packageRecord.createdAt.toIso8601String(),
        updatedAt: packageRecord.updatedAt.toIso8601String(),
      );

      // Convert CountryRecords to CountryModels
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

      // Convert Province joins to ProvinceModels
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

      // Convert District joins to DistrictModels
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

      // Convert Road joins to RoadModels
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
            sectionStart: road.sectionStart, // Already double from database
            sectionFinish: road.sectionFinish, // Already double from database
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

      // Convert PackageRoadRecords to PackageRoadModels
      final packageRoadModels = packageRoadResults.map((packageRoad) {
        return PackageRoadModel(
          uid: packageRoad.uid,
          roadUID: packageRoad.roadUID,
          sectionStart: packageRoad.sectionStart,
          sectionFinish: packageRoad.sectionFinish,
        );
      }).toList();

      print('💾 Retrieved cached package data from database');
      return PackageDataResponseModel(
        package: packageModel,
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
        // Cache package
        if (packageData.package != null) {
          final package = packageData.package!;
          await _database
              .into(_database.packages)
              .insertOnConflictUpdate(
                PackagesCompanion(
                  id: package.id != null
                      ? Value(package.id!)
                      : const Value.absent(),
                  uid: Value(package.uid!),
                  name: Value(package.name!),
                  description: Value(package.description ?? ''),
                  createdAt: Value(DateTime.parse(package.createdAt!)),
                  updatedAt: Value(DateTime.parse(package.updatedAt!)),
                  isSynced: const Value(true),
                ),
              );
        }

        // Cache countries
        if (packageData.countries != null) {
          for (final country in packageData.countries!) {
            if (country.id != null && country.uid != null) {
              await _database
                  .into(_database.countries)
                  .insertOnConflictUpdate(
                    CountriesCompanion(
                      id: Value(country.id!),
                      uid: Value(country.uid!),
                      name: Value(country.name ?? ''),
                      createdAt: country.createdAt != null
                          ? Value(DateTime.parse(country.createdAt!))
                          : Value(DateTime.now()),
                      updatedAt: country.updatedAt != null
                          ? Value(DateTime.parse(country.updatedAt!))
                          : Value(DateTime.now()),
                      isSynced: const Value(true),
                    ),
                  );
            }
          }
        }

        // Build a map of country UID -> ID for provinces
        final countryUIDToID = <String, int>{};
        if (packageData.countries != null) {
          for (final country in packageData.countries!) {
            if (country.uid != null && country.id != null) {
              countryUIDToID[country.uid!] = country.id!;
            }
          }
        }

        // Cache provinces/states
        if (packageData.states != null) {
          for (final province in packageData.states!) {
            if (province.id != null && province.uid != null) {
              // Resolve countryID from countryUID if needed
              int? countryID = province.countryID;
              if (countryID == null && province.countryUID != null) {
                countryID = countryUIDToID[province.countryUID!];
              }

              if (countryID != null) {
                await _database
                    .into(_database.provinces)
                    .insertOnConflictUpdate(
                      ProvincesCompanion(
                        id: Value(province.id!),
                        uid: Value(province.uid!),
                        name: Value(province.name ?? ''),
                        countryID: Value(countryID),
                        createdAt: province.createdAt != null
                            ? Value(DateTime.parse(province.createdAt!))
                            : Value(DateTime.now()),
                        updatedAt: province.updatedAt != null
                            ? Value(DateTime.parse(province.updatedAt!))
                            : Value(DateTime.now()),
                        isSynced: const Value(true),
                      ),
                    );
              }
            }
          }
        }

        // Build a map of state UID -> ID for districts
        final stateUIDToID = <String, int>{};
        if (packageData.states != null) {
          for (final state in packageData.states!) {
            if (state.uid != null && state.id != null) {
              stateUIDToID[state.uid!] = state.id!;
            }
          }
        }

        // Cache districts
        if (packageData.districts != null) {
          for (final district in packageData.districts!) {
            if (district.id != null && district.uid != null) {
              // Resolve stateID from stateUID if needed
              int? stateID = district.stateID;
              if (stateID == null && district.stateUID != null) {
                stateID = stateUIDToID[district.stateUID!];
              }

              if (stateID != null) {
                await _database
                    .into(_database.districts)
                    .insertOnConflictUpdate(
                      DistrictsCompanion(
                        id: Value(district.id!),
                        uid: Value(district.uid!),
                        name: Value(district.name ?? ''),
                        stateId: Value(stateID),
                        createdAt: Value(DateTime.now()),
                        updatedAt: Value(DateTime.now()),
                        isSynced: const Value(true),
                      ),
                    );
              }
            }
          }
        }

        // Build a map of district UID -> ID for roads
        final districtUIDToID = <String, int>{};
        if (packageData.districts != null) {
          for (final district in packageData.districts!) {
            if (district.uid != null && district.id != null) {
              districtUIDToID[district.uid!] = district.id!;
            }
          }
        }

        // Cache road categories (collect unique categories from roads)
        final roadCategories = <int, RoadCategoryModel>{};
        if (packageData.roads != null) {
          for (final road in packageData.roads!) {
            if (road.mainCategory != null && road.mainCategory!.id != null) {
              roadCategories[road.mainCategory!.id!] = road.mainCategory!;
            }
            if (road.secondaryCategory != null &&
                road.secondaryCategory!.id != null) {
              roadCategories[road.secondaryCategory!.id!] =
                  road.secondaryCategory!;
            }
          }
        }

        for (final category in roadCategories.values) {
          if (category.id != null && category.uid != null) {
            await _database
                .into(_database.roadCategories)
                .insertOnConflictUpdate(
                  RoadCategoriesCompanion(
                    id: Value(category.id!),
                    uid: Value(category.uid!),
                    name: Value(category.name ?? ''),
                    createdAt: category.createdAt != null
                        ? Value(DateTime.parse(category.createdAt!))
                        : Value(DateTime.now()),
                    updatedAt: category.updatedAt != null
                        ? Value(DateTime.parse(category.updatedAt!))
                        : Value(DateTime.now()),
                    isSynced: const Value(true),
                  ),
                );
          }
        }

        // Cache roads
        if (packageData.roads != null) {
          for (final road in packageData.roads!) {
            if (road.id != null && road.uid != null) {
              // Resolve districtID from districtUID if needed
              int? districtID = road.districtID;
              if (districtID == null && road.districtUID != null) {
                districtID = districtUIDToID[road.districtUID!];
              }

              if (districtID != null) {
                await _database
                    .into(_database.roads)
                    .insertOnConflictUpdate(
                      RoadsCompanion(
                        id: Value(road.id!),
                        uid: Value(road.uid!),
                        name: Value(road.name ?? ''),
                        roadNo: Value(road.roadNo),
                        sectionStart: Value(
                          road.sectionStart,
                        ), // Double value directly
                        sectionFinish: Value(
                          road.sectionFinish,
                        ), // Double value directly
                        mainCategoryId: Value(road.mainCategoryID),
                        secondaryCategoryId: Value(road.secondaryCategoryID),
                        districtId: Value(districtID),
                        createdAt: road.createdAt != null
                            ? Value(DateTime.parse(road.createdAt!))
                            : Value(DateTime.now()),
                        updatedAt: road.updatedAt != null
                            ? Value(DateTime.parse(road.updatedAt!))
                            : Value(DateTime.now()),
                        isSynced: const Value(true),
                      ),
                    );
              }
            }
          }
        }

        // Cache package roads
        if (packageData.packageRoads != null) {
          for (final packageRoad in packageData.packageRoads!) {
            if (packageRoad.uid != null && packageRoad.roadUID != null) {
              await _database
                  .into(_database.packageRoads)
                  .insertOnConflictUpdate(
                    PackageRoadsCompanion(
                      uid: Value(packageRoad.uid!),
                      roadUID: Value(packageRoad.roadUID!),
                      sectionStart: packageRoad.sectionStart != null
                          ? Value(packageRoad.sectionStart!)
                          : const Value.absent(),
                      sectionFinish: packageRoad.sectionFinish != null
                          ? Value(packageRoad.sectionFinish!)
                          : const Value.absent(),
                      createdAt: Value(DateTime.now()),
                      updatedAt: Value(DateTime.now()),
                      isSynced: const Value(true),
                    ),
                  );
            }
          }
        }
      });

      print('💾 Cached complete package data');
    } catch (e) {
      print('❌ Error caching package data: $e');
      rethrow;
    }
  }

  @override
  Future<void> clearRoadCache() async {
    try {
      await _database.transaction(() async {
        // Delete in correct order to respect foreign key constraints
        await _database.delete(_database.packageRoads).go();
        await _database.delete(_database.roads).go();
        await _database.delete(_database.roadCategories).go();
        await _database.delete(_database.districts).go();
        await _database.delete(_database.provinces).go();
        await _database.delete(_database.countries).go();
        await _database.delete(_database.packages).go();
      });
      print('🗑️ Road cache cleared successfully');
    } catch (e) {
      print('❌ Error clearing road cache: $e');
      rethrow;
    }
  }
}
