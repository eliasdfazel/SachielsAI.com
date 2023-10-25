import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sachiel_website/dashboard/mobile_dashboard/mobile_dashboard.dart';

import 'firebase_options.dart';

void main() async {

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Widget dashboard = Container();

  if (GetPlatform.isDesktop) {

    // dashboard = const DesktopDashboard();
    dashboard = const MobileDashboard();

  } else {

    dashboard = const MobileDashboard();

  }

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: dashboard
  ));

}

