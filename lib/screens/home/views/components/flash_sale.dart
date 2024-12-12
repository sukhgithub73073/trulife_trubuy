import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trubuy/data/blocs/product_bloc/product_bloc.dart';
import 'package:trubuy/route/route_constants.dart';
import 'package:trubuy/route/screen_export.dart';

import '/components/Banner/M/banner_m_with_counter.dart';
import '../../../../components/product/product_card.dart';
import '../../../../constants.dart';
import '../../../../models/product_model.dart';

class FlashSale extends StatelessWidget {
  const FlashSale({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // While loading show 👇
        // const BannerMWithCounterSkelton(),
        BannerMWithCounter(
          duration: const Duration(hours: 8),
          text: "Super Flash Sale \n50% Off",
          press: () {},
        ),
        const SizedBox(height: defaultPadding / 2),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(
            "Flash sale",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        // While loading show 👇
        // const ProductsSkelton(),

        BlocConsumer<ProductBloc, ProductState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return !(state is ProductLoaded)
                ? SizedBox.shrink()
                :SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // Find state.productList on models/ProductModel.dart
                itemCount: state.productList.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(
                    left: defaultPadding,
                    right: index == state.productList.length - 1
                        ? defaultPadding
                        : 0,
                  ),
                  child: ProductCard(
                    image: state.productList[index].thumbnail,
                    brandName: state.productList[index].sku,
                    title: state.productList[index].title,
                    price: state.productList[index].price,
                    priceAfetDiscount:
                        state.productList[index].price,
                    dicountpercent: state.productList[index].discountPercentage,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(
                              product: state.productList[index],
                            )),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
