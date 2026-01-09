import 'package:equatable/equatable.dart';
import '../../../road/domain/entities/road_entity.dart';
import '../../../contractor_relation/domain/entities/contractor_relation_entity.dart';

class ProgramDraftData extends Equatable {
  // For local drafts, these are temporary
  final String? uid; // Generated locally for drafts, from API for submitted
  final bool isDraftMode; // true if status = 'DRAFT'
  final String companyUID;

  // Work Scope
  final int workScopeID;
  final String workScopeUID;
  final String workScopeName;
  final String workScopeCode;

  // Road (for R02)
  final Road? road;

  // Contractor (for non-R02)
  final ContractorRelation? contractor;

  // Program Details
  final String? name;
  final String? description;

  // Period
  final DateTime? periodStart;
  final DateTime? periodEnd;

  // Calculation (from program-settings API)
  final String? calculationType; // SECTION_BASED, FIXED_COUNT
  final String? fromSection;
  final String? toSection;
  final String? dividerValue;
  final String? inputValue;

  // Quantities (composite key format: "quantityTypeUID_sequenceNo")
  final Map<String, Map<String, dynamic>> quantityFieldData;

  // Images (stored separately via ImageLocalDataSource)
  final List<String> programImages;

  // GPS
  final double? latitude;
  final double? longitude;

  // Status
  final String status; // DRAFT, SUBMITTED, ACTIVE, etc.

  const ProgramDraftData({
    this.uid,
    required this.isDraftMode,
    required this.companyUID,
    required this.workScopeID,
    required this.workScopeUID,
    required this.workScopeName,
    required this.workScopeCode,
    this.road,
    this.contractor,
    this.name,
    this.description,
    this.periodStart,
    this.periodEnd,
    this.calculationType,
    this.fromSection,
    this.toSection,
    this.dividerValue,
    this.inputValue,
    this.quantityFieldData = const {},
    this.programImages = const [],
    this.latitude,
    this.longitude,
    this.status = 'DRAFT',
  });

  ProgramDraftData copyWith({
    String? uid,
    bool? isDraftMode,
    String? companyUID,
    int? workScopeID,
    String? workScopeUID,
    String? workScopeName,
    String? workScopeCode,
    Road? road,
    ContractorRelation? contractor,
    String? name,
    String? description,
    DateTime? periodStart,
    DateTime? periodEnd,
    String? calculationType,
    String? fromSection,
    String? toSection,
    String? dividerValue,
    String? inputValue,
    Map<String, Map<String, dynamic>>? quantityFieldData,
    List<String>? programImages,
    double? latitude,
    double? longitude,
    String? status,
  }) {
    return ProgramDraftData(
      uid: uid ?? this.uid,
      isDraftMode: isDraftMode ?? this.isDraftMode,
      companyUID: companyUID ?? this.companyUID,
      workScopeID: workScopeID ?? this.workScopeID,
      workScopeUID: workScopeUID ?? this.workScopeUID,
      workScopeName: workScopeName ?? this.workScopeName,
      workScopeCode: workScopeCode ?? this.workScopeCode,
      road: road ?? this.road,
      contractor: contractor ?? this.contractor,
      name: name ?? this.name,
      description: description ?? this.description,
      periodStart: periodStart ?? this.periodStart,
      periodEnd: periodEnd ?? this.periodEnd,
      calculationType: calculationType ?? this.calculationType,
      fromSection: fromSection ?? this.fromSection,
      toSection: toSection ?? this.toSection,
      dividerValue: dividerValue ?? this.dividerValue,
      inputValue: inputValue ?? this.inputValue,
      quantityFieldData: quantityFieldData ?? this.quantityFieldData,
      programImages: programImages ?? this.programImages,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
    uid,
    isDraftMode,
    companyUID,
    workScopeID,
    workScopeUID,
    workScopeName,
    workScopeCode,
    road,
    contractor,
    name,
    description,
    periodStart,
    periodEnd,
    calculationType,
    fromSection,
    toSection,
    dividerValue,
    inputValue,
    quantityFieldData,
    programImages,
    latitude,
    longitude,
    status,
  ];
}
