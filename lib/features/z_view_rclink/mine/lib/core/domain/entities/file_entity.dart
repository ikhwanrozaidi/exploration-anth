import 'package:equatable/equatable.dart';

class FileEntity extends Equatable {
  final int id;
  final String uid;
  final String fileName;
  final String s3Url;
  final String mimeType;
  final int size;
  final int? sequence;
  final int companyID;
  final String contextType;
  final String? contextField;
  final int uploadedByID;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const FileEntity({
    required this.id,
    required this.uid,
    required this.fileName,
    required this.s3Url,
    required this.mimeType,
    required this.size,
    this.sequence,
    required this.companyID,
    required this.contextType,
    this.contextField,
    required this.uploadedByID,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        uid,
        fileName,
        s3Url,
        mimeType,
        size,
        sequence,
        companyID,
        contextType,
        contextField,
        uploadedByID,
        createdAt,
        updatedAt,
      ];

  FileEntity copyWith({
    int? id,
    String? uid,
    String? fileName,
    String? s3Url,
    String? mimeType,
    int? size,
    int? sequence,
    int? companyID,
    String? contextType,
    String? contextField,
    int? uploadedByID,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return FileEntity(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      fileName: fileName ?? this.fileName,
      s3Url: s3Url ?? this.s3Url,
      mimeType: mimeType ?? this.mimeType,
      size: size ?? this.size,
      sequence: sequence ?? this.sequence,
      companyID: companyID ?? this.companyID,
      contextType: contextType ?? this.contextType,
      contextField: contextField ?? this.contextField,
      uploadedByID: uploadedByID ?? this.uploadedByID,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
