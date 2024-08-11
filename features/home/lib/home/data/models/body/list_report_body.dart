import 'package:core/core.dart';

class ListReportBody extends Equatable {
  const ListReportBody({
    this.page = 1,
    this.perPage = 1000,
    required this.status,
    this.search = '',
    this.sort = '',
    this.sortType = '',
    this.startDate,
    this.endDate,
  });

  final int page;
  final int perPage;
  final String status;
  final String search;
  final String sort;
  final String sortType;
  final DateTime? startDate;
  final DateTime? endDate;

  Map<String, dynamic> toMap() {
    return {};
  }

  @override
  List<Object?> get props => [
        page,
        perPage,
        status,
        search,
        sort,
        sortType,
        startDate,
        endDate,
      ];
}
