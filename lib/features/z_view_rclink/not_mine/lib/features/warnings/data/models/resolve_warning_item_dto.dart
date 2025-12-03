import 'package:freezed_annotation/freezed_annotation.dart';

part 'resolve_warning_item_dto.freezed.dart';
part 'resolve_warning_item_dto.g.dart';

@freezed
abstract class ResolveWarningItemDto with _$ResolveWarningItemDto {
  const factory ResolveWarningItemDto({
    String? notes,
  }) = _ResolveWarningItemDto;

  factory ResolveWarningItemDto.fromJson(Map<String, dynamic> json) =>
      _$ResolveWarningItemDtoFromJson(json);
}
