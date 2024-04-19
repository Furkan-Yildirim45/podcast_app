import 'package:flutter/material.dart';
import 'package:musicapp/product/context/general.dart';
import 'package:musicapp/product/context/padding.dart';
import 'package:musicapp/product/context/size.dart';

class CustomHomeTrendingCard extends StatelessWidget {
  const CustomHomeTrendingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.green,
          height: context.sized.dynamicHeigth(0.24),
        ),
        Padding(
          padding: context.padding.topOnlySmall,
          child: Text('The missing 96 percent of the universe.',
            style: context.general.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.white),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        Padding(
          padding: context.padding.topOnlySmall,
          child: Text('Claire Malone',style: context.general.textTheme.labelMedium?.copyWith(
            color: Colors.grey,
          ),
            maxLines: 1,overflow: TextOverflow.ellipsis,),
        )
      ],
    );
  }
}

