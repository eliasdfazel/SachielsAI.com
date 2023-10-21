
/*
 * Copyright © 2022 By Geeks Empire.
 *
 * Created by Elias Fazel
 * Last modified 11/16/22, 8:59 AM
 *
 * Licensed Under MIT License.
 * https://opensource.org/licenses/MIT
 */

import 'package:flutter/material.dart';
import 'package:sachiel_website/resources/strings_resources.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMedia extends StatefulWidget {

  const SocialMedia({Key? key}) : super(key: key);

  @override
  State<SocialMedia> createState() => SocialMediaStates();

}
class SocialMediaStates extends State<SocialMedia> {

  String profileName = StringsResources.sachielAI();

  Widget profileImage = const Image(
    image: AssetImage("assets/cyborg_girl.jpg"),
    fit: BoxFit.cover,
  );

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

    return SizedBox(
      height: 59,
      width: double.infinity,
      child: Row(
        children: [

          /* Start - Share */
          Expanded(
            flex: 3,
            child: Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                    onTap: () {

                      Share.share("${StringsResources.applicationName()}\n"
                          "${StringsResources.applicationSummary()}\n"
                          "${StringsResources.applicationLink()}");

                    },
                    child: SizedBox(
                        height: 59,
                        width: 59,
                        child: Image.network("https://firebasestorage.googleapis.com/v0/b/sachiel-s-signals.appspot.com/o/Sachiels%2FAssets%2FSocialMedia%2Fshare_icon_small.png?alt=media")
                    )
                )
            ),
          ),
          /* End - Share */

          /* Start - Instagram */
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 7, 0),
                  child: InkWell(
                      onTap: () {

                        launchUrl(Uri.parse(StringsResources.instagramLink()));

                      },
                      child: SizedBox(
                          height: 59,
                          width: 59,
                          child: Image.network("https://firebasestorage.googleapis.com/v0/b/sachiel-s-signals.appspot.com/o/Sachiels%2FAssets%2FSocialMedia%2Finstagram_icon.png?alt=media")
                      )
                  )
              )
          ),
          /* End - Instagram */

          /* Start - Facebook */
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 7, 0),
                  child: InkWell(
                      onTap: () {

                        launchUrl(Uri.parse(StringsResources.facebookLink()));

                      },
                      child: SizedBox(
                          height: 59,
                          width: 59,
                          child: Image.network("https://firebasestorage.googleapis.com/v0/b/sachiel-s-signals.appspot.com/o/Sachiels%2FAssets%2FSocialMedia%2Ffacebook_icon.png?alt=media")
                      )
                  )
              )
          ),
          /* End - Facebook */

          /* Start - Twitter */
          Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                  onTap: () {

                    launchUrl(Uri.parse(StringsResources.twitterLink()));

                  },
                  child: SizedBox(
                      height: 59,
                      width: 59,
                      child: Image.network("https://firebasestorage.googleapis.com/v0/b/sachiel-s-signals.appspot.com/o/Sachiels%2FAssets%2FSocialMedia%2Ftwitter_icon.png?alt=media")
                  )
              )
          ),
          /* End - Twitter */

        ],
      ),
    );
  }

}