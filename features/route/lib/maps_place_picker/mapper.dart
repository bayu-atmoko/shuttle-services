import 'data/models/response/place_autocomplete_response.dart'
    as place_autocomplete_response;
import 'domain/entities/place_autocomplete_entity.dart'
    as place_autocomplete_entity;
import 'data/models/response/geocoding_response.dart' as geocoding_response;
import 'domain/entities/geocoding_entity.dart' as geocoding_entity;
import 'data/models/response/direction_response.dart' as direction_response;
import 'domain/entities/direction_entity.dart' as direction_entity;

extension PlaceAutocompleteResponseMapper
    on place_autocomplete_response.PlaceAutocompleteResponse {
  place_autocomplete_entity.PlaceAutocompleteEntity toEntity() =>
      place_autocomplete_entity.PlaceAutocompleteEntity(
        predictions: predictions?.map((e) => e.toEntity()).toList(),
        status: status,
      );
}

extension PlaceAutocompleteEntityMapper
    on place_autocomplete_entity.PlaceAutocompleteEntity {
  place_autocomplete_response.PlaceAutocompleteResponse toResponse() =>
      place_autocomplete_response.PlaceAutocompleteResponse(
        predictions: predictions?.map((e) => e.toResponse()).toList(),
        status: status,
      );
}

extension PredictionsPlaceAutocompleteResponseMapper
    on place_autocomplete_response.PredictionsPlaceAutocomplete {
  place_autocomplete_entity.PredictionsPlaceAutocomplete toEntity() =>
      place_autocomplete_entity.PredictionsPlaceAutocomplete(
        description: description,
        distanceMeters: distanceMeters,
        matchedSubstrings: matchedSubstrings?.map((e) => e.toEntity()).toList(),
        placeId: placeId,
        reference: reference,
        structuredFormatting: structuredFormatting?.toEntity(),
        terms: terms?.map((e) => e.toEntity()).toList(),
        types: types,
      );
}

extension PredictionsPlaceAutocompleteEntityMapper
    on place_autocomplete_entity.PredictionsPlaceAutocomplete {
  place_autocomplete_response.PredictionsPlaceAutocomplete toResponse() =>
      place_autocomplete_response.PredictionsPlaceAutocomplete(
        description: description,
        distanceMeters: distanceMeters,
        matchedSubstrings:
            matchedSubstrings?.map((e) => e.toResponse()).toList(),
        placeId: placeId,
        reference: reference,
        structuredFormatting: structuredFormatting?.toResponse(),
        terms: terms?.map((e) => e.toResponse()).toList(),
        types: types,
      );
}

extension StructuredFormattingPlaceAutocompleteResponseMapper
    on place_autocomplete_response.StructuredFormattingPlaceAutocomplete {
  place_autocomplete_entity.StructuredFormattingPlaceAutocomplete toEntity() =>
      place_autocomplete_entity.StructuredFormattingPlaceAutocomplete(
        mainText: mainText,
        mainTextMatchedSubstrings:
            mainTextMatchedSubstrings?.map((e) => e.toEntity()).toList(),
        secondaryText: secondaryText,
      );
}

extension StructuredFormattingPlaceAutocompleteEntityMapper
    on place_autocomplete_entity.StructuredFormattingPlaceAutocomplete {
  place_autocomplete_response.StructuredFormattingPlaceAutocomplete
      toResponse() =>
          place_autocomplete_response.StructuredFormattingPlaceAutocomplete(
            mainText: mainText,
            mainTextMatchedSubstrings:
                mainTextMatchedSubstrings?.map((e) => e.toResponse()).toList(),
            secondaryText: secondaryText,
          );
}

extension MainTextMatchedSubstringsPlaceAutocompleteResponseMapper
    on place_autocomplete_response.MainTextMatchedSubstringsPlaceAutocomplete {
  place_autocomplete_entity.MainTextMatchedSubstringsPlaceAutocomplete
      toEntity() =>
          place_autocomplete_entity.MainTextMatchedSubstringsPlaceAutocomplete(
            length: length,
            offset: offset,
          );
}

extension MainTextMatchedSubstringsPlaceAutocompleteEntityMapper
    on place_autocomplete_entity.MainTextMatchedSubstringsPlaceAutocomplete {
  place_autocomplete_response.MainTextMatchedSubstringsPlaceAutocomplete
      toResponse() => place_autocomplete_response
              .MainTextMatchedSubstringsPlaceAutocomplete(
            length: length,
            offset: offset,
          );
}

