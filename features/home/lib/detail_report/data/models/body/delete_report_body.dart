import 'package:core/core.dart';

class DeleteReportBody extends Equatable {
  const DeleteReportBody({
    required this.reportId,
  });

  final String reportId;

  Map<String, dynamic> toMap() {
    return {};
  }

  @override
  List<Object?> get props => [
        reportId,
      ];
}
