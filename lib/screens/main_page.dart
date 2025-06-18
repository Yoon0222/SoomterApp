import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import 'home_page.dart';
import 'map_page.dart';
import 'qr_scan_page.dart';
import 'profile_page.dart';
import 'google_map_page.dart';

const _titles = ['홈', 'flutter지도', 'google지도', 'QR 스캔', '내 정보'];
const _pages = [
  HomePage(),
  MapPage(),
  GoogleMapPage(),
  QRScanPage(),
  ProfilePage(),
];

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selected = 0;

  void _onTap(int idx) => setState(() => _selected = idx);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titles[_selected]), centerTitle: true),
      body: _pages[_selected],
      bottomNavigationBar: SoomterBottomNavBar(
        currentIndex: _selected,
        onTap: _onTap,
      ),
    );
  }
}
