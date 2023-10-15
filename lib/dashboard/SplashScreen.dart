import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:sachiel_website/dashboard/sections/purchase_plan_picker.dart';
import 'package:sachiel_website/resources/colors_resources.dart';
import 'package:sachiel_website/resources/strings_resources.dart';
import 'package:sachiel_website/utils/modifications/numbers.dart';
import 'package:sachiel_website/utils/ui/display.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {

  String generatedVerificationId = "";

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 19), () {

      // launchUrlString("https://play.google.com/store/apps/details?id=co.geeksempire.sachiel.signals", mode: LaunchMode.externalApplication);

    });

    return SafeArea(
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: StringsResources.applicationName(),
            color: ColorsResources.primaryColor,
            theme: ThemeData(
              fontFamily: 'Ubuntu',
              colorScheme: ColorScheme.fromSwatch().copyWith(secondary: ColorsResources.primaryColor),
              pageTransitionsTheme: const PageTransitionsTheme(builders: {
                TargetPlatform.android: ZoomPageTransitionsBuilder(),
                TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
              }),
            ),
            home: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: ColorsResources.black,
                body: Stack(
                    children: [

                      /* Start - Gradient Background - Dark */
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(17),
                              topRight: Radius.circular(17),
                              bottomLeft: Radius.circular(17),
                              bottomRight: Radius.circular(17)
                          ),
                          border: Border(
                              top: BorderSide(
                                color: ColorsResources.black,
                                width: 7,
                              ),
                              bottom: BorderSide(
                                color: ColorsResources.black,
                                width: 7,
                              ),
                              left: BorderSide(
                                color: ColorsResources.black,
                                width: 7,
                              ),
                              right: BorderSide(
                                color: ColorsResources.black,
                                width: 7,
                              )
                          ),
                          gradient: LinearGradient(
                              colors: [
                                ColorsResources.premiumDark,
                                ColorsResources.black,
                              ],
                              begin: FractionalOffset(0.0, 0.0),
                              end: FractionalOffset(1.0, 0.0),
                              stops: [0.0, 1.0],
                              transform: GradientRotation(-45),
                              tileMode: TileMode.clamp
                          ),
                        ),
                      ),
                      /* End - Gradient Background - Dark */

                      /* Start - Branding Transparent */
                      Align(
                        alignment: Alignment.center,
                        child: Opacity(
                            opacity: 0.1,
                            child: Transform.scale(
                                scale: 1.7,
                                child: const Image(
                                  image: AssetImage("assets/logo.png"),
                                )
                            )
                        ),
                      ),
                      /* End - Branding Transparent */

                      /* Start - Gradient Background - Golden */
                      Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(17),
                                    topRight: Radius.circular(17),
                                    bottomLeft: Radius.circular(17),
                                    bottomRight: Radius.circular(17)
                                ),
                                gradient: RadialGradient(
                                  radius: 1.1,
                                  colors: <Color> [
                                    ColorsResources.primaryColorLighter.withOpacity(0.51),
                                    Colors.transparent,
                                  ],
                                  center: const Alignment(0.79, -0.87),
                                )
                            ),
                            child: SizedBox(
                              height: calculatePercentage(99, displayHeight()),
                              width: calculatePercentage(99, displayWidth()),
                            ),
                          )
                      ),
                      /* End - Gradient Background - Golden */

                      /* Start - Purchase Plan Picker */
                      const Positioned(
                          right: 19,
                          top: 19,
                          child: PurchasePlanPicker()
                      ),
                      /* End - Purchase Plan Picker */

                      Center(
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(37, 0, 37, 0),
                              child: Blur(
                                  blur: 5,
                                  blurColor: ColorsResources.dark,
                                  colorOpacity: 0.1,
                                  borderRadius: BorderRadius.circular(19),
                                  overlay: const SizedBox(
                                      width: 357,
                                      height: 137,
                                      child: Center(
                                        child: Text(
                                          "Coming Soon...",
                                          style: TextStyle(
                                              color: ColorsResources.goldenColor,
                                              fontSize: 57,
                                              fontFamily: 'Handwriting'
                                          ),
                                        ),
                                      )
                                  ),
                                  child: const SizedBox(
                                      width: 357,
                                      height: 137,
                                      child: Center(
                                        child: Text(
                                          "Coming Soon...",
                                          style: TextStyle(
                                              color: ColorsResources.goldenColor,
                                              fontSize: 59,
                                              fontFamily: 'Handwriting'
                                          ),
                                        ),
                                      )
                                  )
                              )
                          )
                      ),

                      const Positioned(
                          bottom: 37,
                          left: 37,
                          right: 37,
                          child: SizedBox(
                              height: 53,
                              width: 53,
                              child: Align(
                                alignment: Alignment.center,
                                child: CircularProgressIndicator(
                                  strokeCap: StrokeCap.round,
                                  color: ColorsResources.goldenColor,
                                ),
                              )
                          )
                      )

                    ]
                )
            )
        )
    );
  }

}