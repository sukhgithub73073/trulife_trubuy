import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trubuy/components/buy_full_ui_kit.dart';
import 'package:trubuy/components/cart_button.dart';
import 'package:trubuy/components/custom_modal_bottom_sheet.dart';
import 'package:trubuy/components/product/product_card.dart';
import 'package:trubuy/constants.dart';
import 'package:trubuy/data/blocs/bookmark_bloc/bookmark_bloc.dart';
import 'package:trubuy/data/blocs/bookmark_bloc/bookmark_bloc.dart';
import 'package:trubuy/data/models/product_model.dart';
import 'package:trubuy/screens/product/views/product_returns_screen.dart';

import 'package:trubuy/route/screen_export.dart';

import 'components/notify_me_card.dart';
import 'components/product_images.dart';
import 'components/product_info.dart';
import 'components/product_list_tile.dart';
import '../../../components/review_card.dart';
import 'product_buy_now_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: widget.product.availabilityStatus == "In Stock"
          ? CartButton(
              price: widget.product.price,
              press: () {
                customModalBottomSheet(
                  context,
                  height: MediaQuery.of(context).size.height * 0.92,
                  child: const ProductBuyNowScreen(),
                );
              },
            )
          : NotifyMeCard(
              isNotify: false,
              onChanged: (value) {},
            ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              floating: true,
              actions: [
                BlocConsumer<BookmarkBloc, BookmarkState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is BookmarkLoaded) {
                      print(
                          "dsdddddd<<<<<<<<<<<<<${state.bookmarkList.length}");
                    }
                    return state is BookmarkLoaded
                        ? IconButton(
                            onPressed: () {
                              context.read<BookmarkBloc>().add(state
                                      .bookmarkList
                                      .contains(widget.product)
                                  ? RemoveBookmarkEvent(product: widget.product)
                                  : AddBookmarkEvent(product: widget.product));
                            },
                            icon: SvgPicture.asset(
                              state.bookmarkList.contains(widget.product)
                                  ? "assets/icons/BookmarkColor.svg"
                                  : "assets/icons/Bookmark.svg",
                            ),
                          )
                        : SizedBox.shrink();
                  },
                ),
              ],
            ),
            ProductImages(
              images: widget.product.images,
            ),
            ProductInfo(
              brand: "${widget.product.category}",
              title: "${widget.product.title}",
              isAvailable: widget.product.availabilityStatus == "In Stock",
              description: "${widget.product.description}",
              rating: widget.product.rating,
              numOfReviews: widget.product.reviews.length,
            ),
            ProductListTile(
              svgSrc: "assets/icons/Product.svg",
              title: "Product Details",
              press: () {
                customModalBottomSheet(
                  context,
                  height: MediaQuery.of(context).size.height * 0.92,
                  child: const BuyFullKit(
                      images: ["assets/screens/Product detail.png"]),
                );
              },
            ),
            ProductListTile(
              svgSrc: "assets/icons/Delivery.svg",
              title: "Shipping Information",
              press: () {
                customModalBottomSheet(
                  context,
                  height: MediaQuery.of(context).size.height * 0.92,
                  child: const BuyFullKit(
                    images: ["assets/screens/Shipping information.png"],
                  ),
                );
              },
            ),
            ProductListTile(
              svgSrc: "assets/icons/Return.svg",
              title: "Returns",
              isShowBottomBorder: true,
              press: () {
                customModalBottomSheet(
                  context,
                  height: MediaQuery.of(context).size.height * 0.92,
                  child: const ProductReturnsScreen(),
                );
              },
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
                      .where((element) => element.rating <= 4)
                      .length,
                  numOfThreeStar: widget.product.reviews
                      .where((element) => element.rating <= 3)
                      .length,
                  numOfTwoStar: widget.product.reviews
                      .where((element) => element.rating <= 2)
                      .length,
                  numOfOneStar: widget.product.reviews
                      .where((element) => element.rating <= 1)
                      .length,
                ),
              ),
            ),
            ProductListTile(
              svgSrc: "assets/icons/Chat.svg",
              title: "Reviews",
              isShowBottomBorder: true,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductReviewsScreen(
                            product: widget.product,
                          )),
                );

                //Navigator.pushNamed(context, productReviewsScreenRoute);
              },
            ),
            SliverPadding(
              padding: const EdgeInsets.all(defaultPadding),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "You may also like",
                  style: Theme.of(context).textTheme.titleSmall!,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(
                        left: defaultPadding,
                        right: index == 4 ? defaultPadding : 0),
                    child: ProductCard(
                      image: productDemoImg2,
                      title: "Sleeveless Tiered Dobby Swing Dress",
                      brandName: "LIPSY LONDON",
                      price: 24.65,
                      priceAfetDiscount: index.isEven ? 20.99 : null,
                      dicountpercent: index.isEven ? 25 : null,
                      press: () {},
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: defaultPadding),
            )
          ],
        ),
      ),
    );
  }
}
