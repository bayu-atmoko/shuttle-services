abstract class MorphemeEndpoints {
  static Uri _createUriBaseUrl(String path) =>
      Uri.parse(const String.fromEnvironment('BASE_URL') + path);

  static Uri login = _createUriBaseUrl('/login');
  static Uri register = _createUriBaseUrl('/register');
  static Uri forgotPassword = _createUriBaseUrl('/forgot_password');

  static Uri mapRoutes =
      Uri.parse('https://routes.googleapis.com/directions/v2:computeRoutes');
  static Uri distanceMatrix(
    String origins,
    String destinations,
    String key,
  ) =>
      Uri.parse(
        'https://maps.googleapis.com/maps/api/distancematrix/json?origins=:origins&destinations=:destinations&key=:key'
            .replaceAll(':origins', origins)
            .replaceAll(':destinations', destinations)
            .replaceAll(':key', key),
      );

  static Uri direction =
      Uri.parse('https://maps.googleapis.com/maps/api/directions/json');
  static Uri placeAutocomplete =
      Uri.parse('https://maps.googleapis.com/maps/api/place/autocomplete/json');
  static Uri geocoding =
      Uri.parse('https://maps.googleapis.com/maps/api/geocode/json');
}
