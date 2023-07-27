import 'package:flutter/material.dart';

class GenerateContactQRView extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();

  GenerateContactQRView({super.key});

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
              },
              child: Text('Generate QR Code'),
            ),
          ],
        ),
      ),
    );
  }
}
