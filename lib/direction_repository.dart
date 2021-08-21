import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test_map/.env.dart';
import 'package:http/http.dart' as http;

import 'direction_model.dart';

class DirectionsRepository {
  DirectionsRepository({http.Client? dio}) : _dio = dio ?? http.Client();

  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json';

  static const geocodeUrl = 'https://maps.googleapis.com/maps/api/geocode/json';

  final http.Client _dio;

  Future<String> getAddress(LatLng pos) async {
    final res = await _dio.get(Uri.parse(geocodeUrl).replace(queryParameters: {
      'latlng': '${pos.latitude},${pos.longitude}',
      'key': googleApiKey,
    }));
    print(res.body);
    return '123';
  }

  Future<Directions?> getDirections({
    required LatLng origin,
    required LatLng destination,
  }) async {
    final response = await _dio.get(
      Uri.parse(_baseUrl).replace(queryParameters: {
        'origin': '${origin.latitude},${origin.longitude}',
        'destination': '${destination.latitude},${destination.longitude}',
        'key': googleApiKey,
      }),
    );
    print(response.body);
    // Check if response is successful
    if (response.statusCode == 200) {
      return Directions.fromMap(jsonDecode(response.body));
    }
    return null;
  }
}
