import 'package:core/core.dart';

class DirectionBody extends Equatable {
  const DirectionBody({
    this.key,
    this.origin,
    this.destination,
    this.mode,
  });

  final String? key;
  final String? origin;
  final String? destination;
  final String? mode;

  Map<String, dynamic> toMap() {
    return {
      if (key != null) 'key': key,
      if (origin != null) 'origin': origin,
      if (destination != null) 'destination': destination,
      if (mode != null) 'mode': mode,
    };
  }

  @override
  List<Object?> get props => [
        key,
        origin,
        destination,
        mode,
      ];
}
