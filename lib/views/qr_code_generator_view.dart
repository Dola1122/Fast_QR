import 'package:flutter/material.dart';

class QRCodeGeneratorView extends StatelessWidget {
  const QRCodeGeneratorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Generate QR Code')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            // You can change this to adjust the number of columns
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: qrCodeTypes.length,
          itemBuilder: (context, index) {
            return _generateQRCodeCard(
              icon: qrCodeTypes[index].icon,
              title: qrCodeTypes[index].title,
              generateQRCode: qrCodeTypes[index].generateQRCode,
            );
          },
        ),
      ),
    );
  }

  Widget _generateQRCodeCard({
    required IconData icon,
    required String title,
    required VoidCallback generateQRCode,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8)
      ),
      child: InkWell(
        onTap: generateQRCode,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class QRCodeType {
  final IconData icon;
  final String title;
  final VoidCallback generateQRCode;

  QRCodeType({
    required this.icon,
    required this.title,
    required this.generateQRCode,
  });
}

final List<QRCodeType> qrCodeTypes = [
  // Existing QR code types
  QRCodeType(
    icon: Icons.text_fields,
    title: 'Plain Text',
    generateQRCode: () {
      // Logic to generate Plain Text QR Code
    },
  ),
  QRCodeType(
    icon: Icons.link,
    title: 'URL',
    generateQRCode: () {
      // Logic to generate URL QR Code
    },
  ),
  QRCodeType(
    icon: Icons.wifi,
    title: 'WiFi',
    generateQRCode: () {
      // Logic to generate WiFi QR Code
    },
  ),
  QRCodeType(
    icon: Icons.contacts,
    title: 'Contact',
    generateQRCode: () {
      // Logic to generate Contact QR Code
    },
  ),
  QRCodeType(
    icon: Icons.phone,
    title: 'Phone',
    generateQRCode: () {
      // Logic to generate Phone Number QR Code
    },
  ),
  QRCodeType(
    icon: Icons.email,
    title: 'Email',
    generateQRCode: () {
      // Logic to generate Email QR Code
    },
  ),
  QRCodeType(
    icon: Icons.event,
    title: 'Calendar Event',
    generateQRCode: () {
      // Logic to generate Calendar Event QR Code
    },
  ),
  // Additional QR code types
  QRCodeType(
    icon: Icons.location_on,
    title: 'Location',
    generateQRCode: () {
      // Logic to generate Location QR Code
    },
  ),
  QRCodeType(
    icon: Icons.payment,
    title: 'Payment',
    generateQRCode: () {
      // Logic to generate Payment QR Code
    },
  ),
];
