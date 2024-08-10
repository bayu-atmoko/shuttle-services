import 'package:core/core.dart';

class DistanceMatrixEntity extends Equatable {
  final String? status;
  final List<String>? originAddresses;
  final List<String>? destinationAddresses;
  final List<Row>? rows;

  const DistanceMatrixEntity({
    required this.status,
    required this.originAddresses,
    required this.destinationAddresses,
    required this.rows,
  });

  @override
  List<Object?> get props =>
      [status, originAddresses, destinationAddresses, rows];
}

class Distance extends Equatable {
  final String? text;
  final int? value;

  const Distance({required this.text, required this.value});

  @override
  List<Object?> get props => [text, value];
}

class Duration extends Equatable {
  final String? text;
  final int? value;

  const Duration({required this.text, required this.value});

  @override
  List<Object?> get props => [text, value];
}

class Element extends Equatable {
  final Distance? distance;
  final Duration? duration;
  final String? status;

  const Element({
    required this.distance,
    required this.duration,
    required this.status,
  });

  @override
  List<Object?> get props => [distance, duration, status];
}

class Row extends Equatable {
  final List<Element>? elements;

  const Row({required this.elements});

  @override
  List<Object?> get props => [elements];
}
