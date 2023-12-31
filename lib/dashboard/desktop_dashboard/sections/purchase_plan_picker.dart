/*
 * Copyright © 2022 By Geeks Empire.
 *
 * Created by Elias Fazel
 * Last modified 11/21/22, 1:20 AM
 *
 * Licensed Under MIT License.
 * https://opensource.org/licenses/MIT
 */

import 'package:flutter/material.dart';
import 'package:sachiel_website/resources/colors_resources.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PurchasePlanPickerDesktop extends StatefulWidget {

  const PurchasePlanPickerDesktop({Key? key}) : super(key: key);

  @override
  State<PurchasePlanPickerDesktop> createState() => PurchasePlanPickerStates();

}
class PurchasePlanPickerStates extends State<PurchasePlanPickerDesktop> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: ColorsResources.primaryColorLighter,
                blurRadius: 51,
                spreadRadius: 0,
                offset: Offset(0, 0)
            )
          ]
      ),
      child: SizedBox(
          height: 73,
          width: 73,
          child: InkWell(
              onTap: () {

               Future.delayed(const Duration(milliseconds: 333), () {

                 launchUrlString("https://SachielsAI.com", mode: LaunchMode.externalApplication);

               });

              },
              child: const Image(
                image: AssetImage("assets/logo_icon.png"),
              )
          )
      ),
    );
  }

}