import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/entities/country_entity.dart';
import '../../domain/entities/district_entity.dart';
import '../../domain/entities/province_entity.dart';
import '../../domain/entities/road_category_entity.dart';
import '../../domain/entities/road_entity.dart';

abstract class LocationLocalDataSource {
  // Provinces
  Future<List<Province>> getCachedProvinces();
  Future<List<Province>> getCachedProvincesByCountryId(String countryUid);
  Future<void> cacheProvinces(List<Province> provinces);
  Future<void> clearProvinceCache();

  // Districts
  Future<List<District>> getCachedDistricts();
  Future<List<District>> getCachedDistrictsByProvinceId(String provinceUid);
  Future<void> cacheDistricts(List<District> districts);
  Future<void> clearDistrictCache();

  // Roads
  Future<List<Road>> getCachedRoads();
  Future<List<Road>> getCachedRoadsByDistrictId(String districtUid);
  Future<void> cacheRoads(List<Road> roads);
  Future<void> clearRoadCache();

  Future<void> clearAllLocationCache();
}

@LazySingleton(as: LocationLocalDataSource)
class LocationLocalDataSourceImpl implements LocationLocalDataSource {
  final DatabaseService _databaseService;

  LocationLocalDataSourceImpl(this._databaseService);

  AppDatabase get _database => _databaseService.database;

  // =============================================
  // Provinces datasource
  // =============================================
  @override
  Future<List<Province>> getCachedProvinces() async {
    try {
      final query = _database.select(_database.provinces).join([
        leftOuterJoin(
          _database.countries,
          _database.countries.id.equalsExp(_database.provinces.countryID),
        ),
      ]);

      final results = await query.get();

      if (results.isEmpty) {
        print('💾 No cached provinces found');
        return [];
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
              ? CountryLocation(
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
      return [];
    }
  }

  @override
  Future<List<Province>> getCachedProvincesByCountryId(
    String countryUid,
  ) async {
    try {
      final query = _database.select(_database.provinces).join([
        leftOuterJoin(
          _database.countries,
          _database.countries.id.equalsExp(_database.provinces.countryID),
        ),
      ])..where(_database.countries.uid.equals(countryUid));

      final results = await query.get();

      if (results.isEmpty) {
        print('💾 No cached provinces found for country: $countryUid');
        return [];
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
              ? CountryLocation(
                  id: country.id,
                  uid: country.uid,
                  name: country.name,
                  createdAt: country.createdAt.toIso8601String(),
                  updatedAt: country.updatedAt.toIso8601String(),
                )
              : null,
        );
      }).toList();

      print(
        '💾 Retrieved ${provinces.length} provinces for country: $countryUid',
      );
      return provinces;
    } catch (e) {
      print('❌ Error loading cached provinces by countryId: $e');
      return [];
    }
  }

