import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/district_entity.dart';
import '../../domain/entities/province_entity.dart';
import '../../domain/entities/road_entity.dart';
import '../../domain/usecases/clear_road_cache_usecase.dart';
import '../../domain/usecases/get_road_usecase.dart';
import 'road_event.dart';
import 'road_state.dart';

@injectable
class RoadBloc extends Bloc<RoadEvent, RoadState> {
  final GetRoadsUseCase _getRoadsUseCase;
  final ClearRoadCacheUseCase _clearRoadCacheUseCase;

  // Cache full data in memory
  List<Province> _allProvinces = [];
  List<District> _allDistricts = [];
  List<Road> _allRoads = [];

  RoadBloc(this._getRoadsUseCase, this._clearRoadCacheUseCase)
    : super(const RoadState.initial()) {
    on<LoadAllData>(_onLoadAllData);
    on<LoadRoadProvinces>(_onLoadProvinces);
    on<LoadRoadDistricts>(_onLoadDistricts);
    on<LoadRoadRoads>(_onLoadRoads);
    on<SelectRoadProvince>(_onSelectProvince);
    on<SelectRoadDistrict>(_onSelectDistrict);
    on<SelectRoadRoad>(_onSelectRoad);
    on<ClearRoadSelections>(_onClearSelections);
    on<ClearRoadCache>(_onClearCache);
  }

  // Helper to get current data
  RoadLoaded get _currentLoaded {
    return state.maybeWhen(
      loaded:
          (
            provinces,
            districts,
            roads,
            selectedProvince,
            selectedDistrict,
            selectedRoad,
          ) => RoadLoaded(
            provinces: provinces,
            districts: districts,
            roads: roads,
            selectedProvince: selectedProvince,
            selectedDistrict: selectedDistrict,
            selectedRoad: selectedRoad,
          ),
      orElse: () => const RoadLoaded(),
    );
  }

  Future<void> _onLoadAllData(
    LoadAllData event,
    Emitter<RoadState> emit,
  ) async {
    emit(const RoadState.loading());

    final result = await _getRoadsUseCase(
      GetRoadsParams(forceRefresh: event.forceRefresh),
    );

    result.fold((failure) => emit(RoadState.error(failure.message)), (
      packageData,
    ) {
      // Cache all data in memory
      _allProvinces = packageData.states ?? [];
      _allDistricts = packageData.districts ?? [];
      _allRoads = packageData.roads ?? [];

      emit(
        RoadState.loaded(
          provinces: _allProvinces,
          districts: _allDistricts,
          roads: _allRoads,
        ),
      );
    });
  }

  Future<void> _onLoadProvinces(
    LoadRoadProvinces event,
    Emitter<RoadState> emit,
  ) async {
    emit(const RoadState.loading());

    final result = await _getRoadsUseCase(
      GetRoadsParams(forceRefresh: event.forceRefresh),
    );

    result.fold((failure) => emit(RoadState.error(failure.message)), (
      packageData,
    ) {
      // Cache all data
      _allProvinces = packageData.states ?? [];
      _allDistricts = packageData.districts ?? [];
      _allRoads = packageData.roads ?? [];

      // Filter provinces by countryUid if provided
      List<Province> filteredProvinces = _allProvinces;
      if (event.countryUid != null) {
        filteredProvinces = _allProvinces
            .where((p) => p.country?.uid == event.countryUid)
            .toList();
      }

      final current = _currentLoaded;
      emit(
        RoadState.loaded(
          provinces: filteredProvinces,
          districts: current.districts,
          roads: current.roads,
        ),
      );
    });
  }

  Future<void> _onLoadDistricts(
    LoadRoadDistricts event,
    Emitter<RoadState> emit,
  ) async {
    // If data already loaded, just filter from memory
    if (_allDistricts.isNotEmpty) {
      final filteredDistricts = _allDistricts
          .where((d) => d.state?.uid == event.provinceUid)
          .toList();

      final current = _currentLoaded;
      emit(
        RoadState.loaded(
          provinces: current.provinces,
          districts: filteredDistricts,
          roads: current.roads,
          selectedProvince: current.selectedProvince,
        ),
      );
      return;
    }

    // Otherwise, load all data first
    emit(const RoadState.loading());

    final result = await _getRoadsUseCase(GetRoadsParams(forceRefresh: false));

    result.fold((failure) => emit(RoadState.error(failure.message)), (
      packageData,
    ) {
      _allProvinces = packageData.states ?? [];
      _allDistricts = packageData.districts ?? [];
      _allRoads = packageData.roads ?? [];

      // Filter districts by provinceUid
      final filteredDistricts = _allDistricts
          .where((d) => d.state?.uid == event.provinceUid)
          .toList();

      final current = _currentLoaded;
      emit(
        RoadState.loaded(
          provinces: current.provinces,
          districts: filteredDistricts,
          roads: current.roads,
          selectedProvince: current.selectedProvince,
        ),
      );
    });
  }

