import 'package:core/core.dart';

class ListRouteBody extends Equatable {
  const ListRouteBody({
    required this.page,
    required this.perPage,
    required this.sort,
    required this.sortType,
  });

  final int page;
  final int perPage;
  final String sort;
  final String sortType;

  Map<String, dynamic> toMap() {
    return {};
  }

  @override
  List<Object?> get props => [
        page,
        perPage,
        sort,
        sortType,
      ];
}
