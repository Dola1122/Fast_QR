import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../utils/qr_type_enum.dart';

class QRCodeModel {
  final int id;
  final String title;
  final QRType type;
  final BarcodeFormat format;
  final String dataString;
  final DateTime date;
  final bool isFavorite;
  final bool isScanned;
  final Icon icon;
  final Map<String, dynamic>
      fields;

  QRCodeModel({
    this.id = 0,
    required this.title,
    required this.type,
    required this.format,
    required this.dataString,
    required this.date,
    required this.isFavorite,
    required this.isScanned,
    required this.icon,
    required this.fields,
  });

  factory QRCodeModel.fromJson(Map<String, dynamic> json) {
    return QRCodeModel(
      id: json['id'],
      title: json['title'],
      type: QRType.values.firstWhere((type) => type.name == json['type']),
      format: BarcodeFormat.values
          .firstWhere((format) => format.name == json['format']),
      dataString: json['dataString'],
      date: DateTime.parse(json['date']),
      isFavorite: json['isFavorite'] == 1,
      isScanned: json['isScanned'] == 1,
      icon: Icon(
        IconData(int.parse(json['icon']), fontFamily: 'MaterialIcons'),
      ),
      fields: json['fields'], // Assuming fields are stored as a Map in JSON
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'type': type.name,
      'format': format.name,
      'dataString': dataString,
      'date': date.toIso8601String(),
      'isFavorite': isFavorite ? 1 : 0,
      'isScanned': isScanned ? 1 : 0,
      'icon': icon.icon?.codePoint.toString(),
      'fields': fields,
    };
  }
}
