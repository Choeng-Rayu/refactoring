import 'package:refactoring/data/dummy_data.dart';
import 'package:refactoring/data/repositories/ride/ride_repository.dart';
import 'package:refactoring/model/ride/ride.dart';

class RideRepositoryMock extends RideRepository{
  @override
  Future<List<Ride>> fetchRides() {
    return Future.delayed(const Duration(seconds: 1), () => fakeRides);
  }
}