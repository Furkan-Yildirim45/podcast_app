import 'package:flutter/material.dart';
import 'package:musicapp/product/context/border_radius.dart';
import 'package:musicapp/product/context/general.dart';
import 'package:musicapp/product/context/padding.dart';

class CustomHomeMenuWidget extends StatelessWidget {
  const CustomHomeMenuWidget({
    super.key, required this.index, required this.menuTitle, required this.menuItemsLength,
  });
  final int index;
  final String menuTitle;
  final int menuItemsLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: index == menuItemsLength -1 ? context.padding.kZeroPadding : context.padding.rightOnlyNormal,
      padding: context.padding.dynamicSymmetric(horizontal: 0.03),
      decoration: BoxDecoration(
          color: const Color(0xff2b2b2e),
          borderRadius: context.border.dynamicBorderRadiusCircular(borderSize: 0.03)
      ),
      child: Center(child: Text(menuTitle,style: context.general.textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w600
      ),)),
    );
  }
}
