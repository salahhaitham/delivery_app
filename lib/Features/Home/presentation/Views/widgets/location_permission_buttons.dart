import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import '../../Cubits/Home_Cubit/Home_Cubit.dart';


Widget retryPermissionButton(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {
        context.read<HomeCubit>().initHome();
      },
      child: const Text('Allow Location'),
    ),
  );
}

Widget openLocationSettingsButton() {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: Geolocator.openLocationSettings,
      child: const Text('Enable Location Service'),
    ),
  );
}

Widget openAppSettingsButton() {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: Geolocator.openAppSettings,
      child: const Text('Open App Settings'),
    ),
  );
}
