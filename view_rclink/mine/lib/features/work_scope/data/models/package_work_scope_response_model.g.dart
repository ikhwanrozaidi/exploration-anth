// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_work_scope_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FlatWorkScopeModel _$FlatWorkScopeModelFromJson(Map<String, dynamic> json) =>
    _FlatWorkScopeModel(
      id: (json['id'] as num).toInt(),
      uid: json['uid'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      description: json['description'] as String,
      allowMultipleQuantities: json['allowMultipleQuantities'] as bool,
    );

Map<String, dynamic> _$FlatWorkScopeModelToJson(_FlatWorkScopeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'code': instance.code,
      'description': instance.description,
      'allowMultipleQuantities': instance.allowMultipleQuantities,
    };

_FlatWorkQuantityTypeModel _$FlatWorkQuantityTypeModelFromJson(
  Map<String, dynamic> json,
) => _FlatWorkQuantityTypeModel(
  id: (json['id'] as num).toInt(),
  uid: json['uid'] as String,
  name: json['name'] as String,
  code: json['code'] as String,
  description: json['description'] as String?,
  workScopeUID: json['workScopeUID'] as String,
  displayOrder: (json['displayOrder'] as num).toInt(),
  hasSegmentBreakdown: json['hasSegmentBreakdown'] as bool,
  segmentSize: (json['segmentSize'] as num?)?.toInt(),
  maxSegmentLength: (json['maxSegmentLength'] as num?)?.toInt(),
);

Map<String, dynamic> _$FlatWorkQuantityTypeModelToJson(
  _FlatWorkQuantityTypeModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'name': instance.name,
  'code': instance.code,
  'description': instance.description,
  'workScopeUID': instance.workScopeUID,
  'displayOrder': instance.displayOrder,
  'hasSegmentBreakdown': instance.hasSegmentBreakdown,
  'segmentSize': instance.segmentSize,
  'maxSegmentLength': instance.maxSegmentLength,
};

_FlatQuantityFieldModel _$FlatQuantityFieldModelFromJson(
  Map<String, dynamic> json,
) => _FlatQuantityFieldModel(
  id: (json['id'] as num).toInt(),
  uid: json['uid'] as String,
  name: json['name'] as String,
  code: json['code'] as String,
  fieldType: json['fieldType'] as String,
  unit: json['unit'] as String?,
  validationRules: json['validationRules'] as String?,
  quantityTypeUID: json['quantityTypeUID'] as String,
  displayOrder: (json['displayOrder'] as num).toInt(),
  isRequired: json['isRequired'] as bool,
  isForSegment: json['isForSegment'] as bool,
  defaultValue: json['defaultValue'] as String?,
  placeholder: json['placeholder'] as String?,
  helpText: json['helpText'] as String?,
);

Map<String, dynamic> _$FlatQuantityFieldModelToJson(
  _FlatQuantityFieldModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'name': instance.name,
  'code': instance.code,
  'fieldType': instance.fieldType,
  'unit': instance.unit,
  'validationRules': instance.validationRules,
  'quantityTypeUID': instance.quantityTypeUID,
  'displayOrder': instance.displayOrder,
  'isRequired': instance.isRequired,
  'isForSegment': instance.isForSegment,
  'defaultValue': instance.defaultValue,
  'placeholder': instance.placeholder,
  'helpText': instance.helpText,
};

_FlatFieldOptionModel _$FlatFieldOptionModelFromJson(
  Map<String, dynamic> json,
) => _FlatFieldOptionModel(
  id: (json['id'] as num).toInt(),
  uid: json['uid'] as String,
  value: json['value'] as String,
  quantityFieldUID: json['quantityFieldUID'] as String,
  displayOrder: (json['displayOrder'] as num).toInt(),
);

Map<String, dynamic> _$FlatFieldOptionModelToJson(
  _FlatFieldOptionModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'value': instance.value,
  'quantityFieldUID': instance.quantityFieldUID,
  'displayOrder': instance.displayOrder,
};

_WorkScopeEquipmentJunctionModel _$WorkScopeEquipmentJunctionModelFromJson(
  Map<String, dynamic> json,
) => _WorkScopeEquipmentJunctionModel(
  workScopeUID: json['workScopeUID'] as String,
  workEquipmentUID: json['workEquipmentUID'] as String,
);

Map<String, dynamic> _$WorkScopeEquipmentJunctionModelToJson(
  _WorkScopeEquipmentJunctionModel instance,
) => <String, dynamic>{
  'workScopeUID': instance.workScopeUID,
  'workEquipmentUID': instance.workEquipmentUID,
};

_PackageWorkScopeJunctionModel _$PackageWorkScopeJunctionModelFromJson(
  Map<String, dynamic> json,
) => _PackageWorkScopeJunctionModel(
  uid: json['uid'] as String,
  workScopeUID: json['workScopeUID'] as String,
);

Map<String, dynamic> _$PackageWorkScopeJunctionModelToJson(
  _PackageWorkScopeJunctionModel instance,
) => <String, dynamic>{
  'uid': instance.uid,
  'workScopeUID': instance.workScopeUID,
};

_PackageWorkScopeResponseModel _$PackageWorkScopeResponseModelFromJson(
  Map<String, dynamic> json,
) => _PackageWorkScopeResponseModel(
  package: PackageModel.fromJson(json['package'] as Map<String, dynamic>),
  workScopes:
      (json['workScopes'] as List<dynamic>?)
          ?.map((e) => FlatWorkScopeModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  packageWorkScopes:
      (json['packageWorkScopes'] as List<dynamic>?)
          ?.map(
            (e) => PackageWorkScopeJunctionModel.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const [],
  quantityTypes:
      (json['quantityTypes'] as List<dynamic>?)
          ?.map(
            (e) =>
                FlatWorkQuantityTypeModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  quantityFields:
      (json['quantityFields'] as List<dynamic>?)
          ?.map(
            (e) => FlatQuantityFieldModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  fieldOptions:
      (json['fieldOptions'] as List<dynamic>?)
          ?.map((e) => FlatFieldOptionModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  workEquipments:
      (json['workEquipments'] as List<dynamic>?)
          ?.map((e) => WorkEquipmentModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  workScopeEquipments:
      (json['workScopeEquipments'] as List<dynamic>?)
          ?.map(
            (e) => WorkScopeEquipmentJunctionModel.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$PackageWorkScopeResponseModelToJson(
  _PackageWorkScopeResponseModel instance,
) => <String, dynamic>{
  'package': instance.package,
  'workScopes': instance.workScopes,
  'packageWorkScopes': instance.packageWorkScopes,
  'quantityTypes': instance.quantityTypes,
  'quantityFields': instance.quantityFields,
  'fieldOptions': instance.fieldOptions,
  'workEquipments': instance.workEquipments,
  'workScopeEquipments': instance.workScopeEquipments,
};
