import 'package:geolocator/geolocator.dart';

class LocationHelper {
  String myLocation;
  Future<String> getUserLocation() async {
    Position position = await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    List<Placemark> placemarks = await Geolocator()
        .placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark placemark = placemarks[0];
    // String myCompleteAddress =
    //     '${placemark.subThoroughfare} ${placemark.thoroughfare} ${placemark.subLocality} ${placemark.administrativeArea}';
    myLocation = '${placemark.locality} ${placemark.country}';
    return myLocation;
  }
}
