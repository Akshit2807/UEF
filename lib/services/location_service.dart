// services/location_service.dart
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationService {
  static Future<Map<String, dynamic>> getCurrentLocation() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return {
          'success': false,
          'error': 'Location services are disabled. Please enable them in settings.',
          'location': null,
        };
      }

      // Check location permission
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return {
            'success': false,
            'error': 'Location permission denied. Please grant location access.',
            'location': null,
          };
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return {
          'success': false,
          'error': 'Location permission permanently denied. Please enable in app settings.',
          'location': null,
          'openSettings': true,
        };
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: Duration(seconds: 10),
      );

      // Get address from coordinates (reverse geocoding)
      String address = await _getAddressFromCoordinates(
          position.latitude,
          position.longitude
      );

      return {
        'success': true,
        'error': null,
        'location': {
          'latitude': position.latitude,
          'longitude': position.longitude,
          'address': address,
          'accuracy': position.accuracy,
          'timestamp': position.timestamp?.toIso8601String(),
        },
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'Failed to get location: ${e.toString()}',
        'location': null,
      };
    }
  }

  static Future<String> _getAddressFromCoordinates(double lat, double lng) async {
    try {
      // For demo purposes, return formatted coordinates
      // In production, you'd use a geocoding service like Google Maps API
      return 'Lat: ${lat.toStringAsFixed(6)}, Lng: ${lng.toStringAsFixed(6)}';

      // Example with a real geocoding service:
      // List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
      // if (placemarks.isNotEmpty) {
      //   Placemark place = placemarks[0];
      //   return '${place.street}, ${place.locality}, ${place.administrativeArea} ${place.postalCode}';
      // }
    } catch (e) {
      return 'Lat: ${lat.toStringAsFixed(6)}, Lng: ${lng.toStringAsFixed(6)}';
    }
  }

  static Future<bool> openLocationSettings() async {
    try {
      return await Geolocator.openLocationSettings();
    } catch (e) {
      return false;
    }
  }

  static Future<bool> openAppSettings() async {
    try {
      return await openAppSettings();
    } catch (e) {
      return false;
    }
  }

  static double calculateDistance(
      double startLat,
      double startLng,
      double endLat,
      double endLng,
      ) {
    return Geolocator.distanceBetween(startLat, startLng, endLat, endLng);
  }
}