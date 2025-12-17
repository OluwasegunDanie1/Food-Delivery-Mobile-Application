import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class OrderTrackingProvider extends ChangeNotifier {
  LatLng riderLocation = LatLng(6.4606, 3.2052);
  String status = "Rider is on the way";

  void updateLocation(LatLng newLocation) {
    riderLocation = newLocation;
    notifyListeners();
  }

  void updateStatus(String newStatus) {
    status = newStatus;
    notifyListeners();
  }
}
