import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/clear_all_location_cache_usecase.dart';
import '../../domain/usecases/clear_district_cache_usecase.dart';
import '../../domain/usecases/clear_province_cache_usecase.dart';
import '../../domain/usecases/clear_road_cache_usecase.dart';
import '../../domain/usecases/get_districts_usecase.dart';
import '../../domain/usecases/get_province_usecase.dart';
import '../../domain/usecases/get_roads_usecase.dart';
import 'location_event.dart';
import 'location_state.dart';

@injectable
class LocationBloc extends Bloc<LocationEvent, LocationState> {
  // final GetCountriesUseCase _getCountriesUseCase;
  final GetProvincesUseCase _getProvincesUseCase;
  final GetDistrictsUseCase _getDistrictsUseCase;
  final GetRoadsUseCase _getRoadsUseCase;
  // final ClearCountryCacheUseCase _clearCountryCacheUseCase;
  final ClearProvinceCacheUseCase _clearProvinceCacheUseCase;
  final ClearDistrictCacheUseCase _clearDistrictCacheUseCase;
  final ClearRoadCacheUseCase _clearRoadCacheUseCase;
  final ClearAllLocationCacheUseCase _clearAllLocationCacheUseCase;

  LocationBloc(
    // this._getCountriesUseCase,
    this._getProvincesUseCase,
    this._getDistrictsUseCase,
    this._getRoadsUseCase,
    // this._clearCountryCacheUseCase,
    this._clearProvinceCacheUseCase,
    this._clearDistrictCacheUseCase,
    this._clearRoadCacheUseCase,
    this._clearAllLocationCacheUseCase,
  ) : super(const LocationState.initial()) {
    // on<LoadCountries>(_onLoadCountries);
    on<LoadProvinces>(_onLoadProvinces);
    on<LoadDistricts>(_onLoadDistricts);
    on<LoadRoads>(_onLoadRoads);

    // on<SelectCountry>(_onSelectCountry);
    on<SelectProvince>(_onSelectProvince);
    on<SelectDistrict>(_onSelectDistrict);
    on<SelectRoad>(_onSelectRoad);

    on<ClearSelections>(_onClearSelections);
    on<ClearCache>(_onClearCache);
    on<ClearAllLocationCache>(_onClearAllLocationCache);
  }

  // Helper to get current data
  LocationLoaded get _currentLoaded {
    return state.maybeWhen(
      loaded:
          (
            // countries,
            provinces,
            districts,
            roads,

            // selectedCountry,
            selectedProvince,
            selectedDistrict,
            selectedRoad,
          ) => LocationLoaded(
            // countries: countries,
            provinces: provinces,
            districts: districts,
            roads: roads,

            // selectedCountry: selectedCountry,
            selectedProvince: selectedProvince,
            selectedDistrict: selectedDistrict,
            selectedRoad: selectedRoad,
          ),
      orElse: () => const LocationLoaded(),
    );
  }

  // Not in use yet
  //
  // Future<void> _onLoadCountries(
  //   LoadCountries event,
  //   Emitter<LocationState> emit,
  // ) async {
  //   emit(const LocationState.loading());

  //   final result = await _getCountriesUseCase(
  //     GetCountriesParams(forceRefresh: event.forceRefresh),
  //   );

  //   result.fold((failure) => emit(LocationState.error(failure.message)), (
  //     countries,
  //   ) {
  //     emit(
  //       LocationState.loaded(
  //         countries: countries,
  //         provinces: _currentLoaded.provinces,
  //         districts: _currentLoaded.districts,
  //         roads: _currentLoaded.roads,
  //       ),
  //     );
  //   });
  // }

  Future<void> _onLoadProvinces(
    LoadProvinces event,
    Emitter<LocationState> emit,
  ) async {
    emit(const LocationState.loading());

    final result = await _getProvincesUseCase(
      GetProvincesParams(
        countryUid: event.countryUid,
        forceRefresh: event.forceRefresh,
      ),
    );

    result.fold((failure) => emit(LocationState.error(failure.message)), (
      provinces,
    ) {
      final current = _currentLoaded;
      emit(
        LocationState.loaded(
          // countries: current.countries,
          provinces: provinces,
          districts: current.districts,
          roads: current.roads,

          // selectedCountry: current.selectedCountry,
        ),
      );
    });
  }

  Future<void> _onLoadDistricts(
    LoadDistricts event,
    Emitter<LocationState> emit,
  ) async {
    emit(const LocationState.loading());

    final result = await _getDistrictsUseCase(
      GetDistrictsParams(
        provinceUid: event.provinceUid,
        forceRefresh: event.forceRefresh,
      ),
    );

    result.fold((failure) => emit(LocationState.error(failure.message)), (
      districts,
    ) {
      final current = _currentLoaded;
      emit(
        LocationState.loaded(
          // countries: current.countries,
          provinces: current.provinces,
          districts: districts,
          roads: current.roads,

          // selectedCountry: current.selectedCountry,
          selectedProvince: current.selectedProvince,
        ),
      );
    });
  }

