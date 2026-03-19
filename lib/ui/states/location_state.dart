import 'package:flutter/material.dart';
import 'package:refactoring/data/repositories/location/location_repository.dart';
import 'package:refactoring/model/ride/locations.dart';

class LocationState extends ChangeNotifier{
  final LocationRepository locationRepository;

  LocationState({required this.locationRepository});

  List<Location> _locations = [];
  List<Location> get locations => _locations;

  void getAllLocations() async {
    _locations = await locationRepository.fetchLocation();
    notifyListeners();
  }
}