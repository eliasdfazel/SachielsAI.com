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
class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  late AnimationController animationController;

  late Animation<Offset> offsetAnimation;
  late Animation<double> doubleAnimation;

  bool menuOpen = false;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(vsync: this,
        duration: const Duration(milliseconds: 777),
        reverseDuration: const Duration(milliseconds: 333),
        animationBehavior: AnimationBehavior.preserve);

    offsetAnimation = Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0.49, 0))
        .animate(CurvedAnimation(
          parent: animationController,
          curve: Curves.easeIn
        ));
    doubleAnimation = Tween<double>(begin: 1, end: 0.91)
        .animate(CurvedAnimation(
            parent: animationController,
            curve: Curves.easeOut
        ));

  }

  @override
  Widget build(BuildContext context) {

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

                    /* Start - Menu Items */
                    menuItems(),
                    /* End - Menu Items */

                    /* Start - Contents Widgets */
                    allContentsWidgets(),
                    /* End - Contents Widgets */

                  ]
                )
            )
        )
    );
  }

  /*
   * fwfwf
   **/
  Widget allContentsWidgets() {

    return SlideTransition(
        position: offsetAnimation,
        child: ScaleTransition(
            scale: doubleAnimation,
            child: Stack(
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

                  /* Start - Menu */
                  Positioned(
                    left: 19,
                    top: 19,
                    child: SizedBox(
                        height: 59,
                        width: 59,
                        child: InkWell(
                            onTap: () {

                              if (menuOpen) {

                                menuOpen = false;

                                animationController.reverse().whenComplete(() {

                                });

                              } else {


                                menuOpen = true;

                                animationController.forward().whenComplete(() {

                                });
                              }

                            },
                            child: const Image(
                              image: AssetImage("assets/menu.png"),
                            )
                        )
                    ),
                  ),
                  /* End - Menu */

                ]
            )
        )
    );
  }

  Widget menuItems() {

    return Container(
      alignment: AlignmentDirectional.centerStart,
      color: Colors.black,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(0, 37, 0, 37),
        shrinkWrap: true,
        children: [

          Padding(
            padding: const EdgeInsets.only(left: 19, right: 19),
            child: SizedBox(
              height: 73,
              width: 137,
              child: Container(
                color: Colors.lime,
              )
            )
          ),

          const Divider(
            height: 13,
            color: Colors.transparent,
          ),

          Padding(
              padding: const EdgeInsets.only(left: 19, right: 19),
              child: SizedBox(
                  height: 73,
                  width: 137,
                  child: Container(
                    color: Colors.lime,
                  )
              )
          ),

          const Divider(
            height: 13,
            color: Colors.transparent,
          ),

          Padding(
              padding: const EdgeInsets.only(left: 19, right: 19),
              child: SizedBox(
                  height: 73,
                  width: 137,
                  child: Container(
                    color: Colors.lime,
                  )
              )
          ),

        ]
      )
    );
  }

}