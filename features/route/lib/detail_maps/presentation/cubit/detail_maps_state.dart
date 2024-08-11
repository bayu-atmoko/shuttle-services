part of 'detail_maps_cubit.dart';

class DetailMapsStateCubit extends Equatable {
  const DetailMapsStateCubit({
    this.latLng,
  });

  final LatLng? latLng;

  DetailMapsStateCubit copyWith({
    LatLng? latLng,
  }) {
    return DetailMapsStateCubit(
      latLng: latLng ?? this.latLng,
    );
  }

  @override
  List<Object?> get props => [
        latLng,
      ];
}
