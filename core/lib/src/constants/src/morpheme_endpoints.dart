
import 'package:morpheme_library/morpheme_library.dart';

abstract class MorphemeEndpoints {
  static Uri _createUriBaseUrl(String path) =>
      Uri.parse(const String.fromEnvironment('BASE_URL') + path);

  static Uri login = _createUriBaseUrl('/login');
  static Uri register = _createUriBaseUrl('/register');
  static Uri logout = _createUriBaseUrl('/logout');
  static Uri profile = _createUriBaseUrl('/profile');

  static Uri editProfile = _createUriBaseUrl('/profile');
  static Uri changePassword = _createUriBaseUrl('/change-password');
  static Uri uploadFile = _createUriBaseUrl('/upload');

  static Uri complaint = _createUriBaseUrl('/complaint');
  static Uri createReport = _createUriBaseUrl('/report');
  static Uri editReport(String reportId) => _createUriBaseUrl(
        '/report/:report_id'.replaceAll(':report_id', reportId),
      );
  static Uri detailReport(String reportId) => _createUriBaseUrl(
        '/report/:report_id'.replaceAll(':report_id', reportId),
      );
  static Uri listReport(
    String page,
    String perPage,
    String status,
    String search,
    String sort,
    String sortType,
    String startDate,
    String endDate,
  ) =>
      _createUriBaseUrl(
        '/report?page=:page&per_page=:per_page&status=:status${search.isNotNullOrEmpty ? '&search=:search' : ''}${sort.isNotNullOrEmpty ? '&sort=:sort' : ''}${sortType.isNotNullOrEmpty ? '&sort_type=:sort_type' : ''}${startDate.isNotNullOrEmpty ? '&start_date=:start_date' : ''}${(endDate.isNotNullOrEmpty ? '&end_date=:end_date' : '')}'
            .replaceAll(':page', page)
            .replaceAll(':per_page', perPage)
            .replaceAll(':status', status)
            .replaceAll(':search', search)
            .replaceAll(':sort', sort)
            .replaceAll(':sort_type', sortType)
            .replaceAll(':start_date', startDate)
            .replaceAll(':end_date', endDate),
      );
  static Uri deleteReport(String reportId) => _createUriBaseUrl(
        '/report/:report_id'.replaceAll(':report_id', reportId),
      );

  static Uri createRoute = _createUriBaseUrl('/route');
  static Uri updateRoute(String routeId) => _createUriBaseUrl(
        '/route/:route_id'.replaceAll(':route_id', routeId),
      );
  static Uri detailRoute(String routeId) => _createUriBaseUrl(
        '/route/:route_id'.replaceAll(':route_id', routeId),
      );
  static Uri listRoute(
    String page,
    String perPage,
    String sort,
    String sortType,
  ) =>
      _createUriBaseUrl(
        '/route?page=:page&per_page=:per_page&sort=:sort&sort_type=:sort_type'
            .replaceAll(':page', page)
            .replaceAll(':per_page', perPage)
            .replaceAll(':sort', sort)
            .replaceAll(':sort_type', sortType),
      );

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

  static Uri routeOptimization = _createUriBaseUrl('/optimize-route');
}
