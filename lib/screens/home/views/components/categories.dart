import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trubuy/data/blocs/category_bloc/category_bloc.dart';
import 'package:trubuy/data/blocs/category_bloc/category_bloc.dart';
import 'package:trubuy/data/blocs/product_bloc/product_bloc.dart';
import 'package:trubuy/route/screen_export.dart';

import '../../../../constants.dart';

// // For preview
// class CategoryModel {
//   final String name;
//   final String? svgSrc, route;
//
//   CategoryModel({
//     required this.name,
//     this.svgSrc,
//     this.route,
//   });
// }
//
// List<CategoryModel> demoCategories = [
//   CategoryModel(name: "All Categories"),
//   CategoryModel(
//       name: "Footwear",
//       svgSrc: "assets/icons/Woman.svg",
//       route: footwearHomeRoute),
//   CategoryModel(name: "Grocery", svgSrc: "assets/icons/Woman.svg"),
//   CategoryModel(
//       name: "Mobiles, Computers",
//       svgSrc: "assets/icons/Sale.svg",
//       route: onSaleScreenRoute),
//   CategoryModel(
//       name: "TV, Appliances, Electronics", svgSrc: "assets/icons/Man.svg"),
//   CategoryModel(name: "Men's Fashion", svgSrc: "assets/icons/Woman.svg"),
//   CategoryModel(name: "Women's Fashion", svgSrc: "assets/icons/Woman.svg"),
//   CategoryModel(name: "Cloth", svgSrc: "assets/icons/Woman.svg"),
//   CategoryModel(name: "Furniture", svgSrc: "assets/icons/Woman.svg"),
//   CategoryModel(
//       name: "Home, Kitchen, Pets",
//       svgSrc: "assets/icons/Child.svg",
//       route: kidsScreenRoute),
//   CategoryModel(name: "Beauty, Health", svgSrc: "assets/icons/Woman.svg"),
//   CategoryModel(
//       name: "Sports, Fitness, Bags, Luggage", svgSrc: "assets/icons/Woman.svg"),
//   CategoryModel(
//       name: "Toys, Baby Products, Kids' Fashion",
//       svgSrc: "assets/icons/Woman.svg"),
//   CategoryModel(
//       name: "Car, Motorbike, Industrial", svgSrc: "assets/icons/Woman.svg"),
//   CategoryModel(name: "Books", svgSrc: "assets/icons/Woman.svg"),
//   CategoryModel(
//       name: "Movies, Music & Video Games", svgSrc: "assets/icons/Woman.svg"),
// ];
// // End For Preview

class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryBloc, CategoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state is CategoryLoaded
            ? SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      state.categoryList.length,
                      (index) => Padding(
                        padding: EdgeInsets.only(
                            left: index == 0
                                ? defaultPadding
                                : defaultPadding / 2,
                            right: index == state.categoryList.length - 1
                                ? defaultPadding
                                : 0),
                        child: CategoryBtn(
                          icon: state.categoryList[index].icon,
                          category: state.categoryList[index].categoryName,
                          svgSrc: "assets/icons/Sale.svg",
                          isActive: state.categoryList[index].isSelect ?? false,
                          press: () {
                            context.read<CategoryBloc>().add(TapCategoryEvent(
                                index: index, list: state.categoryList));
                            context
                                .read<ProductBloc>()
                                .add(GetProductEvent(map: {
                                  "type": state.categoryList[index].type,
                                  "category_id":
                                      state.categoryList[index].categoryId
                                }));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : SizedBox.shrink();
      },
    );
  }
}

class CategoryBtn extends StatelessWidget {
  const CategoryBtn({
    super.key,
    required this.category,
    this.svgSrc,
    this.icon,
    required this.isActive,
    required this.press,
  });

  final String category;
  final String? svgSrc;
  final bool isActive;
  final VoidCallback press;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      child: Container(
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        decoration: BoxDecoration(
          color: isActive ? primaryColor : Colors.transparent,
          border: Border.all(
              color: isActive
                  ? Colors.transparent
                  : Theme.of(context).dividerColor),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: Row(
          children: [
            icon != null
                ? Icon(
              size: 20,
                    icon,
                    color: isActive
                        ? Colors.white
                        : Theme.of(context).iconTheme.color!,
                  )
                : SvgPicture.asset(
                    svgSrc!,
                    height: 20,
                    colorFilter: ColorFilter.mode(
                      isActive
                          ? Colors.white
                          : Theme.of(context).iconTheme.color!,
                      BlendMode.srcIn,
                    ),
                  ),
            if (svgSrc != null) const SizedBox(width: defaultPadding / 2),
            Text(
              category,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isActive
                    ? Colors.white
                    : Theme.of(context).textTheme.bodyLarge!.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
