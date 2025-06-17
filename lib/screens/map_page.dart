// lib/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  static const _initialCenter = LatLng(37.5665, 126.9780);
  static const _initialZoom = 14.0;

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(center: _initialCenter, zoom: _initialZoom),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.soomter_app',
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: LatLng(37.5700, 126.9768),
              width: 40,
              height: 40,
              builder: (_) => const Icon(
                Icons.smoking_rooms,
                color: Colors.green,
                size: 36,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
