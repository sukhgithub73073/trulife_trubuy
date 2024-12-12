import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trubuy/components/product/product_card.dart';
import 'package:trubuy/data/blocs/bookmark_bloc/bookmark_bloc.dart';
import 'package:trubuy/data/blocs/product_bloc/product_bloc.dart';
import 'package:trubuy/models/product_model.dart';
import 'package:trubuy/route/route_constants.dart';
import 'package:trubuy/screens/product/views/product_details_screen.dart';

import '../../../constants.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          BlocConsumer<BookmarkBloc, BookmarkState>(
            listener: (context, state) {},
            builder: (context, state) {
              return !(state is BookmarkLoaded)
                  ? SliverToBoxAdapter(
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : state.bookmarkList.isEmpty
                      ? SliverToBoxAdapter(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 40),
                            child: Column(
                              children: [
                                Text(
                                  "Start Building Your Wishlist!",
                                  maxLines: 2,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const SizedBox(height: defaultPadding / 2),
                                Text(
                                  "You haven't bookmarked any products yet. Start exploring our amazing collection and save your favorites for quick access. Happy shopping!",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        )
                      : SliverPadding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding,
                              vertical: defaultPadding),
                          sliver: SliverGrid(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200.0,
                              mainAxisSpacing: defaultPadding,
                              crossAxisSpacing: defaultPadding,
                              childAspectRatio: 0.66,
                            ),
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return ProductCard(
                                  image: state.bookmarkList[index].thumbnail,
                                  brandName: state.bookmarkList[index].sku,
                                  title: state.bookmarkList[index].title,
                                  price: state.bookmarkList[index].price,
                                  priceAfetDiscount:
                                      state.bookmarkList[index].price,
                                  dicountpercent: state
                                      .bookmarkList[index].discountPercentage,
                                  press: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProductDetailsScreen(
                                                product:
                                                    state.bookmarkList[index],
                                              )),
                                    );
                                  },
                                );
                              },
                              childCount: state.bookmarkList.length,
                            ),
                          ),
                        );
            },
          ),
        ],
      ),
    );
  }
}
