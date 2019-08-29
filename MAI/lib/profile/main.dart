import 'package:flutter/material.dart';
import 'profile.dart';

class ProfilePage extends StatelessWidget {
  final Profile _widget = Profile();

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.transparent,
    body: _widget,
  );
}