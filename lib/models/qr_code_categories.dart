import 'package:fast_qr/utils/qr_type_enum.dart';
import 'package:flutter/material.dart';

class QRCodeCategory {
  final String title;
  final IconData icon;
  final QRType qRType;

  QRCodeCategory(
      {required this.title, required this.icon, required this.qRType});
}

final List<QRCodeCategory> qrCodeCategories = [
  QRCodeCategory(
    title: 'Plain Text',
    icon: Icons.text_fields,
    qRType: QRType.text,
  ),
  QRCodeCategory(
    title: 'URL',
    icon: Icons.link,
    qRType: QRType.url,
  ),
  QRCodeCategory(
    title: 'WiFi',
    icon: Icons.wifi,
    qRType: QRType.wifi,
  ),
  QRCodeCategory(
    title: 'Contact',
    icon: Icons.contacts,
    qRType: QRType.contact,
  ),
  QRCodeCategory(
    title: 'Phone',
    icon: Icons.phone,
    qRType: QRType.phone,
  ),
  QRCodeCategory(
    title: 'Email',
    icon: Icons.email,
    qRType: QRType.email,
  ),
  QRCodeCategory(
    title: 'Calendar Event',
    icon: Icons.event,
    qRType: QRType.calendarEvent,
  ),
  QRCodeCategory(
    title: 'Location',
    icon: Icons.location_on,
    qRType: QRType.location,
  ),
];
