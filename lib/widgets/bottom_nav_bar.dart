import 'package:flutter/material.dart';

const _items = <BottomNavigationBarItem>[
  BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
  BottomNavigationBarItem(icon: Icon(Icons.map), label: '지도'),
  BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner), label: 'QR'),
  BottomNavigationBarItem(icon: Icon(Icons.person), label: '내 정보'),
];

class SoomterBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  const SoomterBottomNavBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: _items,
      currentIndex: currentIndex,
      selectedItemColor: Colors.green.shade700,
      unselectedItemColor: Colors.grey,
      onTap: onTap,
    );
  }
}
