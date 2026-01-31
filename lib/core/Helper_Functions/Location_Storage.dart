import 'package:delivery_app/constants.dart';
import 'package:delivery_app/core/Services/ShearedPreferenceSinglton.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Features/Home/Domain/model/UserLocation1.dart';

class LocationStorage {


  static Future<void> saveLocation(UserLocation1 location) async {

    await SharedPrefernceSinglton.setDouble(constants.keyLat, location.lat);
    await SharedPrefernceSinglton.setDouble(constants.keyLng, location.lng);
    if (location.name != null) {
      await SharedPrefernceSinglton.setString(constants.keyName, location.name!);
    }
  }

  static UserLocation1? getLocation()  {

    final lat = SharedPrefernceSinglton.getDouble(constants.keyLat);
    final lng = SharedPrefernceSinglton.getDouble(constants.keyLng);
    if (lat != null && lng != null) {
      final name = SharedPrefernceSinglton.getString(constants.keyName);
      return UserLocation1(lat: lat, lng: lng, name: name!);
    }
    return null;
  }



  static String? getLocationName(){

    final name = SharedPrefernceSinglton.getString(constants.keyName);
    if(name!=null){
      return name;
    }else{
      return "unKnown";
    }


  }

  static Future<void> clearLocation() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(constants.keyLat);
    await prefs.remove(constants.keyLng);
    await prefs.remove(constants.keyName);
  }
}
