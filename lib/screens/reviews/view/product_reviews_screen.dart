import 'package:flutter/material.dart';
import 'package:trubuy/components/buy_full_ui_kit.dart';
import 'package:trubuy/components/product/product_card.dart';
import 'package:trubuy/components/ratting_card.dart';
import 'package:trubuy/components/review_card.dart';
import 'package:trubuy/constants.dart';
import 'package:trubuy/data/models/product_model.dart';

import '../../product/views/components/product_list_tile.dart';

class ProductReviewsScreen extends StatefulWidget {
  final Product product;

  const ProductReviewsScreen({super.key, required this.product});

  @override
  State<ProductReviewsScreen> createState() => _ProductReviewsScreenState();
}

class _ProductReviewsScreenState extends State<ProductReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              floating: true,
              title: Text(
                "Reviews",
                maxLines: 2,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              actions: [],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: ReviewCard(
                  rating: widget.product.rating,
                  numOfReviews: widget.product.reviews.length,
                  numOfFiveStar: widget.product.reviews
                      .where((element) => element.rating == 5)
                      .length,
                  numOfFourStar: widget.product.reviews
                      .where((element) => element.rating == 4)
                      .length,
                  numOfThreeStar: widget.product.reviews
                      .where((element) => element.rating == 3)
                      .length,
                  numOfTwoStar: widget.product.reviews
                      .where((element) => element.rating == 2)
                      .length,
                  numOfOneStar: widget.product.reviews
                      .where((element) => element.rating == 1)
                      .length,
                ),
              ),
            ),

            ProductListTile(
              title: "Add Review",
              press: () {},
              svgSrc: "assets/icons/Chat-add.svg",
              isShowBottomBorder: true,
            ),

            // SliverToBoxAdapter(
            //   child: ProductListTile(
            //     svgSrc: "assets/icons/Chat.svg",
            //     title: "Add Review",
            //     isShowBottomBorder: true,
            //     press: () {},
            //   ),
            // ),

            SliverPadding(
              padding: EdgeInsets.all(defaultPadding),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  widget.product.reviews.map((review) {
                    return Padding(
                      padding: EdgeInsets.only(top: defaultPadding),
                      child: RatingCard(review: review),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
