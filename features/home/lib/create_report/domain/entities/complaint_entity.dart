import 'package:core/core.dart';

class ComplaintEntity extends Equatable {
  const ComplaintEntity({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final List<DataComplaint>? data;

  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}

class DataComplaint extends Equatable {
  const DataComplaint({
    required this.complaintId,
    required this.title,
    required this.complaintType,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? complaintId;
  final String? title;
  final String? complaintType;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  @override
  List<Object?> get props => [
        complaintId,
        title,
        complaintType,
        description,
        createdAt,
        updatedAt,
      ];
}
