import 'package:flutter/material.dart';

class CropGrade {
  final String id;
  final String batchNumber;
  final String cropName;
  final String grade;
  final String status;
  final DateTime dateTime;
  final String imageUrl;

  CropGrade({
    required this.id,
    required this.batchNumber,
    required this.cropName,
    required this.grade,
    required this.status,
    required this.dateTime,
    required this.imageUrl,
  });
}

class MarketPrice {
  final String cropName;
  final String variety;
  final double price;
  final double change;
  final String imageUrl;

  MarketPrice({
    required this.cropName,
    required this.variety,
    required this.price,
    required this.change,
    required this.imageUrl,
  });
}

class AppNotification {
  final String id;
  final String title;
  final String message;
  final DateTime dateTime;
  final IconData icon;
  final Color iconColor;

  AppNotification({
    required this.id,
    required this.title,
    required this.message,
    required this.dateTime,
    required this.icon,
    required this.iconColor,
  });
}
