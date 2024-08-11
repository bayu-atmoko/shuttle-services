import 'package:core/core.dart';

class DeleteReportEntity extends Equatable {
  const DeleteReportEntity({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final dynamic data;

  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}