  Future<void> _onLoadRoads(
    LoadRoads event,
    Emitter<LocationState> emit,
  ) async {
    emit(const LocationState.loading());

    final result = await _getRoadsUseCase(
      GetRoadsParams(
        districtUid: event.districtUid,
        forceRefresh: event.forceRefresh,
      ),
    );

    result.fold((failure) => emit(LocationState.error(failure.message)), (
      roads,
    ) {
      final current = _currentLoaded;
      emit(
        LocationState.loaded(
          // countries: current.countries,
          provinces: current.provinces,
          districts: current.districts,
          roads: roads,

          // selectedCountry: current.selectedCountry,
          selectedProvince: current.selectedProvince,
          selectedDistrict: current.selectedDistrict,
        ),
      );
    });
  }

  // Not in use yet
  //
  // Future<void> _onSelectCountry(
  //   SelectCountry event,
  //   Emitter<LocationState> emit,
  // ) async {
  //   final current = _currentLoaded;
  //   final selectedCountry = current.countries.firstWhere(
  //     (country) => country.uid == event.uid,
  //   );

  //   emit(
  //     LocationState.loaded(
  //       countries: current.countries,
  //       provinces: current.provinces,
  //       districts: current.districts,
  //       roads: current.roads,
  //       selectedCountry: selectedCountry,
  //       // Clear child selections
  //       selectedProvince: null,
  //       selectedDistrict: null,
  //       selectedRoad: null,
  //     ),
  //   );
  // }

  Future<void> _onSelectProvince(
    SelectProvince event,
    Emitter<LocationState> emit,
  ) async {
    final current = _currentLoaded;
    final selectedProvince = current.provinces.firstWhere(
      (province) => province.uid == event.uid,
    );

    emit(
      LocationState.loaded(
        // countries: current.countries,
        provinces: current.provinces,
        districts: current.districts,
        roads: current.roads,

        // selectedCountry: current.selectedCountry,
        selectedProvince: selectedProvince,
        selectedDistrict: null,
        selectedRoad: null,
      ),
    );
  }

  Future<void> _onSelectDistrict(
    SelectDistrict event,
    Emitter<LocationState> emit,
  ) async {
    final current = _currentLoaded;
    final selectedDistrict = current.districts.firstWhere(
      (district) => district.uid == event.uid,
    );

    emit(
      LocationState.loaded(
        // countries: current.countries,
        provinces: current.provinces,
        districts: current.districts,
        roads: current.roads,

        // selectedCountry: current.selectedCountry,
        selectedProvince: current.selectedProvince,
        selectedDistrict: selectedDistrict,
        // Clear child selections
        selectedRoad: null,
      ),
    );
  }

  Future<void> _onSelectRoad(
    SelectRoad event,
    Emitter<LocationState> emit,
  ) async {
    final current = _currentLoaded;
    final selectedRoad = current.roads.firstWhere(
      (road) => road.uid == event.uid,
    );

    emit(
      LocationState.loaded(
        // countries: current.countries,
        provinces: current.provinces,
        districts: current.districts,
        roads: current.roads,

        // selectedCountry: current.selectedCountry,
        selectedProvince: current.selectedProvince,
        selectedDistrict: current.selectedDistrict,
        selectedRoad: selectedRoad,
      ),
    );
  }

  Future<void> _onClearSelections(
    ClearSelections event,
    Emitter<LocationState> emit,
  ) async {
    final current = _currentLoaded;
    emit(
      LocationState.loaded(
        // countries: current.countries,
        provinces: current.provinces,
        districts: current.districts,
        roads: current.roads,
      ),
    );
  }

  Future<void> _onClearCache(
    ClearCache event,
    Emitter<LocationState> emit,
  ) async {
    emit(const LocationState.loading());

    // await _clearCountryCacheUseCase();
    await _clearProvinceCacheUseCase();
    await _clearDistrictCacheUseCase();
    await _clearRoadCacheUseCase();

    emit(const LocationState.loaded());
  }

  Future<void> _onClearAllLocationCache(
    ClearAllLocationCache event,
    Emitter<LocationState> emit,
  ) async {
    emit(const LocationState.loading());

    final result = await _clearAllLocationCacheUseCase();

    result.fold((failure) => emit(LocationState.error(failure.message)), (_) {
      emit(const LocationState.initial());
      print('✅ All location cache cleared successfully');
    });
  }
}
