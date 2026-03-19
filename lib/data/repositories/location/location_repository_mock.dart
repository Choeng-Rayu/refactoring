import 'package:refactoring/data/dummy_data.dart';
import 'package:refactoring/data/repositories/location/location_repository.dart';
import 'package:refactoring/model/ride/locations.dart';

class LocationRepositoryMock extends LocationRepository{
  @override
  Future<List<Location>> fetchLocation() {
    return Future.delayed(const Duration(seconds: 1), () => fakeLocations);
  }
}