extension MatchedSubstringsPlaceAutocompleteResponseMapper
    on place_autocomplete_response.MatchedSubstringsPlaceAutocomplete {
  place_autocomplete_entity.MatchedSubstringsPlaceAutocomplete toEntity() =>
      place_autocomplete_entity.MatchedSubstringsPlaceAutocomplete(
        length: length,
        offset: offset,
      );
}

extension MatchedSubstringsPlaceAutocompleteEntityMapper
    on place_autocomplete_entity.MatchedSubstringsPlaceAutocomplete {
  place_autocomplete_response.MatchedSubstringsPlaceAutocomplete toResponse() =>
      place_autocomplete_response.MatchedSubstringsPlaceAutocomplete(
        length: length,
        offset: offset,
      );
}

extension TermsPlaceAutocompleteResponseMapper
    on place_autocomplete_response.TermsPlaceAutocomplete {
  place_autocomplete_entity.TermsPlaceAutocomplete toEntity() =>
      place_autocomplete_entity.TermsPlaceAutocomplete(
        offset: offset,
        value: value,
      );
}

extension TermsPlaceAutocompleteEntityMapper
    on place_autocomplete_entity.TermsPlaceAutocomplete {
  place_autocomplete_response.TermsPlaceAutocomplete toResponse() =>
      place_autocomplete_response.TermsPlaceAutocomplete(
        offset: offset,
        value: value,
      );
}

extension GeocodingResponseMapper on geocoding_response.GeocodingResponse {
  geocoding_entity.GeocodingEntity toEntity() =>
      geocoding_entity.GeocodingEntity(
        results: results?.map((e) => e.toEntity()).toList(),
        status: status,
      );
}

extension GeocodingEntityMapper on geocoding_entity.GeocodingEntity {
  geocoding_response.GeocodingResponse toResponse() =>
      geocoding_response.GeocodingResponse(
        results: results?.map((e) => e.toResponse()).toList(),
        status: status,
      );
}

extension ResultsGeocodingResponseMapper
    on geocoding_response.ResultsGeocoding {
  geocoding_entity.ResultsGeocoding toEntity() =>
      geocoding_entity.ResultsGeocoding(
        addressComponents: addressComponents?.map((e) => e.toEntity()).toList(),
        formattedAddress: formattedAddress,
        geometry: geometry?.toEntity(),
        placeId: placeId,
        plusCode: plusCode?.toEntity(),
        types: types,
      );
}

extension ResultsGeocodingEntityMapper on geocoding_entity.ResultsGeocoding {
  geocoding_response.ResultsGeocoding toResponse() =>
      geocoding_response.ResultsGeocoding(
        addressComponents:
            addressComponents?.map((e) => e.toResponse()).toList(),
        formattedAddress: formattedAddress,
        geometry: geometry?.toResponse(),
        placeId: placeId,
        plusCode: plusCode?.toResponse(),
        types: types,
      );
}

extension GeometryGeocodingResponseMapper
    on geocoding_response.GeometryGeocoding {
  geocoding_entity.GeometryGeocoding toEntity() =>
      geocoding_entity.GeometryGeocoding(
        location: location?.toEntity(),
        locationType: locationType,
        viewport: viewport?.toEntity(),
      );
}

extension GeometryGeocodingEntityMapper on geocoding_entity.GeometryGeocoding {
  geocoding_response.GeometryGeocoding toResponse() =>
      geocoding_response.GeometryGeocoding(
        location: location?.toResponse(),
        locationType: locationType,
        viewport: viewport?.toResponse(),
      );
}

extension LocationGeocodingResponseMapper
    on geocoding_response.LocationGeocoding {
  geocoding_entity.LocationGeocoding toEntity() =>
      geocoding_entity.LocationGeocoding(
        lat: lat,
        lng: lng,
      );
}

extension LocationGeocodingEntityMapper on geocoding_entity.LocationGeocoding {
  geocoding_response.LocationGeocoding toResponse() =>
      geocoding_response.LocationGeocoding(
        lat: lat,
        lng: lng,
      );
}

extension ViewportGeocodingResponseMapper
    on geocoding_response.ViewportGeocoding {
  geocoding_entity.ViewportGeocoding toEntity() =>
      geocoding_entity.ViewportGeocoding(
        northeast: northeast?.toEntity(),
        southwest: southwest?.toEntity(),
      );
}

extension ViewportGeocodingEntityMapper on geocoding_entity.ViewportGeocoding {
  geocoding_response.ViewportGeocoding toResponse() =>
      geocoding_response.ViewportGeocoding(
        northeast: northeast?.toResponse(),
        southwest: southwest?.toResponse(),
      );
}

extension NortheastGeocodingResponseMapper
    on geocoding_response.NortheastGeocoding {
  geocoding_entity.NortheastGeocoding toEntity() =>
      geocoding_entity.NortheastGeocoding(
        lat: lat,
        lng: lng,
      );
}

