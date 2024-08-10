import 'package:core/core.dart';
import 'dart:convert';

class DistanceMatrixResponse extends Equatable {
  final String? status;
  final List<String>? originAddresses;
  final List<String>? destinationAddresses;
  final List<Row>? rows;

  const DistanceMatrixResponse({
    this.status,
    this.originAddresses,
    this.destinationAddresses,
    this.rows,
  });

  factory DistanceMatrixResponse.fromMap(Map<String, dynamic> json) =>
      DistanceMatrixResponse(
        status: json['status'],
        originAddresses: json['origin_addresses'] == null
            ? null
            : List.from((json['origin_addresses'] as List).map((x) => x)),
        destinationAddresses: json['destination_addresses'] == null
            ? null
            : List.from((json['destination_addresses'] as List).map((x) => x)),
        rows: json['rows'] == null
            ? null
            : List<Row>.from(
                (json['rows'] as List).map((x) => Row.fromJson(x))),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'origin_addresses': originAddresses?.map((x) => x).toList(),
        'destination_addresses': destinationAddresses?.map((x) => x).toList(),
        'rows': rows?.map((x) => x.toJson()).toList(),
      };

  String toJson() => json.encode(toMap());

  factory DistanceMatrixResponse.fromJson(String source) =>
      DistanceMatrixResponse.fromMap(json.decode(source));

  @override
  List<Object?> get props =>
      [status, originAddresses, destinationAddresses, rows];
}

class Distance extends Equatable {
  final String? text;
  final int? value;

  const Distance({this.text, this.value});

  factory Distance.fromJson(Map<String, dynamic> json) => Distance(
        text: json['text'],
        value: json['value'],
      );

  Map<String, dynamic> toJson() => {
        'text': text,
        'value': value,
      };

  @override
  List<Object?> get props => [text, value];
}

class Duration extends Equatable {
  final String? text;
  final int? value;

  const Duration({this.text, this.value});

  factory Duration.fromJson(Map<String, dynamic> json) => Duration(
        text: json['text'],
        value: json['value'],
      );

  Map<String, dynamic> toJson() => {
        'text': text,
        'value': value,
      };

  @override
  List<Object?> get props => [text, value];
}

class Element extends Equatable {
  final Distance? distance;
  final Duration? duration;
  final String? status;

  const Element({this.distance, this.duration, this.status});

  factory Element.fromJson(Map<String, dynamic> json) => Element(
        distance: json['distance'] == null
            ? null
            : Distance.fromJson(json['distance']),
        duration: json['duration'] == null
            ? null
            : Duration.fromJson(json['duration']),
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
        'distance': distance?.toJson(),
        'duration': duration?.toJson(),
        'status': status,
      };

  @override
  List<Object?> get props => [distance, duration, status];
}

class Row extends Equatable {
  final List<Element>? elements;

  const Row({this.elements});

  factory Row.fromJson(Map<String, dynamic> json) => Row(
        elements: json['elements'] == null
            ? null
            : List<Element>.from(
                (json['elements'] as List).map((x) => Element.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
        'elements': elements?.map((x) => x.toJson()).toList(),
      };

  @override
  List<Object?> get props => [elements];
}
