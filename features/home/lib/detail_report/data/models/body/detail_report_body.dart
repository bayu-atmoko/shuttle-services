import 'package:core/core.dart';

class DetailReportBody extends Equatable {
  const DetailReportBody({
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
