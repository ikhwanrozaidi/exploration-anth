import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:rclink_app/features/road/data/models/country_model.dart';
import 'package:rclink_app/features/road/data/models/road_category_model.dart';
import '../../../../core/database/app_database.dart';
import '../models/district_model.dart';
import '../models/province_model.dart';
import '../models/road_model.dart';

abstract class RoadLocalDataSource {
  // Cache clearing
  Future<void> clearProvinceCache();
  Future<void> clearDistrictCache();
  Future<void> clearRoadCache();

  // Province caching
  Future<List<ProvinceModel>?> getCachedProvinces();
  Future<void> cacheProvinces(List<ProvinceModel> provinces);

  // District caching
  Future<List<DistrictModel>?> getCachedDistricts();
  Future<void> cacheDistricts(List<DistrictModel> districts);

  // Road caching
  Future<List<RoadModel>?> getCachedRoads();
  Future<void> cacheRoads(List<RoadModel> roads);
}

@LazySingleton(as: RoadLocalDataSource)
class RoadLocalDataSourceImpl implements RoadLocalDataSource {
  final DatabaseService _databaseService;

  RoadLocalDataSourceImpl(this._databaseService);

  AppDatabase get _database => _databaseService.database;

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
  Future<List<ProvinceModel>?> getCachedProvinces() async {
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

      print('💾 Retrieved ${provinces.length} provinces from database');
      return provinces;
    } catch (e) {
      print('❌ Error loading cached provinces: $e');
      return null;
    }
  }

  @override
  Future<void> cacheProvinces(List<ProvinceModel> provinces) async {
    try {
      await _database.transaction(() async {
        // First, cache all unique countries
        final uniqueCountries = <int, CountryModel>{};
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
                  countryID: Value(province.countryID!),
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
  Future<List<DistrictModel>?> getCachedDistricts() async {
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

      print('💾 Retrieved ${districts.length} districts from database');
      return districts;
    } catch (e) {
      print('❌ Error loading cached districts: $e');
      return null;
    }
  }

  @override
  Future<void> cacheDistricts(List<DistrictModel> districts) async {
    try {
      await _database.transaction(() async {
        // First, cache all unique provinces and countries
        final uniqueProvinces = <int, ProvinceModel>{};
        final uniqueCountries = <int, CountryModel>{};

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
                  countryID: Value(province.countryID!),
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
                  stateId: Value(district.stateID!),
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
  Future<List<RoadModel>?> getCachedRoads() async {
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

      final roads = <RoadModel>[];

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
                    state:
                        null, // Don't fetch nested state to avoid complex joins
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

      print('💾 Retrieved ${roads.length} roads from database');
      return roads;
    } catch (e) {
      print('❌ Error loading cached roads: $e');
      return null;
    }
  }

  @override
  Future<void> cacheRoads(List<RoadModel> roads) async {
    try {
      await _database.transaction(() async {
        // Cache unique districts and road categories first
        final uniqueDistricts = <int, DistrictModel>{};
        final uniqueMainCategories = <int, RoadCategoryModel>{};
        final uniqueSecondaryCategories = <int, RoadCategoryModel>{};

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
                  stateId: Value(district.stateID!),
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
                  mainCategoryId: Value(road.mainCategoryID),
                  secondaryCategoryId: Value(road.secondaryCategoryID),
                  districtId: Value(road.districtID!),
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
}
