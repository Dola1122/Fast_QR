import 'package:fast_qr/controllers/qr_generator_controller.dart';
import 'package:flutter/material.dart';

import '../../models/qr_code_types.dart';

class GenerateLocationQRView extends StatelessWidget {
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  final QRGeneratorController controller;

  GenerateLocationQRView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'QR Code Type: Location',
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
              controller: latitudeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Latitude'),
            ),
            TextField(
              controller: longitudeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Longitude'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double latitude =
                    double.tryParse(latitudeController.text) ?? 0.0;
                double longitude =
                    double.tryParse(longitudeController.text) ?? 0.0;
                // Generate the QR code based on latitude and longitude using LocationQRData
                controller.qrData = LocationQRData(latitude, longitude);
                controller.generateQRCode();
              },
              child: Text('Generate QR Code'),
            ),
          ],
        ),
      ),
    );
  }
}
