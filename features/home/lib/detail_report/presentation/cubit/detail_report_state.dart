part of 'detail_report_cubit.dart';

class DetailReportStateCubit extends Equatable {
  const DetailReportStateCubit({
    this.report,
    this.garbagePhotoCleanedFile,
    this.isPhotoValid,
    this.userRole,
  });

  final DataDetailReport? report;
  final String? userRole;

  /// image from file picker
  final List<XFile>? garbagePhotoCleanedFile;
  final bool? isPhotoValid;

  DetailReportStateCubit copyWith({
    DataDetailReport? report,
    String? userRole,
    List<XFile>? garbagePhotoCleanedFile,
    bool? isPhotoValid,
  }) {
    return DetailReportStateCubit(
      report: report ?? this.report,
      userRole: userRole ?? this.userRole,
      garbagePhotoCleanedFile:
          garbagePhotoCleanedFile ?? this.garbagePhotoCleanedFile,
      isPhotoValid: isPhotoValid ?? this.isPhotoValid,
    );
  }

  @override
  List<Object?> get props => [
        report,
        userRole,
        garbagePhotoCleanedFile,
        isPhotoValid,
      ];
}
