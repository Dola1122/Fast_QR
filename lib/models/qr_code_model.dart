import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeModel {
  final int id;
  final String title;
  final String type;
  final BarcodeFormat format;
  final String dataString;
  final DateTime date;
  final bool isFavorite;
  final bool isScanned;
  final Icon icon;

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
  });

  factory QRCodeModel.fromJson(Map<String, dynamic> json) {
    return QRCodeModel(
      id: json['id'],
      title: json['title'],
      type: json['type'],
      format: BarcodeFormat.values
          .firstWhere((format) => format.name == json['format']),
      dataString: json['dataString'],
      date: DateTime.parse(json['date']),
      isFavorite: json['isFavorite'] == 1,
      isScanned: json['isScanned'] == 1,
      icon: Icon(
        IconData(int.parse(json['icon']), fontFamily: 'MaterialIcons'),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'type': type,
      'format': format.name,
      'dataString': dataString,
      'date': date.toIso8601String(),
      'isFavorite': isFavorite ? 1 : 0,
      'isScanned': isScanned ? 1 : 0,
      'icon': icon.icon?.codePoint.toString(),
    };
  }
}
