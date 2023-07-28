import 'package:fast_qr/views/qr_code_generator_view.dart';
import 'package:fast_qr/views/qr_code_scanner_view.dart';
import 'package:fast_qr/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/control_controller.dart';
import 'history_view.dart';

class ControlView extends StatelessWidget {
  const ControlView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControlController>(
      init: ControlController(),
      builder: (controller) => Scaffold(
        body: _getViewForIndex(controller.currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          backgroundColor: Colors.grey.shade200,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.camera_alt), label: 'Scan'),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: 'History'),
            BottomNavigationBarItem(
                icon: Icon(Icons.qr_code), label: 'Generate'),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: controller.currentIndex,
          onTap: controller.changeTabIndex,
        ),
      ),
    );
  }

  Widget _getViewForIndex(int index) {
    switch (index) {
      case 0:
        return QRCodeScannerView();
      case 1:
        return HistoryView();
      case 2:
        return QRCodeGeneratorView();
      case 3:
        return SettingsView();
      default:
        return Container();
    }
  }
}
