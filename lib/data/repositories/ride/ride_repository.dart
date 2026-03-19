import 'package:refactoring/model/ride/ride.dart';

abstract class RideRepository {
  Future<List<Ride>> fetchRides();
}