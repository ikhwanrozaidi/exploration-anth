import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'created_by_nested_entity.g.dart';

@JsonSerializable()
class CreatedByNested extends Equatable {
  final int? id;
  final String? uid;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? email;

  const CreatedByNested({
    this.id,
    this.uid,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
  });

  factory CreatedByNested.fromJson(Map<String, dynamic> json) =>
      _$CreatedByNestedFromJson(json);

  Map<String, dynamic> toJson() => _$CreatedByNestedToJson(this);

  CreatedByNested copyWith({
    int? id,
    String? uid,
    String? firstName,
    String? lastName,
    String? phone,
    String? email,
  }) {
    return CreatedByNested(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
    );
  }

  @override
  List<Object?> get props => [id, uid, firstName, lastName, phone, email];
}
