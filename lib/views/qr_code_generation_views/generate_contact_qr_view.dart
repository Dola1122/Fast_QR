import 'package:fast_qr/controllers/qr_generator_controller.dart';
import 'package:fast_qr/models/qr_code_types_raw_data.dart';
import 'package:flutter/material.dart';

class GenerateContactQRView extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final QRGeneratorController controller;

  GenerateContactQRView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'QR Code Type: Contact',
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
              controller: fullNameController,
              decoration: InputDecoration(labelText: 'Enter Full Name'),
            ),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(labelText: 'Enter Phone Number'),
            ),
            TextField(
              controller: emailAddressController,
              decoration: InputDecoration(labelText: 'Enter Email Address'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String fullName = fullNameController.text;
                String phoneNumber = phoneNumberController.text;
                String emailAddress = emailAddressController.text;
                // Generate the QR code based on fullName, phoneNumber, and emailAddress using ContactQRData
                controller.qrData = ContactQRData(
                  fullName: fullName,
                  phoneNumber: phoneNumber,
                  emailAddress: emailAddress,
                );
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
