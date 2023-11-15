import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sachiel_website/dashboard/desktop_dashboard//sections/social_media.dart';
import 'package:sachiel_website/dashboard/desktop_dashboard/sections/purchase_plan_picker.dart';
import 'package:sachiel_website/database/remote/Registrations.dart';
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

  /*
   * Start - Registration
   */
  Registrations registrations = Registrations();

  TextEditingController emailAddress = TextEditingController();

  double candlestickHeight = 535;

  bool registeredVisibility = true;
  /*
   * End - Registration
   */

  String? warningNoticeTitle;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(vsync: this,
        duration: const Duration(milliseconds: 777),
        reverseDuration: const Duration(milliseconds: 333),
        animationBehavior: AnimationBehavior.preserve);

    offsetAnimation = Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0.31, 0))
        .animate(CurvedAnimation(
          parent: animationController,
          curve: Curves.easeIn
        ));
    doubleAnimation = Tween<double>(begin: 1, end: 0.91)
        .animate(CurvedAnimation(
            parent: animationController,
            curve: Curves.easeOut
        ));

    offsetAnimationItems = Tween<Offset>(begin: const Offset(-0.19, 0), end: const Offset(0, 0))
        .animate(CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn
    ));

    registrations.isRegistered().then((alreadyRegistered) => {

      Future.delayed(Duration.zero, () {

        if (alreadyRegistered) {

          setState(() {

            candlestickHeight = 391;

            registeredVisibility = false;

          });

        }

      })

    });

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
                    child: ListView(
                      padding: const EdgeInsets.fromLTRB(19, 157, 19, 73),
                      physics: const BouncingScrollPhysics(),
                      children: [

                        /*
                         * Start - Content
                         */
                        Padding(
                          padding: const EdgeInsets.only(left: 19, right: 19),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                /*
                                 * Start - Sachiels Signals
                                 */
                                Expanded(
                                  flex: 1,
                                  child: Blur(
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
                                                    padding: EdgeInsets.all(13),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.all(Radius.circular(19)),
                                                      child: Image(
                                                          image: AssetImage("assets/cover.png"),
                                                          height: 379,
                                                          fit: BoxFit.cover
                                                      ),
                                                    )
                                                ),

                                                Padding(
                                                    padding: const EdgeInsets.all(13),
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
                                                                      fontSize: 31,
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
                                                                  height: 51,
                                                                  fit: BoxFit.contain,
                                                                ),
                                                              ),
                                                            )

                                                          ],
                                                        )
                                                    )
                                                ),

                                                Padding(
                                                  padding: const EdgeInsets.all(13),
                                                  child: SizedBox(
                                                    height: 153,
                                                    child: Align(
                                                      alignment: Alignment.topLeft,
                                                      child: Text(
                                                        StringsResources.sachielsSignalsDescription(),
                                                        style: TextStyle(
                                                          fontSize: 19,
                                                          color: ColorsResources.premiumLight.withOpacity(0.73),
                                                          letterSpacing: 1.37
                                                        )
                                                      )
                                                    )
                                                  )
                                                )

                                              ]
                                          )
                                      ),
                                      child: SizedBox(
                                        height: 701,
                                        child: Container(),
                                      )
                                  ),
                                ),
                                /*
                                 * End - Sachiels Signals
                                 */

                                const SizedBox(
                                  width: 19,
                                ),

                                /*
                                 * Start - Candlesticks
                                 */
                                Expanded(
                                  flex: 1,
                                  child: Blur(
                                    blur: 13,
                                    borderRadius: const BorderRadius.all(Radius.circular(19)),
                                    blurColor: ColorsResources.premiumDark,
                                    colorOpacity: 0.19,
                                    alignment: AlignmentDirectional.topStart,
                                    overlay: InkWell(
                                        onTap: () {

                                          launchUrlString(StringsResources.applicationLink(), mode: LaunchMode.externalApplication);

                                        },
                                        child: Padding(
                                            padding: const EdgeInsets.fromLTRB(13, 19, 13, 13),
                                            child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [

                                                  SizedBox(
                                                      height: 137,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [

                                                          Container(
                                                            alignment: Alignment.centerLeft,
                                                            height: 107,
                                                            width: 107,
                                                            child: const Image(
                                                              image: AssetImage("assets/candlestick_logo.png"),
                                                              fit: BoxFit.contain,
                                                              height: 107,
                                                              width: 107,
                                                            ),
                                                          ),

                                                          const SizedBox(
                                                            width: 19,
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
                                                                    fontSize: 29,
                                                                    letterSpacing: 1.7
                                                                ),
                                                              ),
                                                            ),
                                                          ),

                                                        ],
                                                      )
                                                  ),

                                                  Text(
                                                      StringsResources.candlestickDescription(),
                                                      maxLines: 10,
                                                      style: const TextStyle(
                                                          color: ColorsResources.premiumLightTransparent,
                                                          fontSize: 15,
                                                          letterSpacing: 1.13,
                                                          height: 1.37
                                                      )
                                                  ),

                                                  Visibility(
                                                      visible: registeredVisibility,
                                                      child: SizedBox(
                                                        height: 19,
                                                        child: Container(),
                                                      )
                                                  ),

                                                  Visibility(
                                                      visible: registeredVisibility,
                                                      child: SizedBox(
                                                          height: 137,
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [

                                                              Expanded(
                                                                  flex: 13,
                                                                  child: Container(
                                                                      alignment: Alignment.centerLeft,
                                                                      height: 137,
                                                                      child: TextField(
                                                                          controller: emailAddress,
                                                                          textAlign: TextAlign.left,
                                                                          textDirection: TextDirection.ltr,
                                                                          textAlignVertical: TextAlignVertical.center,
                                                                          maxLines: 1,
                                                                          cursorColor: ColorsResources.primaryColor,
                                                                          autocorrect: true,
                                                                          autofocus: false,
                                                                          keyboardType: TextInputType.emailAddress,
                                                                          textInputAction: TextInputAction.done,
                                                                          style: const TextStyle(
                                                                              color: ColorsResources.premiumLight,
                                                                              fontSize: 19
                                                                          ),
                                                                          decoration: InputDecoration(
                                                                            alignLabelWithHint: true,
                                                                            border: const OutlineInputBorder(
                                                                                borderSide: BorderSide(color: ColorsResources.primaryColor, width: 1.0),
                                                                                borderRadius: BorderRadius.only(
                                                                                    topLeft: Radius.circular(13),
                                                                                    topRight: Radius.circular(13),
                                                                                    bottomLeft: Radius.circular(13),
                                                                                    bottomRight: Radius.circular(13)
                                                                                ),
                                                                                gapPadding: 5
                                                                            ),
                                                                            enabledBorder: const OutlineInputBorder(
                                                                                borderSide: BorderSide(color: ColorsResources.primaryColor, width: 1.0),
                                                                                borderRadius: BorderRadius.only(
                                                                                    topLeft: Radius.circular(13),
                                                                                    topRight: Radius.circular(13),
                                                                                    bottomLeft: Radius.circular(13),
                                                                                    bottomRight: Radius.circular(13)
                                                                                ),
                                                                                gapPadding: 5
                                                                            ),
                                                                            focusedBorder: const OutlineInputBorder(
                                                                                borderSide: BorderSide(color: ColorsResources.primaryColor, width: 1.0),
                                                                                borderRadius: BorderRadius.only(
                                                                                    topLeft: Radius.circular(13),
                                                                                    topRight: Radius.circular(13),
                                                                                    bottomLeft: Radius.circular(13),
                                                                                    bottomRight: Radius.circular(13)
                                                                                ),
                                                                                gapPadding: 5
                                                                            ),
                                                                            errorBorder: const OutlineInputBorder(
                                                                                borderSide: BorderSide(color: ColorsResources.primaryColor, width: 1.0),
                                                                                borderRadius: BorderRadius.only(
                                                                                    topLeft: Radius.circular(13),
                                                                                    topRight: Radius.circular(13),
                                                                                    bottomLeft: Radius.circular(13),
                                                                                    bottomRight: Radius.circular(13)
                                                                                ),
                                                                                gapPadding: 5
                                                                            ),
                                                                            errorText: warningNoticeTitle,
                                                                            filled: true,
                                                                            fillColor: ColorsResources.premiumDarkTransparent,
                                                                            labelText: StringsResources.preregister(),
                                                                            labelStyle: const TextStyle(
                                                                                color: ColorsResources.primaryColor,
                                                                                fontSize: 19.0
                                                                            ),
                                                                            hintText: StringsResources.preregisterHint(),
                                                                            hintStyle: const TextStyle(
                                                                                color: ColorsResources.primaryColorDarker,
                                                                                fontSize: 17.0
                                                                            ),
                                                                          )
                                                                      )
                                                                  )
                                                              ),

                                                              SizedBox(
                                                                width: 19,
                                                                child: Container(),
                                                              ),

                                                              Expanded(
                                                                  flex: 3,
                                                                  child: Container(
                                                                      height: 73,
                                                                      alignment: Alignment.centerLeft,
                                                                      child: ClipRRect(
                                                                          borderRadius: BorderRadius.circular(11),
                                                                          child: Material(
                                                                              shadowColor: Colors.transparent,
                                                                              color: Colors.transparent,
                                                                              child: InkWell(
                                                                                  splashColor: ColorsResources.lightestYellow.withOpacity(0.31),
                                                                                  splashFactory: InkRipple.splashFactory,
                                                                                  onTap: () async {

                                                                                    if (emailAddress.text.isNotEmpty
                                                                                        && emailAddress.text.isEmail) {

                                                                                      bool alreadyRegistered = await registrations.isRegistered();

                                                                                      if (alreadyRegistered) {

                                                                                        setState(() {

                                                                                          candlestickHeight = 391;

                                                                                          registeredVisibility = false;

                                                                                        });

                                                                                      } else {

                                                                                        registrations.preregistrationCandlestick(emailAddress.text);

                                                                                        setState(() {

                                                                                          candlestickHeight = 391;

                                                                                          registeredVisibility = false;

                                                                                        });

                                                                                      }

                                                                                    } else {

                                                                                      setState(() {

                                                                                        warningNoticeTitle = StringsResources.warning();

                                                                                      });
                                                                                    }

                                                                                  },
                                                                                  child: const Padding(
                                                                                      padding: EdgeInsets.all(7),
                                                                                      child: Image(
                                                                                        image: AssetImage("assets/register_icon.png"),
                                                                                        color: ColorsResources.primaryColorLighter,
                                                                                        fit: BoxFit.contain,
                                                                                      )
                                                                                  )
                                                                              )
                                                                          )
                                                                      )
                                                                  )
                                                              ),

                                                            ],
                                                          )
                                                      )
                                                  ),

                                                ]
                                            )
                                        )
                                    ),
                                    child: SizedBox(
                                      height: candlestickHeight,
                                      child: Container(),
                                    ),
                                  ),
                                )
                                /*
                                 * End - Candlesticks
                                 */

                              ]
                          )
                        ),
                        /*
                         * End - Content
                         */

                        const Divider(
                          height: 73,
                          color: Colors.transparent,
                        ),

                        const SocialMedia(),

                      ]
                    )
                  ),
                  /* End - Content */

                  /* Start - Purchase Plan Picker */
                  const Positioned(
                      right: 37,
                      top: 37,
                      child: PurchasePlanPickerDesktop()
                  ),
                  /* End - Purchase Plan Picker */

                  /* Start - Menu */
                  Positioned(
                    left: 37,
                    top: 37,
                    child: SizedBox(
                        height: 73,
                        width: 73,
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
              padding: const EdgeInsets.fromLTRB(19, 37, 19, 37),
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
                                  child: Image(
                                    image: AssetImage("assets/geeksempire_logo.png"),
                                    height: 73,
                                    width: 73,
                                  )
                              ),

                              const SizedBox(
                                width: 19,
                              ),

                              Expanded(
                                  flex: 11,
                                  child: Text(
                                    StringsResources.geeksEmpire(),
                                    maxLines: 2,
                                    style: const TextStyle(
                                        color: ColorsResources.light,
                                        fontSize: 37
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
                    height: 59,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(11),
                        child: Material(
                            shadowColor: Colors.transparent,
                            color: Colors.transparent,
                            child: InkWell(
                                splashColor: ColorsResources.lightestYellow.withOpacity(0.31),
                                splashFactory: InkRipple.splashFactory,
                                onTap: () {

                                  launchUrlString(StringsResources.reviewsLink(), mode: LaunchMode.externalApplication);

                                },
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [

                                      const Padding(
                                          padding: EdgeInsets.all(3),
                                          child: Image(
                                            image: AssetImage("assets/reviews.png"),
                                            color: ColorsResources.light,
                                          )
                                      ),

                                      const SizedBox(
                                        width: 19,
                                      ),

                                      Expanded(
                                          child: Text(
                                            StringsResources.reviewsTitle(),
                                            maxLines: 2,
                                            style: const TextStyle(
                                                color: ColorsResources.lightTransparent,
                                                fontSize: 23
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
                  height: 19,
                  color: Colors.transparent,
                ),

                SizedBox(
                    height: 59,
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

                                      const Padding(
                                          padding: EdgeInsets.all(3),
                                          child: Image(
                                            image: AssetImage("assets/newspaper.png"),
                                            color: ColorsResources.light,
                                          )
                                      ),

                                      const SizedBox(
                                        width: 19,
                                      ),

                                      Expanded(
                                          child: Text(
                                            StringsResources.academyTitle(),
                                            maxLines: 2,
                                            style: const TextStyle(
                                                color: ColorsResources.lightTransparent,
                                                fontSize: 23
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
                  height: 23,
                  color: ColorsResources.premiumDarkTransparent,
                ),

                SizedBox(
                    height: 59,
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

                                      const Padding(
                                          padding: EdgeInsets.fromLTRB(3, 13, 13, 13),
                                          child: Image(
                                            image: AssetImage("assets/tos.png"),
                                            color: ColorsResources.light,
                                          )
                                      ),

                                      const SizedBox(
                                        width: 19,
                                      ),

                                      Expanded(
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
                  height: 7,
                  color: Colors.transparent,
                ),

                SizedBox(
                    height: 59,
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

                                      const Padding(
                                          padding: EdgeInsets.fromLTRB(3, 13, 13, 13),
                                          child: Image(
                                            image: AssetImage("assets/privacy.png"),
                                            color: ColorsResources.light,
                                          )
                                      ),

                                      const SizedBox(
                                        width: 19,
                                      ),


                                      Expanded(
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
                    height: 73,
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
                                height: 73,
                                width: 73,
                              )
                          ),

                          const SizedBox(
                            width: 19,
                          ),

                          InkWell(
                              onTap: () {

                                launchUrlString(StringsResources.geeksEmpireTwitter(), mode: LaunchMode.externalApplication);

                              },
                              child: const Image(
                                image: AssetImage("assets/twitter_icon.png"),
                                height: 73,
                                width: 73,
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

}