  Future<void> _onLoadRoads(
    LoadRoadRoads event,
    Emitter<RoadState> emit,
  ) async {
    // If data already loaded, just filter from memory
    if (_allRoads.isNotEmpty) {
      final filteredRoads = _allRoads
          .where((r) => r.district?.uid == event.districtUid)
          .toList();

      final current = _currentLoaded;
      emit(
        RoadState.loaded(
          provinces: current.provinces,
          districts: current.districts,
          roads: filteredRoads,
          selectedProvince: current.selectedProvince,
          selectedDistrict: current.selectedDistrict,
        ),
      );
      return;
    }

    // Otherwise, load all data first
    emit(const RoadState.loading());

    final result = await _getRoadsUseCase(GetRoadsParams(forceRefresh: false));

    result.fold((failure) => emit(RoadState.error(failure.message)), (
      packageData,
    ) {
      _allProvinces = packageData.states ?? [];
      _allDistricts = packageData.districts ?? [];
      _allRoads = packageData.roads ?? [];

      // Filter roads by districtUid
      final filteredRoads = _allRoads
          .where((r) => r.district?.uid == event.districtUid)
          .toList();

      final current = _currentLoaded;
      emit(
        RoadState.loaded(
          provinces: current.provinces,
          districts: current.districts,
          roads: filteredRoads,
          selectedProvince: current.selectedProvince,
          selectedDistrict: current.selectedDistrict,
        ),
      );
    });
  }

  Future<void> _onSelectProvince(
    SelectRoadProvince event,
    Emitter<RoadState> emit,
  ) async {
    final current = _currentLoaded;
    final selectedProvince = current.provinces.firstWhere(
      (province) => province.uid == event.uid,
    );

    emit(
      RoadState.loaded(
        provinces: current.provinces,
        districts: current.districts,
        roads: current.roads,
        selectedProvince: selectedProvince,
        selectedDistrict: null,
        selectedRoad: null,
      ),
    );
  }

  Future<void> _onSelectDistrict(
    SelectRoadDistrict event,
    Emitter<RoadState> emit,
  ) async {
    final current = _currentLoaded;
    final selectedDistrict = current.districts.firstWhere(
      (district) => district.uid == event.uid,
    );

    emit(
      RoadState.loaded(
        provinces: current.provinces,
        districts: current.districts,
        roads: current.roads,
        selectedProvince: current.selectedProvince,
        selectedDistrict: selectedDistrict,
        selectedRoad: null,
      ),
    );
  }

  Future<void> _onSelectRoad(
    SelectRoadRoad event,
    Emitter<RoadState> emit,
  ) async {
    final current = _currentLoaded;
    final selectedRoad = current.roads.firstWhere(
      (road) => road.uid == event.uid,
    );

    emit(
      RoadState.loaded(
        provinces: current.provinces,
        districts: current.districts,
        roads: current.roads,
        selectedProvince: current.selectedProvince,
        selectedDistrict: current.selectedDistrict,
        selectedRoad: selectedRoad,
      ),
    );
  }

  Future<void> _onClearSelections(
    ClearRoadSelections event,
    Emitter<RoadState> emit,
  ) async {
    final current = _currentLoaded;
    emit(
      RoadState.loaded(
        provinces: current.provinces,
        districts: current.districts,
        roads: current.roads,
      ),
    );
  }

  Future<void> _onClearCache(
    ClearRoadCache event,
    Emitter<RoadState> emit,
  ) async {
    emit(const RoadState.loading());

    await _clearRoadCacheUseCase();

    // Clear in-memory cache
    _allProvinces = [];
    _allDistricts = [];
    _allRoads = [];

    emit(const RoadState.initial());
  }
}
