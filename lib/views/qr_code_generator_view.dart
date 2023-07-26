import 'package:flutter/material.dart';

class QRCodeGeneratorView extends StatelessWidget {
  const QRCodeGeneratorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Generate QR Code',
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
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // You can change this to adjust the number of columns
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: qrCodeTypes.length,
          itemBuilder: (context, index) {
            return _generateQRCodeCard(
              icon: qrCodeTypes[index].icon,
              title: qrCodeTypes[index].title,
            );
          },
        ),
      ),
      backgroundColor: Colors.blue.shade50,
    );
  }

  Widget _generateQRCodeCard({
    required IconData icon,
    required String title,
  }) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: InkWell(
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
  final generateQRData; // Function to return the QR code data

  QRCodeType({
    required this.icon,
    required this.title,
    required this.generateQRData,
  });
}

final List<QRCodeType> qrCodeTypes = [
  QRCodeType(
    icon: Icons.text_fields,
    title: 'Plain Text',
    generateQRData: (String text) {
      return text;
    },
  ),
  QRCodeType(
    icon: Icons.link,
    title: 'URL',
    generateQRData: (String url) {
      return url;
    },
  ),
  QRCodeType(
    icon: Icons.wifi,
    title: 'WiFi',
    generateQRData: (String ssid, String password, String encryptionType) {
      return 'WIFI:S:$ssid;T:$encryptionType;P:$password;;';
    },
  ),
  QRCodeType(
    icon: Icons.contacts,
    title: 'Contact',
    generateQRData: (String fullName, String phoneNumber, String emailAddress) {
      return 'BEGIN:VCARD\nVERSION:3.0\nFN:$fullName\nTEL:$phoneNumber\nEMAIL:$emailAddress\nEND:VCARD';
    },
  ),
  QRCodeType(
    icon: Icons.phone,
    title: 'Phone',
    generateQRData: (String phoneNumber) {
      return 'tel:$phoneNumber';
    },
  ),
  QRCodeType(
    icon: Icons.email,
    title: 'Email',
    generateQRData: (String emailAddress) {
      return 'mailto:$emailAddress';
    },
  ),
  QRCodeType(
    icon: Icons.event,
    title: 'Calendar Event',
    generateQRData: (String eventSummary, String startDate, String endDate,
        String location) {
      return 'BEGIN:VEVENT\nSUMMARY:$eventSummary\nDTSTART:$startDate\nDTEND:$endDate\nLOCATION:$location\nEND:VEVENT';
    },
  ),
  QRCodeType(
    icon: Icons.location_on,
    title: 'Location',
    generateQRData: (double latitude, double longitude) {
      return 'geo:$latitude,$longitude';
    },
  ),
];
