import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sachiel_website/dashboard/desktop_dashboard/sections/purchase_plan_picker.dart';
import 'package:sachiel_website/dashboard/mobile_dashboard/sections/purchase_plan_picker.dart';
import 'package:sachiel_website/resources/colors_resources.dart';
import 'package:sachiel_website/resources/strings_resources.dart';
import 'package:sachiel_website/utils/modifications/numbers.dart';
import 'package:sachiel_website/utils/ui/display.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HistoryInterface extends StatefulWidget {

  const HistoryInterface({Key? key}) : super(key: key);

  @override
  State<HistoryInterface> createState() => _HistoryInterfaceState();
}
class _HistoryInterfaceState extends State<HistoryInterface> with TickerProviderStateMixin {

  Widget contentPlaceholder = Container();

  Widget purchasePlanPlaceholder = Container();

  /*
   * Start - Menu
   */
  late AnimationController animationController;

  late Animation<Offset> offsetAnimation;
  late Animation<double> doubleAnimation;

  late Animation<Offset> offsetAnimationItems;
  double opacityAnimation = 0.37;

  bool menuOpen = false;
  /*
   * End - Menu
   */

  @override
  void initState() {
    super.initState();

    contentPlaceholder = waiting();

    retrieveCandlesticksHistory();

  }

  @override
  Widget build(BuildContext context) {

    if (GetPlatform.isDesktop) {

      purchasePlanPlaceholder = const Positioned(
          right: 37,
          top: 37,
          child: PurchasePlanPickerDesktop()
      );

    } else {

      purchasePlanPlaceholder = const Positioned(
          right: 19,
          top: 19,
          child: PurchasePlanPickerMobile()
      );

    }

    // Sachiels/Candlesticks/History/[Milliseconds]
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

  Widget waiting() {

    return Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
            colorOne: ColorsResources.premiumLight,
            colorTwo: ColorsResources.primaryColor,
            size: 73
        ),
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
                          height: calculatePercentage(99, displayLogicalHeight(context)),
                          width: calculatePercentage(99, displayLogicalWidth(context)),
                        ),
                      )
                  ),
                  /* End - Gradient Background - Golden */

                  /* Start - Content */
                  Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(19))
                      ),
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 7),
                      child: contentPlaceholder
                  ),
                  /* End - Content */

                  /* Start - Purchase Plan Picker */
                  purchasePlanPlaceholder,
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

                                setState(() {

                                  opacityAnimation = 0.37;

                                });

                              } else {


                                menuOpen = true;

                                animationController.forward().whenComplete(() {

                                });

                                setState(() {

                                  opacityAnimation = 1;

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
        child: SlideTransition(
            position: offsetAnimationItems,
            child: AnimatedOpacity(
                opacity: opacityAnimation,
                duration: Duration(milliseconds: menuOpen ? 753 : 137),
                child: ListView(
                    padding: const EdgeInsets.fromLTRB(19, 37, 0, 37),
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
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
            )
        )
    );
  }

  void retrieveCandlesticksHistory() async {



  }

}