import 'package:flutter/material.dart';

class buttonModel {
  Icon icon;
  String title;

  buttonModel({required this.icon, required this.title});
}

List<buttonModel> buttonList = [
  new buttonModel(icon: Icon(Icons.privacy_tip_outlined), title: 'Privacy'),
  new buttonModel(icon: Icon(Icons.access_time), title: 'Purchase History'),
  new buttonModel(icon: Icon(Icons.help_outline), title: 'Help & Support'),
  new buttonModel(icon: Icon(Icons.settings), title: 'Settings'),
  new buttonModel(
      icon: Icon(Icons.person_add_alt_1_outlined), title: 'Invite a Friend'),
];
