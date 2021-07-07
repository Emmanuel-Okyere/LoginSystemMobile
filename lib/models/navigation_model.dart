import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  IconData icon;
  NavigationModel({required this.title, required this.icon});
}

List<NavigationModel> navigationItems = [
  NavigationModel(title: "Dashboard", icon: Icons.insert_chart),
  NavigationModel(title: "Schedule", icon: Icons.access_alarms_sharp),
  NavigationModel(title: "Overview", icon: Icons.analytics_sharp),
  NavigationModel(title: "About", icon: Icons.help),
];