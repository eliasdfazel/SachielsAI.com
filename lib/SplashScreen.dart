import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:sachiel_website/resources/colors_resources.dart';
import 'package:sachiel_website/resources/strings_resources.dart';
import 'package:url_launcher/url_launcher_string.dart';

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

      launchUrlString("https://play.google.com/store/apps/details?id=co.geeksempire.sachiel.signals", mode: LaunchMode.externalApplication);

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

                      Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(0)),
                              color: ColorsResources.black,
                              image: DecorationImage(
                                  image: AssetImage("assets/background.jpg"),
                                  fit: BoxFit.cover,
                                opacity: 0.13
                              )
                          )
                      ),

                      const Positioned(
                        top: 37,
                        left: 37,
                        right: 37,
                        child: SizedBox(
                          width: 237,
                          height: 237,
                          child: Image(
                            image: AssetImage("assets/logo.png"),
                            fit: BoxFit.fitHeight,
                          ),
                        )
                      ),

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