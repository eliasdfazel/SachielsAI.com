import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:sachiel_website/dashboard/mobile_dashboard/sections/purchase_plan_picker.dart';
import 'package:sachiel_website/dashboard/mobile_dashboard/sections/social_media.dart';
import 'package:sachiel_website/resources/colors_resources.dart';
import 'package:sachiel_website/resources/strings_resources.dart';
import 'package:sachiel_website/utils/modifications/numbers.dart';
import 'package:sachiel_website/utils/ui/display.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DesktopDashboard extends StatefulWidget {

  const DesktopDashboard({Key? key}) : super(key: key);

  @override
  State<DesktopDashboard> createState() => _DesktopDashboardState();
}
class _DesktopDashboardState extends State<DesktopDashboard> with TickerProviderStateMixin {

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
                      borderRadius: BorderRadius.all(Radius.circular(19)),
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

                  /* Start - Sachiels Signals */
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(19))
                      ),
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 7),
                    child: ListView(
                      padding: const EdgeInsets.fromLTRB(19, 119, 19, 73),
                      children: [

                        Blur(
                          blur: 13,
                          borderRadius: const BorderRadius.all(Radius.circular(19)),
                          blurColor: ColorsResources.premiumDark,
                          colorOpacity: 0.19,
                          alignment: AlignmentDirectional.topStart,
                          overlay: InkWell(
                              onTap: () {

                                launchUrlString(StringsResources.applicationLink(), mode: LaunchMode.externalApplication);

                              },
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [

                                    const Padding(
                                        padding: EdgeInsets.all(7),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(19)),
                                          child: Image(
                                              image: AssetImage("assets/cover.png"),
                                              height: 231,
                                              fit: BoxFit.cover
                                          ),
                                        )
                                    ),

                                    Padding(
                                        padding: const EdgeInsets.all(7),
                                        child: SizedBox(
                                            height: 73,
                                            child: Row(
                                              children: [

                                                Expanded(
                                                  flex: 13,
                                                  child: Container(
                                                    height: 73,
                                                    alignment: Alignment.centerLeft,
                                                    child: Text(
                                                      StringsResources.applicationName(),
                                                      textAlign: TextAlign.start,
                                                      maxLines: 2,
                                                      style: const TextStyle(
                                                          color: ColorsResources.premiumLight,
                                                          fontSize: 23,
                                                          letterSpacing: 1.7
                                                      ),
                                                    ),
                                                  ),
                                                ),

                                                Expanded(
                                                  flex: 3,
                                                  child: Container(
                                                    alignment: Alignment.centerRight,
                                                    height: 73,
                                                    child: const Image(
                                                      image: AssetImage("assets/download.png"),
                                                      height: 37,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                )

                                              ],
                                            )
                                        )
                                    )

                                  ]
                              )
                          ),
                          child: SizedBox(
                            height: 333,
                            child: Container(),
                          ),
                        ),

                        const Divider(
                          height: 37,
                          color: Colors.transparent,
                        ),

                        Blur(
                          blur: 13,
                          borderRadius: const BorderRadius.all(Radius.circular(19)),
                          blurColor: ColorsResources.premiumDark,
                          colorOpacity: 0.19,
                          alignment: AlignmentDirectional.topStart,
                          overlay: InkWell(
                              onTap: () {

                                launchUrlString(StringsResources.twitterLink(), mode: LaunchMode.externalApplication);

                              },
                              child: Stack(
                                children: [

                                  Padding(
                                      padding: const EdgeInsets.all(7),
                                      child: SizedBox(
                                          height: 137,
                                          child: Row(
                                            children: [

                                              Expanded(
                                                flex: 5,
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: 137,
                                                  child: const Image(
                                                    image: AssetImage("assets/candlestick_logo.png"),
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),

                                              Expanded(
                                                flex: 1,
                                                child: Container(),
                                              ),

                                              Expanded(
                                                flex: 13,
                                                child: Container(
                                                  height: 73,
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    StringsResources.applicationNameCandlesticks(),
                                                    textAlign: TextAlign.start,
                                                    maxLines: 2,
                                                    style: const TextStyle(
                                                        color: ColorsResources.premiumLight,
                                                        fontSize: 23,
                                                        letterSpacing: 1.7
                                                    ),
                                                  ),
                                                ),
                                              ),

                                            ],
                                          )
                                      )
                                  ),

                                  Positioned(
                                    top: -7,
                                    right: 19,
                                    child: SizedBox(
                                      height: 51,
                                      width: 51,
                                      child: Image(
                                        image: AssetImage("assets/coming_soon.png"),
                                        color: ColorsResources.premiumLight,
                                      )
                                    )
                                  )

                                ]
                              )
                          ),
                          child: SizedBox(
                            height: 137,
                            child: Container(),
                          ),
                        ),

                        const Divider(
                          height: 37,
                          color: Colors.transparent,
                        ),

                        const SocialMedia(),

                      ],
                    )
                  ),
                  /* End - Sachiels Signals */

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
                  )
                  /* End - Menu */

                ]
            )
        )
    );
  }

  Widget menuItems() {

    return Container(
      width: calculatePercentage(53, displayLogicalWidth(context)),
      alignment: AlignmentDirectional.centerStart,
      color: Colors.black,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(19, 37, 0, 37),
        shrinkWrap: true,
        children: [

          SizedBox(
              height: 73,
              child: InkWell(
                  onTap: () {

                    launchUrlString(StringsResources.geeksEmpireAndroid(), mode: LaunchMode.externalApplication);

                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        const Expanded(
                            flex: 5,
                            child: Image(
                                image: AssetImage("assets/geeksempire_logo.png")
                            )
                        ),

                        Expanded(
                            flex: 2,
                            child: Container()
                        ),

                        Expanded(
                            flex: 11,
                            child: Text(
                              StringsResources.geeksEmpire(),
                              maxLines: 2,
                              style: const TextStyle(
                                  color: ColorsResources.light,
                                  fontSize: 23
                              ),
                            )
                        )

                      ]
                  )
              )
          ),

          const Divider(
            height: 99,
            color: Colors.transparent,
          ),

          SizedBox(
              height: 51,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(11),
                child: Material(
                  shadowColor: Colors.transparent,
                  color: Colors.transparent,
                  child: InkWell(
                      splashColor: ColorsResources.lightestYellow.withOpacity(0.31),
                      splashFactory: InkRipple.splashFactory,
                      onTap: () {

                        launchUrlString(StringsResources.academyLink(), mode: LaunchMode.externalApplication);

                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            const Expanded(
                                flex: 3,
                                child: Padding(
                                    padding: EdgeInsets.all(3),
                                    child: Image(
                                      image: AssetImage("assets/newspaper.png"),
                                      color: ColorsResources.light,
                                    )
                                )
                            ),

                            Expanded(
                                flex: 1,
                                child: Container()
                            ),

                            Expanded(
                                flex: 11,
                                child: Text(
                                  StringsResources.academyTitle(),
                                  maxLines: 2,
                                  style: const TextStyle(
                                      color: ColorsResources.lightTransparent,
                                      fontSize: 19
                                  ),
                                )
                            )

                          ]
                      )
                  )
                )
              )
          ),

          const Divider(
            height: 13,
            color: Colors.transparent,
          ),

          SizedBox(
              height: 51,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(11),
                child: Material(
                  shadowColor: Colors.transparent,
                  color: Colors.transparent,
                  child: InkWell(
                      splashColor: ColorsResources.lightestYellow.withOpacity(0.31),
                      splashFactory: InkRipple.splashFactory,
                      onTap: () {

                        launchUrlString(StringsResources.tosLink(), mode: LaunchMode.externalApplication);

                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            const Expanded(
                                flex: 3,
                                child: Padding(
                                    padding: EdgeInsets.all(3),
                                    child: Image(
                                      image: AssetImage("assets/tos.png"),
                                      color: ColorsResources.light,
                                    )
                                )
                            ),

                            Expanded(
                                flex: 1,
                                child: Container()
                            ),

                            Expanded(
                                flex: 11,
                                child: Text(
                                  StringsResources.termService(),
                                  maxLines: 2,
                                  style: const TextStyle(
                                      color: ColorsResources.lightTransparent,
                                      fontSize: 19
                                  ),
                                )
                            )

                          ]
                      )
                  )
                )
              )
          ),

          const Divider(
            height: 13,
            color: Colors.transparent,
          ),

          SizedBox(
              height: 51,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(11),
                child: Material(
                  shadowColor: Colors.transparent,
                  color: Colors.transparent,
                  child: InkWell(
                      splashColor: ColorsResources.lightestYellow.withOpacity(0.31),
                      splashFactory: InkRipple.splashFactory,
                      onTap: () {

                        launchUrlString(StringsResources.privacyPolicyLink(), mode: LaunchMode.externalApplication);

                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            const Expanded(
                                flex: 3,
                                child: Padding(
                                    padding: EdgeInsets.all(3),
                                    child: Image(
                                      image: AssetImage("assets/privacy.png"),
                                      color: ColorsResources.light,
                                    )
                                )
                            ),

                            Expanded(
                                flex: 1,
                                child: Container()
                            ),

                            Expanded(
                                flex: 11,
                                child: Text(
                                  StringsResources.privacyPolicy(),
                                  maxLines: 2,
                                  style: const TextStyle(
                                      color: ColorsResources.lightTransparent,
                                      fontSize: 19
                                  ),
                                )
                            )

                          ]
                      )
                  )
                )
              )
          ),

          const Divider(
            height: 73,
            color: Colors.transparent,
          ),

          SizedBox(
              height: 51,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    InkWell(
                      onTap: () {

                        launchUrlString(StringsResources.geeksEmpireThreads(), mode: LaunchMode.externalApplication);

                      },
                      child: const Image(
                        image: AssetImage("assets/threads_icon.png"),
                        height: 51,
                        width: 51,
                      )
                    ),

                    Container(
                      width: 13,
                    ),

                    InkWell(
                      onTap: () {

                        launchUrlString(StringsResources.geeksEmpireTwitter(), mode: LaunchMode.externalApplication);

                      },
                      child: const Image(
                        image: AssetImage("assets/twitter_icon.png"),
                        height: 51,
                        width: 51,
                      )
                    )

                  ]
              )
          ),

        ]
      )
    );
  }

}