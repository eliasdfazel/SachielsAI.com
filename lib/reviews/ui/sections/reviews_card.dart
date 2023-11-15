/*
 * Copyright © 2023 By Geeks Empire.
 *
 * Created by Elias Fazel
 * Last modified 11/1/23, 9:57 AM
 *
 * Licensed Under MIT License.
 * https://opensource.org/licenses/MIT
 */

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:sachiel_website/resources/colors_resources.dart';
import 'package:sachiel_website/reviews/data/ReviewsDataStructure.dart';

class ReviewsCard extends StatefulWidget {

  ReviewsDataStructure reviewsDataStructure;

  ReviewsCard({Key? key, required this.reviewsDataStructure}) : super(key: key);

  @override
  State<ReviewsCard> createState() => _ReviewsCardState();
}
class _ReviewsCardState extends State<ReviewsCard> {

  final flipController = FlipCardController();

  bool detailsCard = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return FlipCard(
        rotateSide: detailsCard ? RotateSide.left : RotateSide.right,
        onTapFlipping: true,
        axis: FlipAxis.vertical,
        controller: flipController,
        animationDuration: const Duration(milliseconds: 777),
        frontWidget: foregroundCard(),
        backWidget: backgroundCard()
    );
  }

  Widget foregroundCard() {

    return ClipRRect(
        borderRadius: BorderRadius.circular(19),
        child: Material(
            shadowColor: Colors.transparent,
            color: Colors.transparent,
            child: InkWell(
                splashColor: ColorsResources.lightestYellow.withOpacity(0.31),
                splashFactory: InkRipple.splashFactory,
                onTap: () async {

                  setState(() {

                    detailsCard = true;

                  });

                  await flipController.flipcard();

                },
                child: Container(
                    color: ColorsResources.premiumDark.withOpacity(0.37),
                    child: Stack(
                        children: [

                          Center(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(19),
                                  child: Image(
                                    image: NetworkImage(widget.reviewsDataStructure.userReviewerAvatarValue()),
                                    alignment: Alignment.center,
                                    fit: BoxFit.cover,
                                  )
                              )
                          ),

                          Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 17),
                                child: SizedBox(
                                  height: 31,
                                  child: RatingStars(
                                    value: double.parse(widget.reviewsDataStructure.productRateValue()),
                                    starBuilder: (index, color) => Icon(
                                      Icons.star,
                                      color: color,
                                    ),
                                    starCount: 5,
                                    starSize: 19,
                                    maxValue: 5,
                                    starSpacing: 2,
                                    maxValueVisibility: true,
                                    valueLabelVisibility: false,
                                    animationDuration: const Duration(milliseconds: 5555),
                                    starOffColor: ColorsResources.premiumLight,
                                    starColor: ColorsResources.primaryColor,
                                  )
                                )
                              )
                          ),

                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                  padding: const EdgeInsets.only(bottom: 19),
                                  child:  Text(
                                      widget.reviewsDataStructure.userReviewerValue(),
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      style: const TextStyle(
                                          color: ColorsResources.premiumLight,
                                          fontSize: 17,
                                          letterSpacing: 1.3,
                                          fontWeight: FontWeight.bold
                                      )
                                  )
                              )
                          )

                        ]
                    )
                )
            )
        )
    );
  }

  Widget backgroundCard() {

    return ClipRRect(
        borderRadius: BorderRadius.circular(19),
        child: Material(
            shadowColor: Colors.transparent,
            color: Colors.transparent,
            child: InkWell(
                splashColor: ColorsResources.lightestYellow.withOpacity(0.31),
                splashFactory: InkRipple.splashFactory,
                onTap: () async {

                  setState(() {

                    detailsCard = false;

                  });

                  await flipController.flipcard();

                },
                child: Container(
                    color: ColorsResources.premiumDark.withOpacity(0.37),
                    child: Stack(
                        children: [

                          Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(19),
                                child: Image(
                                  image: NetworkImage(widget.reviewsDataStructure.userReviewerAvatarValue()),
                                  alignment: Alignment.center,
                                  fit: BoxFit.cover,
                                )
                              )
                          ),

                          Blur(
                            blur: 13,
                            borderRadius: BorderRadius.circular(13),
                            blurColor: ColorsResources.premiumDark,
                            colorOpacity: 0.37,
                            overlay: Padding(
                                padding: const EdgeInsets.all(19),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Html(
                                        data: widget.reviewsDataStructure.productReviewValue(),
                                        style: {
                                          'p': Style(
                                              maxLines: 7,
                                              color: ColorsResources.premiumLight,
                                              fontSize: const FontSize(17),
                                              letterSpacing: 1.3,
                                              fontWeight: FontWeight.normal
                                          )
                                        }
                                    )
                                )
                            ),
                            child: Container(),
                          ),

                        ]
                    )
                )
            )
        )
    );
  }

}