import 'package:fast_qr/models/qr_code_types.dart';
import 'package:flutter/material.dart';

class GenerateWiFiQRView extends StatelessWidget {
  final TextEditingController ssidController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController encryptionTypeController =
      TextEditingController();

  GenerateWiFiQRView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'QR Code Type: WiFi',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.grey.shade200,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(0),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: ssidController,
              decoration: InputDecoration(labelText: 'Enter SSID'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Enter Password'),
            ),
            TextField(
              controller: encryptionTypeController,
              decoration: InputDecoration(labelText: 'Enter Encryption Type'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String ssid = ssidController.text;
                String password = passwordController.text;
                String encryptionType = encryptionTypeController.text;
                // Generate the QR code based on ssid, password, and encryptionType using WiFiQRData
                QRData qRData = WiFiQRData(ssid, password, encryptionType);
                qRData.generateQRDataString();
              },
              child: Text('Generate QR Code'),
            ),
          ],
        ),
      ),
    );
  }
}
