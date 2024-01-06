//Afiqah Hazirah Binti Osman S63609
//For updating the main entry point to navigate to the Announcement Screen

import 'package:flutter/material.dart';
import 'package:uni_alert_app/screen/AnnouncementScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UniAlerts',
      theme: ThemeData.dark().copyWith(
        // Customize the dark theme according to your preferences
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.teal, // Customize the primary color
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 50, 58, 60),
      ),
      home: AnnouncementScreen(),
    );
  }
}
