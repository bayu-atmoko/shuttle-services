part of 'distance_matrix_bloc.dart';

@immutable
abstract class DistanceMatrixEvent extends Equatable {}

class FetchDistanceMatrix extends DistanceMatrixEvent {
  FetchDistanceMatrix(this.body);

  final DistanceMatrixBody body;

  @override
  List<Object?> get props => [body];
}