  @override
  Future<void> cacheProvinces(List<Province> provinces) async {
    try {
      await _database.transaction(() async {
        if (provinces.isEmpty) {
          print('⚠️ No provinces to cache');
          return;
        }

        final countryId = provinces.first.countryId;

        if (countryId != null) {
          await (_database.delete(
            _database.provinces,
          )..where((tbl) => tbl.countryID.equals(countryId))).go();
          print('🗑️ Deleted old provinces for country ID: $countryId');
        }

        // final uniqueCountries = <int, CountryLocation>{};
        // for (final province in provinces) {
        //   if (province.country != null && province.country!.id != null) {
        //     uniqueCountries[province.country!.id!] = province.country!;
        //   }
        // }
        // for (final country in uniqueCountries.values) {
        //   await _database
        //       .into(_database.countries)
        //       .insertOnConflictUpdate(
        //         CountriesCompanion(
        //           id: Value(country.id!),
        //           uid: Value(country.uid!),
        //           name: Value(country.name!),
        //           createdAt: Value(DateTime.parse(country.createdAt!)),
        //           updatedAt: Value(DateTime.parse(country.updatedAt!)),
        //           isSynced: const Value(true),
        //         ),
        //       );
        // }

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
  Future<void> clearProvinceCache() async {
    try {
      await _database.transaction(() async {
        await _database.delete(_database.roads).go();
        await _database.delete(_database.districts).go();
        await _database.delete(_database.provinces).go();
      });
      print('✅ Province cache cleared from database');
    } catch (e) {
      print('❌ Error clearing province cache: $e');
    }
  }

  // =============================================
  // District datasource
  // =============================================

  @override
  Future<List<District>> getCachedDistricts() async {
    try {
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
        return [];
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
                      ? CountryLocation(
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
      return [];
    }
  }

  @override
  Future<List<District>> getCachedDistrictsByProvinceId(
    String provinceUid,
  ) async {
    try {
      final query = _database.select(_database.districts).join([
        leftOuterJoin(
          _database.provinces,
          _database.provinces.id.equalsExp(_database.districts.stateId),
        ),
        leftOuterJoin(
          _database.countries,
          _database.countries.id.equalsExp(_database.provinces.countryID),
        ),
      ])..where(_database.provinces.uid.equals(provinceUid));

      final results = await query.get();

      if (results.isEmpty) {
        print('💾 No cached districts found for province: $provinceUid');
        return [];
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
                      ? CountryLocation(
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

      print(
        '💾 Retrieved ${districts.length} districts for province: $provinceUid',
      );
      return districts;
    } catch (e) {
      print('❌ Error loading cached districts by provinceId: $e');
      return [];
    }
  }

  @override
  Future<void> cacheDistricts(List<District> districts) async {
    try {
      await _database.transaction(() async {
        if (districts.isEmpty) {
          print('⚠️ No districts to cache');
          return;
        }

        final provinceId = districts.first.stateId;

        if (provinceId != null) {
          await (_database.delete(
            _database.districts,
          )..where((tbl) => tbl.stateId.equals(provinceId))).go();
          print('🗑️ Deleted old districts for province ID: $provinceId');
        }

        final uniqueProvinces = <int, Province>{};

        // final uniqueCountries = <int, CountryLocation>{};
        for (final district in districts) {
          if (district.state != null && district.state!.id != null) {
            uniqueProvinces[district.state!.id!] = district.state!;

            // if (district.state!.country != null &&
            //     district.state!.country!.id != null) {
            //   uniqueCountries[district.state!.country!.id!] =
            //       district.state!.country!;
            // }
          }
        }

        // for (final country in uniqueCountries.values) {
        //   await _database
        //       .into(_database.countries)
        //       .insertOnConflictUpdate(
        //         CountriesCompanion(
        //           id: Value(country.id!),
        //           uid: Value(country.uid!),
        //           name: Value(country.name!),
        //           createdAt: Value(DateTime.parse(country.createdAt!)),
        //           updatedAt: Value(DateTime.parse(country.updatedAt!)),
        //           isSynced: const Value(true),
        //         ),
        //       );
        // }

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

        for (final district in districts) {
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
      });

      print('💾 Cached ${districts.length} districts in database');
    } catch (e) {
      print('❌ Error caching districts: $e');
    }
  }

  @override
  Future<void> clearDistrictCache() async {
    try {
      await _database.transaction(() async {
        await _database.delete(_database.roads).go();
        await _database.delete(_database.districts).go();
      });
      print('✅ District cache cleared from database');
    } catch (e) {
      print('❌ Error clearing district cache: $e');
    }
  }

  // =============================================
  // Road datasource
  // =============================================

  @override
  Future<List<Road>> getCachedRoads() async {
    try {
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
        return [];
      }

      final roads = <Road>[];

      for (final row in results) {
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
                    state: null,
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
      return [];
    }
  }

  @override
  Future<List<Road>> getCachedRoadsByDistrictId(String districtUid) async {
    try {
      final query = _database.select(_database.roads).join([
        leftOuterJoin(
          _database.districts,
          _database.districts.id.equalsExp(_database.roads.districtId),
        ),
        leftOuterJoin(
          _database.roadCategories,
          _database.roadCategories.id.equalsExp(_database.roads.mainCategoryId),
        ),
      ])..where(_database.districts.uid.equals(districtUid));

      final results = await query.get();

      if (results.isEmpty) {
        print('💾 No cached roads found for district: $districtUid');
        return [];
      }

      final roads = <Road>[];

      for (final row in results) {
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
                    state: null,
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

      print('💾 Retrieved ${roads.length} roads for district: $districtUid');
      return roads;
    } catch (e) {
      print('❌ Error loading cached roads by districtId: $e');
      return [];
    }
  }

  @override
  Future<void> cacheRoads(List<Road> roads) async {
    try {
      await _database.transaction(() async {
        if (roads.isEmpty) {
          print('⚠️ No roads to cache');
          return;
        }

        final districtId = roads.first.districtId;

        if (districtId != null) {
          await (_database.delete(
            _database.roads,
          )..where((tbl) => tbl.districtId.equals(districtId))).go();
          print('🗑️ Deleted old roads for district ID: $districtId');
        }

        final uniqueDistricts = <int, District>{};
        final uniqueProvinces = <int, Province>{};
        // final uniqueCountries = <int, CountryLocation>{};
        final uniqueMainCategories = <int, RoadCategory>{};
        final uniqueSecondaryCategories = <int, RoadCategory>{};

        for (final road in roads) {
          if (road.district != null && road.district!.id != null) {
            uniqueDistricts[road.district!.id!] = road.district!;

            if (road.district!.state != null &&
                road.district!.state!.id != null) {
              uniqueProvinces[road.district!.state!.id!] =
                  road.district!.state!;

              // if (road.district!.state!.country != null &&
              //     road.district!.state!.country!.id != null) {
              //   uniqueCountries[road.district!.state!.country!.id!] =
              //       road.district!.state!.country!;
              // }
            }
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

        // for (final country in uniqueCountries.values) {
        //   await _database
        //       .into(_database.countries)
        //       .insertOnConflictUpdate(
        //         CountriesCompanion(
        //           id: Value(country.id!),
        //           uid: Value(country.uid!),
        //           name: Value(country.name!),
        //           createdAt: Value(DateTime.parse(country.createdAt!)),
        //           updatedAt: Value(DateTime.parse(country.updatedAt!)),
        //           isSynced: const Value(true),
        //         ),
        //       );
        // }

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

        for (final category in uniqueMainCategories.values) {
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

        for (final category in uniqueSecondaryCategories.values) {
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

        for (final road in roads) {
          await _database
              .into(_database.roads)
              .insertOnConflictUpdate(
                RoadsCompanion(
                  id: Value(road.id!),
                  uid: Value(road.uid!),
                  name: Value(road.name!),
                  roadNo: Value(road.roadNo ?? ''),
                  sectionStart: Value(road.sectionStart ?? ''),
                  sectionFinish: Value(road.sectionFinish ?? ''),
                  mainCategoryId: Value(road.mainCategoryId!),
                  secondaryCategoryId: road.secondaryCategoryId != null
                      ? Value(road.secondaryCategoryId!)
                      : const Value.absent(),
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
  Future<void> clearRoadCache() async {
    try {
      await _database.delete(_database.roads).go();
      print('✅ Road cache cleared from database');
    } catch (e) {
      print('❌ Error clearing road cache: $e');
    }
  }

  @override
  Future<void> clearAllLocationCache() async {
    try {
      await _database.transaction(() async {
        await _database.delete(_database.roads).go();
        print('🗑️ Cleared all roads from cache');

        await _database.delete(_database.districts).go();
        print('🗑️ Cleared all districts from cache');

        await _database.delete(_database.provinces).go();
        print('🗑️ Cleared all provinces from cache');

        await _database.delete(_database.roadCategories).go();
        print('🗑️ Cleared all road categories from cache');
      });

      print('✅ Successfully cleared all location cache from database');
    } catch (e) {
      print('❌ Error clearing all location cache: $e');
      rethrow;
    }
  }
}
