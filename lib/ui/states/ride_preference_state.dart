import 'package:flutter/material.dart';
import 'package:refactoring/data/repositories/ride_perference/ride_preference_repository_mock.dart';
import 'package:refactoring/model/ride_pref/ride_pref.dart';

class RidePreferenceState extends ChangeNotifier{
  final RidePreferenceRepositoryMock ridePreferenceRepositoryMock;

  RidePreferenceState({required this.ridePreferenceRepositoryMock});

  RidePreference? get selectedPreference => ridePreferenceRepositoryMock.selectedPreference;
  List<RidePreference> get historyPreferences => ridePreferenceRepositoryMock.historyPreferences;

  void onSelectedPreference(RidePreference preference) {
    ridePreferenceRepositoryMock.onSelectedPreference(preference);
    historyPreferences.add(preference);
    notifyListeners();
  }

  void onAddHistoryPreference(RidePreference preference) {
    ridePreferenceRepositoryMock.onAddHistoryPreference(preference);
    notifyListeners();
  }
}