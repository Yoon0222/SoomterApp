// lib/screens/qr_scan_page.dart
import 'package:flutter/material.dart';

class QRScanPage extends StatelessWidget {
  const QRScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {
          // TODO: QR 스캔 로직 구현
        },
        icon: const Icon(Icons.qr_code_scanner),
        label: const Text('QR 코드 스캔'),
      ),
    );
  }
}
