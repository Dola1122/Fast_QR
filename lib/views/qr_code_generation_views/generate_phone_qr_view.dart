import 'package:fast_qr/controllers/qr_generator_controller.dart';
import 'package:flutter/material.dart';

import '../../models/qr_code_types.dart';

class GeneratePhoneQRView extends StatelessWidget {
  final TextEditingController phoneNumberController = TextEditingController();
  final QRGeneratorController controller;

  GeneratePhoneQRView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'QR Code Type: Phone',
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
              controller: phoneNumberController,
              decoration: InputDecoration(labelText: 'Enter Phone Number'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String phoneNumber = phoneNumberController.text;
                // Generate the QR code based on phoneNumber using PhoneQRData
                controller.qrData = PhoneQRData(phoneNumber);
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
