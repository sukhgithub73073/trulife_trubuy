import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trubuy/components/list_tile/divider_list_tile.dart';

class OrdersMenuItemListTile extends StatelessWidget {
  const OrdersMenuItemListTile({
    super.key,
    required this.text,
    required this.svgSrc,
    required this.press,
    this.isShowDivider = true, required this.color,
  });

  final String text, svgSrc;
  final VoidCallback press;
  final bool isShowDivider;
  final Color color ;

  @override
  Widget build(BuildContext context) {
    return DividerListTile(
      minLeadingWidth: 24,
      leading: SvgPicture.asset(
        svgSrc,
        height: 24,
        width: 24,
        colorFilter: ColorFilter.mode(
          Theme.of(context).iconTheme.color!,
          BlendMode.srcIn,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 14, height: 1),
          ),
          Container(
            width: 35,
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: color),
            child: Center(
              child: Text(
                "1",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14, height: 1),
              ),
            ),
          ),
        ],
      ),
      press: press,
      isShowDivider: isShowDivider,
    );
  }
}
