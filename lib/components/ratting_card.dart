import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:trubuy/util/time_util.dart';

import '../constants.dart';
import '../data/models/product_model.dart';
class RatingCard extends StatefulWidget {
  RatingCard({
    super.key,
    required this.review,
  });

  Review review ;

  @override
  State<RatingCard> createState() => _RatingCardState();
}

class _RatingCardState extends State<RatingCard> {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.035),
        borderRadius:
            const BorderRadius.all(Radius.circular(defaultBorderRadious)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  text: "${widget.review.reviewerName} ",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(
                      text: " ${TimeUtil.getTimesToAgo(dateTime: widget.review.date)}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                    ),
                  ],
                ),
              ),


              RatingBar.builder(
                initialRating: widget.review.rating.toDouble(),
                itemSize: 15,
                itemPadding: const EdgeInsets.only(right: defaultPadding / 4),
                unratedColor: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .color!
                    .withOpacity(0.08),
                glow: false,
                allowHalfRating: true,
                ignoreGestures: true,
                onRatingUpdate: (value) {},
                itemBuilder: (context, index) =>
                    SvgPicture.asset("assets/icons/Star_filled.svg"),
              ),
            ],
          ),

          SizedBox(height: 5.h),
          Text("${widget.review.comment} To include minutes in your time difference calculation and display, you can extend the logic in the"),

        ],
      ),
    );
  }
}

class RateBar extends StatelessWidget {
  const RateBar({
    super.key,
    required this.star,
    required this.value,
  });

  final int star;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: star == 1 ? 0 : defaultPadding / 2),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: Text(
              "$star Star",
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Theme.of(context).textTheme.bodyMedium!.color),
            ),
          ),
          const SizedBox(width: defaultPadding / 2),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(defaultBorderRadious),
              ),
              child: LinearProgressIndicator(
                minHeight: 6,
                color: warningColor,
                backgroundColor: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .color!
                    .withOpacity(0.05),
                value: value,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
