part of 'home_cubit.dart';

class HomeStateCubit extends Equatable {
  const HomeStateCubit({
    this.reportNew,
    this.reportAssigned,
    this.reportCleaned,
    this.reportFinish,
    this.reportCancel,
  });

  final List<AlphaDataListReport>? reportNew;
  final List<AlphaDataListReport>? reportAssigned;
  final List<AlphaDataListReport>? reportCleaned;
  final List<AlphaDataListReport>? reportFinish;
  final List<AlphaDataListReport>? reportCancel;

  HomeStateCubit copyWith({
    List<AlphaDataListReport>? reportNew,
    List<AlphaDataListReport>? reportAssigned,
    List<AlphaDataListReport>? reportCleaned,
    List<AlphaDataListReport>? reportFinish,
    List<AlphaDataListReport>? reportCancel,
  }) {
    return HomeStateCubit(
      reportNew: reportNew ?? this.reportNew,
      reportAssigned: reportAssigned ?? this.reportAssigned,
      reportCleaned: reportCleaned ?? this.reportCleaned,
      reportFinish: reportFinish ?? this.reportFinish,
      reportCancel: reportCancel ?? this.reportCancel,
    );
  }

  @override
  List<Object?> get props => [
        reportNew,
        reportAssigned,
        reportCleaned,
        reportFinish,
        reportCancel,
      ];
}
