import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trubuy/components/buy_full_ui_kit.dart';
import 'package:trubuy/constants.dart';
import 'package:trubuy/route/route_constants.dart';
import 'package:trubuy/screens/order/views/conponents/orders_menu_item_list_tile.dart';
import 'package:trubuy/screens/profile/views/components/profile_menu_item_list_tile.dart';
import 'package:trubuy/theme/input_decoration_theme.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return true
        ? Scaffold(
            appBar: AppBar(
              title: const Text("Orders"),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.only(top: defaultPadding / 2),
                      sliver: SliverToBoxAdapter(
                        child: TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.transparent,
                            hintText: "Find an order...",
                            border: secondaryOutlineInputBorder(context),
                            enabledBorder: secondaryOutlineInputBorder(context),
                            focusedBorder: secondaryOutlineInputBorder(context),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(defaultPadding / 2),
                              child: SvgPicture.asset(
                                "assets/icons/Search.svg",
                                height: 24,
                                color: Theme.of(context)
                                    .inputDecorationTheme
                                    .hintStyle!
                                    .color,
                              ),
                            ),
                            suffixIcon: SizedBox(
                              width: 40,
                              child: Row(
                                children: [
                                  const SizedBox(
                                    height: 24,
                                    child: VerticalDivider(width: 1),
                                  ),
                                  Expanded(
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                        "assets/icons/Filter.svg",
                                        height: 24,
                                        color:
                                            Theme.of(context).iconTheme.color,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.only(top: defaultPadding ),
                      sliver: SliverToBoxAdapter(
                          child: Text(
                        "Orders History",
                        style: Theme.of(context).textTheme.titleSmall,
                      )),
                    ),
                    SliverToBoxAdapter(
                      child: OrdersMenuItemListTile(
                        color: blueColor,
                        text: "Awaiting Payment",
                        svgSrc: "assets/icons/Payonline.svg",
                        press: () {
                          ///Navigator.pushNamed(context, ordersScreenRoute);
                        },
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: OrdersMenuItemListTile(
                        color: warningColor,
                        text: "Processing",
                        svgSrc: "assets/icons/Product.svg",
                        press: () {
                          ///Navigator.pushNamed(context, ordersScreenRoute);
                        },
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: OrdersMenuItemListTile(
                        color: successColor,
                        text: "Delivered",
                        svgSrc: "assets/icons/Delivery.svg",
                        press: () {
                          //Navigator.pushNamed(context, ordersScreenRoute);
                        },
                      ),
                    ),

                    SliverToBoxAdapter(
                      child: OrdersMenuItemListTile(
                        color: errorColor,
                        text: "Returned",
                        svgSrc: "assets/icons/Return.svg",
                        press: () {
                          //Navigator.pushNamed(context, ordersScreenRoute);
                        },
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: OrdersMenuItemListTile(
                        color: errorColor,
                        text: "Cancelled",
                        svgSrc: "assets/icons/Close-Circle.svg",
                        press: () {
                         // Navigator.pushNamed(context, ordersScreenRoute);
                        },
                      ),
                    ),

                  ],
                ),
              ),
            ),
          )
        : BuyFullKit(images: [
            "assets/screens/Orders.png",
            "assets/screens/Cancel order - Select a reason.png"
          ]);
  }
}
