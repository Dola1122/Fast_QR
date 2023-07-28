import 'package:fast_qr/controllers/qr_generator_controller.dart';
import 'package:fast_qr/models/qr_code_types.dart';
import 'package:flutter/material.dart';

class GenerateEmailQRView extends StatelessWidget {
  final TextEditingController emailAddressController = TextEditingController();
  final QRGeneratorController controller;

  GenerateEmailQRView({super.key, required this. controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'QR Code Type: Email',
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
              controller: emailAddressController,
              decoration: InputDecoration(labelText: 'Enter Email Address'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String emailAddress = emailAddressController.text;
                // Generate the QR code based on emailAddress using EmailQRData
                controller.qrData = EmailQRData(emailAddress);
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
