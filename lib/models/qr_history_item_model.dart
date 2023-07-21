import 'package:flutter/material.dart';

class QRHistoryItemModel {
  final String title;
  final IconData icon;
  bool isFavorite;

  QRHistoryItemModel({
    required this.title,
    required this.icon,
    this.isFavorite = false,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }
}
