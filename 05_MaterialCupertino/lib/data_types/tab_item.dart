import 'package:flutter/material.dart';

@immutable
class TabItem {
  final String title;
  final Icon icon;

  const TabItem({required this.title, required this.icon});
}