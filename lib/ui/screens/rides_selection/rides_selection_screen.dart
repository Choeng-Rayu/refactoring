import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/repositories/location/location_repository_mock.dart';
import '../../../data/repositories/ride_perference/ride_preference_repository_mock.dart';
import '../../../model/ride/ride.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../../services/rides_service.dart';
import '../../../ui/states/location_state.dart';
import '../../../ui/states/ride_preference_state.dart';
import '../../../utils/animations_util.dart' show AnimationUtils;
import '../../theme/theme.dart';
import 'widgets/ride_preference_modal.dart';
import 'widgets/rides_selection_header.dart';
import 'widgets/rides_selection_tile.dart';

///
///  The Ride Selection screen allows user to select a ride, once ride preferences have been defined.
///  The screen also allow user to:
///   -  re-define the ride preferences
///   -  activate some filters.
///
class RidesSelectionScreen extends StatefulWidget {
  const RidesSelectionScreen({super.key});

  @override
  State<RidesSelectionScreen> createState() => _RidesSelectionScreenState();
}

class _RidesSelectionScreenState extends State<RidesSelectionScreen> {
  void onBackTap() {
    Navigator.pop(context);
  }

  void onFilterPressed() {
    // TODO
  }

  void onRideSelected(Ride ride) {
    // Later
  }

  RidePreference get selectedRidePreference {
    return context.read<RidePreferenceState>().selectedPreference!;
  }

  List<Ride> get matchingRides =>
      RidesService.getRidesFor(selectedRidePreference);

  void onPreferencePressed() async {
    // 1 - Navigate to the rides preference picker
    RidePreference? newPreference = await Navigator.of(context)
        .push<RidePreference>(
          AnimationUtils.createRightToLeftRoute(
            ChangeNotifierProvider.value(
              value: context.read<RidePreferenceState>(),
              child: RidePreferenceModal(
                  initialPreference: selectedRidePreference),
            ),
          ),
        );

    if (newPreference != null) {
      // 2 - Update the state with the new preference
      context.read<RidePreferenceState>().onSelectedPreference(newPreference);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RidePreferenceState(
            ridePreferenceRepositoryMock: RidePreferenceRepositoryMock(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => LocationState(
            locationRepository: LocationRepositoryMock(),
          ),
        ),
      ],
      child: Consumer<RidePreferenceState>(
        builder: (context, ridePreferenceState, _) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(
                left: BlaSpacings.m,
                right: BlaSpacings.m,
                top: BlaSpacings.s,
              ),
              child: Column(
                children: [
                  RideSelectionHeader(
                    ridePreference: selectedRidePreference,
                    onBackPressed: onBackTap,
                    onFilterPressed: onFilterPressed,
                    onPreferencePressed: onPreferencePressed,
                  ),
                  SizedBox(height: 100),
                  Expanded(
                    child: ListView.builder(
                      itemCount: matchingRides.length,
                      itemBuilder: (ctx, index) => RideSelectionTile(
                        ride: matchingRides[index],
                        onPressed: () =>
                            onRideSelected(matchingRides[index]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
