import 'package:refactoring/model/ride/locations.dart';

abstract class LocationRepository {
  Future<List<Location>> fetchLocation();
}