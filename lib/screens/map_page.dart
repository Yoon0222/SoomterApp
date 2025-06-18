import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? _qrController;
  bool _isScanning = false;

  static const _initialCenter = LatLng(37.5665, 126.9780);
  static const _initialZoom = 14.0;

  @override
  void dispose() {
    _qrController?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    _qrController = controller;
    controller.scannedDataStream.listen((scanData) {
      controller.pauseCamera();
      setState(() {
        _isScanning = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Scanned: ${scanData.code}')));
      // TODO: 포인트 등록 로직 추가
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // 1) 지도가 화면 전체 배경
        FlutterMap(
          options: MapOptions(center: _initialCenter, zoom: _initialZoom),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.soomter_app',
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: const LatLng(37.5700, 126.9768),
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
        ),

        // 2) QR 스캔 버튼 위치
        SafeArea(
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton(
                heroTag: 'qr_btn',
                backgroundColor: Colors.green.shade700,
                onPressed: () {
                  setState(() {
                    _isScanning = true;
                  });
                },
                child: const Icon(Icons.qr_code_scanner),
              ),
            ),
          ),
        ),

        // 3) QRView 오버레이
        if (_isScanning)
          Positioned.fill(
            child: Container(
              color: Colors.black54,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  borderColor: Colors.white,
                  borderRadius: 10,
                  borderLength: 30,
                  borderWidth: 10,
                  cutOutSize: 250,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
