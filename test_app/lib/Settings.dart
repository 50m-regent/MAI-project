import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';

var now = 0;

var nameColor = Colors.white;

var uiDirection = 0;

//TODO: make setting system
//Future getUIDirection() async {
//  final prefs = await SharedPreferences.getInstance();
//  uiDirection = prefs.getInt("uiDirection") ?? 0;
//}
//saveUIDirection() async {
//  uiDirection = 1 - uiDirection;
//  final prefs = await SharedPreferences.getInstance();
//  prefs.setInt("uiDirection", uiDirection);
//}

var notificationFlag = 1;

//Future getNotificationFlag() async {
//  final prefs = await SharedPreferences.getInstance();
//  notificationFlag = prefs.getInt("notificationFlag") ?? 1;
//}
//saveNotificationFlag() async {
//  notificationFlag = 1 - notificationFlag;
//  final prefs = await SharedPreferences.getInstance();
//  prefs.setInt("notificationFlag", notificationFlag);
//}

var lockFlag = 0;