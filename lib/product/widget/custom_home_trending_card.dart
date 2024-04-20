import 'package:flutter/material.dart';
import 'package:musicapp/feature/home/model/trending_card_model.dart';
import 'package:musicapp/product/context/general.dart';
import 'package:musicapp/product/context/padding.dart';
import 'package:musicapp/product/context/size.dart';

class CustomHomeTrendingCard extends StatelessWidget {
  const CustomHomeTrendingCard({
    super.key,
    required this.model,
  });

  final TrendingCardModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: context.sized.dynamicHeigth(0.24),
          decoration: BoxDecoration(
            color: model.cardColor,
            image: DecorationImage(
                image: AssetImage(model.artistImage),
                alignment: Alignment.bottomCenter,
                fit: BoxFit.fitHeight),
          ),
        ),
        Padding(
          padding: context.padding.topOnlySmall,
          child: Text(
            model.title,
            style: context.general.textTheme.labelLarge
                ?.copyWith(fontWeight: FontWeight.w500, color: Colors.white),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        Padding(
          padding: context.padding.topOnlySmall,
          child: Text(
            model.artistName,
            style: context.general.textTheme.labelMedium?.copyWith(
              color: Colors.grey,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
