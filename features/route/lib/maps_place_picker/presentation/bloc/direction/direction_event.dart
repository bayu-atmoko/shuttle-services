part of 'direction_bloc.dart';

@immutable
abstract class DirectionEvent extends Equatable {}

class FetchDirection extends DirectionEvent {
  FetchDirection(this.body);

  final DirectionBody body;

  @override
  List<Object?> get props => [body];
}
