import 'package:refactoring/data/repositories/ride_perference/ride_preference_repository.dart';
import 'package:refactoring/model/ride/ride.dart';
import 'package:refactoring/model/ride_pref/ride_pref.dart';

class RidePreferenceRepositoryMock implements RidePreferenceRepository{

  RidePreference? _selectedPreference;
  final List<RidePreference> _historyPreferences = [];

  RidePreference? get selectedPreference => _selectedPreference;
  List<RidePreference> get historyPreferences => _historyPreferences;

  @override
  void onAddHistoryPreference(RidePreference preference) {
    // TODO: implement onAddHistoryPreference
    _historyPreferences.add(preference);
  }

  @override
  void onSelectedPreference(RidePreference preference) {
    if(preference != _selectedPreference){
      _selectedPreference = preference;
      onAddHistoryPreference(preference);
    }
  }
  
}