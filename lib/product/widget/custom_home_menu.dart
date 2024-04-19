import 'package:flutter/material.dart';
import 'package:musicapp/product/context/border_radius.dart';
import 'package:musicapp/product/context/general.dart';
import 'package:musicapp/product/context/padding.dart';

class CustomHomeMenuWidget extends StatelessWidget {
  const CustomHomeMenuWidget({
    super.key, required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: index == 4 ? context.padding.kZeroPadding : context.padding.rightOnlyNormal,
      padding: context.padding.dynamicSymmetric(horizontal: 0.03),
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: context.border.dynamicBorderRadiusCircular(borderSize: 0.03)
      ),
      child: Center(child: Text('Allllll',style: context.general.textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w600
      ),)),
    );
  }
}
