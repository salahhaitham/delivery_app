import 'package:delivery_app/Features/Home/presentation/Views/widgets/ManualLocationView.dart';
import 'package:delivery_app/core/enums/LocationStatus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../../Domain/model/UserLocation1.dart';
import '../../Cubits/Home_Cubit/Home_Cubit.dart';
import '../../Cubits/Home_Cubit/Home_state.dart';
import '../../Cubits/Restaurants_Cubit/RestaurantsCubit.dart';
import 'location_permission_buttons.dart';

class LocationPermissionView extends StatefulWidget {
  final LocationStatus locationStatus;

  const LocationPermissionView({super.key, required this.locationStatus});

  @override
  State<LocationPermissionView> createState() => _LocationPermissionViewState();
}

class _LocationPermissionViewState extends State<LocationPermissionView>
    with WidgetsBindingObserver {
  bool _isChecking = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && !_isChecking) {
      _isChecking = true;
      context.read<HomeCubit>().initHome().then((_) {
        _isChecking = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.location_off, size: 80, color: Colors.redAccent),
          const SizedBox(height: 16),
          const Text(
            'Location Access Needed',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const Text(
            'We need your location to show nearby restaurants.\n'
            'Please enable location or choose it manually.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(height: 32),

          buildActionButton(context),

          const SizedBox(height: 12),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
                onPressed: () async {
                  final selectedLocation = await Navigator.push<UserLocation1>(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ManualLocationView(),
                    ),
                  );

                  if (selectedLocation != null) {
                    // ممكن تعمّل Cubit emit هنا
                    context.read<HomeCubit>().emit(HomeReady(selectedLocation));
                    context.read<Restaurantscubit>().LoadRestaurants(selectedLocation);
                  }
                }

                ,child: const Text('Choose Location Manually'),
            ),
          ),
        ],
      ),
    );
  }
  Widget buildActionButton(BuildContext context) {
    switch (widget.locationStatus) {
      case LocationStatus.denied:
        return retryPermissionButton(context);

      case LocationStatus.serviceDisabled:
        return openLocationSettingsButton();

      case LocationStatus.deniedForever:
        return openAppSettingsButton();
      default:
        return const SizedBox();
    }
  }
}
