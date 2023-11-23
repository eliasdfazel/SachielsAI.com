import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sachiel_website/dashboard/desktop_dashboard/desktop_dashboard.dart';
import 'package:sachiel_website/dashboard/mobile_dashboard/mobile_dashboard.dart';
import 'package:sachiel_website/history/ui/HistoryInterface.dart';
import 'package:sachiel_website/reviews/ui/reviews_interface.dart';

import 'firebase_options.dart';

void main() async {

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Widget dashboard = Container();

  if (GetPlatform.isDesktop) {

    dashboard = const DesktopDashboard();

  } else {

    dashboard = const MobileDashboard();

  }

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: dashboard,
    routes: <String, WidgetBuilder> {
      '/DesktopDashboard': (BuildContext context) => const DesktopDashboard(),
      '/MobileDashboard': (BuildContext context) => const MobileDashboard(),
      '/CandlesticksHistory': (BuildContext context) => HistoryInterface(authenticationId: ""),
      '/Reviews': (BuildContext context) => ReviewsInterface()
    },
    onGenerateRoute: (routeSettings) {

      Uri uri = Uri.parse(routeSettings.name ?? "");

      Map<String, dynamic> parameters = {};

      uri.queryParameters.forEach((key, value) {

        parameters[key] = value;

      });

      if (parameters["authenticationId"].toString().isNotEmpty) {
        debugPrint("Authentication Id: ${parameters["authenticationId"].toString().toUpperCase()}");

        return MaterialPageRoute(
            builder: (_) => HistoryInterface(authenticationId: parameters["authenticationId"].toString().toUpperCase())
        );

      } else {

        if (GetPlatform.isDesktop) {

          dashboard = const DesktopDashboard();

        } else {

          dashboard = const MobileDashboard();

        }

        return MaterialPageRoute(
            builder: (_) => dashboard
        );

      }

    },
    onUnknownRoute: (RouteSettings settings) {
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) {

          if (GetPlatform.isDesktop) {

            dashboard = const DesktopDashboard();

          } else {

            dashboard = const MobileDashboard();

          }

          return dashboard;
        }
      );
    }
  )
  );

}

