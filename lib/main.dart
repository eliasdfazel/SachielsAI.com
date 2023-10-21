import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sachiel_website/dashboard/desktop_dashboard/dashboard.dart';
import 'package:sachiel_website/dashboard/mobile_dashboard/dashboard.dart';

import 'firebase_options.dart';

void main() async {

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Widget dashboard = Container();

  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {

    dashboard = const DesktopDashboard();

  } else {

    dashboard = const MobileDashboard();

  }

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: dashboard
  ));

}

