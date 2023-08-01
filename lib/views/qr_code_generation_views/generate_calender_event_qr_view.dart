import 'package:fast_qr/models/qr_code_types_raw_data.dart';
import 'package:flutter/material.dart';

import '../../controllers/qr_generator_controller.dart';

class GenerateCalendarEventQRView extends StatelessWidget {
  final TextEditingController eventSummaryController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final QRGeneratorController controller;

  GenerateCalendarEventQRView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'QR Code Type: Calendar Event',
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
              controller: eventSummaryController,
              decoration: InputDecoration(labelText: 'Enter Event Summary'),
            ),
            TextField(
              controller: startDateController,
              decoration: InputDecoration(labelText: 'Enter Start Date'),
            ),
            TextField(
              controller: endDateController,
              decoration: InputDecoration(labelText: 'Enter End Date'),
            ),
            TextField(
              controller: locationController,
              decoration: InputDecoration(labelText: 'Enter Location'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String eventSummary = eventSummaryController.text;
                String startDate = startDateController.text;
                String endDate = endDateController.text;
                String location = locationController.text;
                // Generate the QR code based on eventSummary, startDate, endDate, and location using CalendarEventQRData
                controller.qrData = CalendarEventQRData(
                  eventSummary: eventSummary,
                  startDate: startDate,
                  endDate: endDate,
                  location: location,
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
