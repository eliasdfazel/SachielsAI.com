/*
 * Copyright © 2022 By Geeks Empire.
 *
 * Created by Elias Fazel
 * Last modified 11/21/22, 1:56 AM
 *
 * Licensed Under MIT License.
 * https://opensource.org/licenses/MIT
 */

import 'package:flutter/material.dart';

double displayLogicalWidth(BuildContext context) {

  return  MediaQuery.of(context).size.width;
}

double displayLogicalHeight(BuildContext context) {

  return  MediaQuery.of(context).size.height;
}

double safeAreaHeight(BuildContext context) {

  var padding = MediaQuery.of(context).padding;

  return displayLogicalWidth(context) - padding.top - padding.bottom;
}

double statusBarHeight(BuildContext context) {

  return MediaQuery.of(context).viewPadding.top;
}