extension NortheastGeocodingEntityMapper
    on geocoding_entity.NortheastGeocoding {
  geocoding_response.NortheastGeocoding toResponse() =>
      geocoding_response.NortheastGeocoding(
        lat: lat,
        lng: lng,
      );
}

extension SouthwestGeocodingResponseMapper
    on geocoding_response.SouthwestGeocoding {
  geocoding_entity.SouthwestGeocoding toEntity() =>
      geocoding_entity.SouthwestGeocoding(
        lat: lat,
        lng: lng,
      );
}

extension SouthwestGeocodingEntityMapper
    on geocoding_entity.SouthwestGeocoding {
  geocoding_response.SouthwestGeocoding toResponse() =>
      geocoding_response.SouthwestGeocoding(
        lat: lat,
        lng: lng,
      );
}

extension PlusCodeGeocodingResponseMapper
    on geocoding_response.PlusCodeGeocoding {
  geocoding_entity.PlusCodeGeocoding toEntity() =>
      geocoding_entity.PlusCodeGeocoding(
        compoundCode: compoundCode,
        globalCode: globalCode,
      );
}

extension PlusCodeGeocodingEntityMapper on geocoding_entity.PlusCodeGeocoding {
  geocoding_response.PlusCodeGeocoding toResponse() =>
      geocoding_response.PlusCodeGeocoding(
        compoundCode: compoundCode,
        globalCode: globalCode,
      );
}

extension AddressComponentsGeocodingResponseMapper
    on geocoding_response.AddressComponentsGeocoding {
  geocoding_entity.AddressComponentsGeocoding toEntity() =>
      geocoding_entity.AddressComponentsGeocoding(
        longName: longName,
        shortName: shortName,
        types: types,
      );
}

extension AddressComponentsGeocodingEntityMapper
    on geocoding_entity.AddressComponentsGeocoding {
  geocoding_response.AddressComponentsGeocoding toResponse() =>
      geocoding_response.AddressComponentsGeocoding(
        longName: longName,
        shortName: shortName,
        types: types,
      );
}

extension DirectionResponseMapper on direction_response.DirectionResponse {
  direction_entity.DirectionEntity toEntity() =>
      direction_entity.DirectionEntity(
        geocodedWaypoints: geocodedWaypoints?.map((e) => e.toEntity()).toList(),
        routes: routes?.map((e) => e.toEntity()).toList(),
        status: status,
      );
}

extension DirectionEntityMapper on direction_entity.DirectionEntity {
  direction_response.DirectionResponse toResponse() =>
      direction_response.DirectionResponse(
        geocodedWaypoints:
            geocodedWaypoints?.map((e) => e.toResponse()).toList(),
        routes: routes?.map((e) => e.toResponse()).toList(),
        status: status,
      );
}

extension GeocodedWaypointsDirectionResponseMapper
    on direction_response.GeocodedWaypointsDirection {
  direction_entity.GeocodedWaypointsDirection toEntity() =>
      direction_entity.GeocodedWaypointsDirection(
        geocoderStatus: geocoderStatus,
        placeId: placeId,
        types: types,
      );
}

extension GeocodedWaypointsDirectionEntityMapper
    on direction_entity.GeocodedWaypointsDirection {
  direction_response.GeocodedWaypointsDirection toResponse() =>
      direction_response.GeocodedWaypointsDirection(
        geocoderStatus: geocoderStatus,
        placeId: placeId,
        types: types,
      );
}

extension RoutesDirectionResponseMapper on direction_response.RoutesDirection {
  direction_entity.RoutesDirection toEntity() =>
      direction_entity.RoutesDirection(
        bounds: bounds?.toEntity(),
        copyrights: copyrights,
        legs: legs?.map((e) => e.toEntity()).toList(),
        overviewPolyline: overviewPolyline?.toEntity(),
        summary: summary,
        warnings: warnings,
        waypointOrder: waypointOrder,
      );
}

extension RoutesDirectionEntityMapper on direction_entity.RoutesDirection {
  direction_response.RoutesDirection toResponse() =>
      direction_response.RoutesDirection(
        bounds: bounds?.toResponse(),
        copyrights: copyrights,
        legs: legs?.map((e) => e.toResponse()).toList(),
        overviewPolyline: overviewPolyline?.toResponse(),
        summary: summary,
        warnings: warnings,
        waypointOrder: waypointOrder,
      );
}

extension BoundsDirectionResponseMapper on direction_response.BoundsDirection {
  direction_entity.BoundsDirection toEntity() =>
      direction_entity.BoundsDirection(
        northeast: northeast?.toEntity(),
        southwest: southwest?.toEntity(),
      );
}

