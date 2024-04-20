import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/product/context/general.dart';
import 'package:musicapp/product/context/icon_size.dart';
import 'package:musicapp/product/context/padding.dart';
import 'package:musicapp/product/context/size.dart';
import 'package:musicapp/product/init/init_home_page.dart';

import '../../../product/extension/home_page_sheet_items_extension.dart';
import '../../../product/widget/custom_home_menu.dart';
import '../../../product/widget/custom_home_trending_card.dart';
import '../model/trending_card_model.dart';

part 'part_of_home_view_sheet.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final List<TrendingCardModel> trendingCardItems;

  @override
  void initState() {
    super.initState();
    trendingCardItems = InitHomePage().initTrendingCardValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Podkes',style: context.general.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),),
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.menu_outlined,color: Colors.white,)),
        actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_none_outlined))],
      ),
      body: SafeArea(
        child: Padding(
          padding: context.padding.mediumSymmetricHorizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBar(
                trailing: [
                  Icon(Icons.search_outlined,size: context.iconSize.normal,),
                ],
                hintText: 'Search',
              ),
              Padding(
                padding: context.padding.topOnlyMedium,
                child: SizedBox(
                  width: context.sized.width,
                  height: context.sized.dynamicHeigth(0.06),
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CustomHomeMenuWidget(index: index,);
                    },
                  ),
                ),
              ),
              Padding(
                padding: context.padding.topOnlyNormal,
                child: Text('Trending',style: context.general.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w600),),
              ),
              Expanded(
                child: Padding(
                  padding: context.padding.topOnlyNormal,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: context.sized.dynamicHeigth(0.02),
                      mainAxisSpacing: context.sized.dynamicHeigth(0.02),
                    ),
                    itemBuilder: (context, index) {
                      return CustomHomeTrendingCard(model: trendingCardItems[index],);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: const HomePageBottomSheet(),
    );
  }
}