extension BoundsDirectionEntityMapper on direction_entity.BoundsDirection {
  direction_response.BoundsDirection toResponse() =>
      direction_response.BoundsDirection(
        northeast: northeast?.toResponse(),
        southwest: southwest?.toResponse(),
      );
}

extension NortheastDirectionResponseMapper
    on direction_response.NortheastDirection {
  direction_entity.NortheastDirection toEntity() =>
      direction_entity.NortheastDirection(
        lat: lat,
        lng: lng,
      );
}

extension NortheastDirectionEntityMapper
    on direction_entity.NortheastDirection {
  direction_response.NortheastDirection toResponse() =>
      direction_response.NortheastDirection(
        lat: lat,
        lng: lng,
      );
}

extension SouthwestDirectionResponseMapper
    on direction_response.SouthwestDirection {
  direction_entity.SouthwestDirection toEntity() =>
      direction_entity.SouthwestDirection(
        lat: lat,
        lng: lng,
      );
}

extension SouthwestDirectionEntityMapper
    on direction_entity.SouthwestDirection {
  direction_response.SouthwestDirection toResponse() =>
      direction_response.SouthwestDirection(
        lat: lat,
        lng: lng,
      );
}

extension OverviewPolylineDirectionResponseMapper
    on direction_response.OverviewPolylineDirection {
  direction_entity.OverviewPolylineDirection toEntity() =>
      direction_entity.OverviewPolylineDirection(
        points: points,
      );
}

extension OverviewPolylineDirectionEntityMapper
    on direction_entity.OverviewPolylineDirection {
  direction_response.OverviewPolylineDirection toResponse() =>
      direction_response.OverviewPolylineDirection(
        points: points,
      );
}

extension LegsDirectionResponseMapper on direction_response.LegsDirection {
  direction_entity.LegsDirection toEntity() => direction_entity.LegsDirection(
        distance: distance?.toEntity(),
        duration: duration?.toEntity(),
        endAddress: endAddress,
        endLocation: endLocation?.toEntity(),
        startAddress: startAddress,
        startLocation: startLocation?.toEntity(),
        trafficSpeedEntry: trafficSpeedEntry,
        viaWaypoint: viaWaypoint,
      );
}

extension LegsDirectionEntityMapper on direction_entity.LegsDirection {
  direction_response.LegsDirection toResponse() =>
      direction_response.LegsDirection(
        distance: distance?.toResponse(),
        duration: duration?.toResponse(),
        endAddress: endAddress,
        endLocation: endLocation?.toResponse(),
        startAddress: startAddress,
        startLocation: startLocation?.toResponse(),
        trafficSpeedEntry: trafficSpeedEntry,
        viaWaypoint: viaWaypoint,
      );
}

extension DistanceDirectionResponseMapper
    on direction_response.DistanceDirection {
  direction_entity.DistanceDirection toEntity() =>
      direction_entity.DistanceDirection(
        text: text,
        value: value,
      );
}

extension DistanceDirectionEntityMapper on direction_entity.DistanceDirection {
  direction_response.DistanceDirection toResponse() =>
      direction_response.DistanceDirection(
        text: text,
        value: value,
      );
}

extension DurationDirectionResponseMapper
    on direction_response.DurationDirection {
  direction_entity.DurationDirection toEntity() =>
      direction_entity.DurationDirection(
        text: text,
        value: value,
      );
}

extension DurationDirectionEntityMapper on direction_entity.DurationDirection {
  direction_response.DurationDirection toResponse() =>
      direction_response.DurationDirection(
        text: text,
        value: value,
      );
}

extension EndLocationDirectionResponseMapper
    on direction_response.EndLocationDirection {
  direction_entity.EndLocationDirection toEntity() =>
      direction_entity.EndLocationDirection(
        lat: lat,
        lng: lng,
      );
}

extension EndLocationDirectionEntityMapper
    on direction_entity.EndLocationDirection {
  direction_response.EndLocationDirection toResponse() =>
      direction_response.EndLocationDirection(
        lat: lat,
        lng: lng,
      );
}

extension StartLocationDirectionResponseMapper
    on direction_response.StartLocationDirection {
  direction_entity.StartLocationDirection toEntity() =>
      direction_entity.StartLocationDirection(
        lat: lat,
        lng: lng,
      );
}

extension StartLocationDirectionEntityMapper
    on direction_entity.StartLocationDirection {
  direction_response.StartLocationDirection toResponse() =>
      direction_response.StartLocationDirection(
        lat: lat,
        lng: lng,
      );
}
