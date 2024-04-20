import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/feature/detail/view/home_card_detail_View.dart';
import 'package:musicapp/product/context/general.dart';
import 'package:musicapp/product/context/icon_size.dart';
import 'package:musicapp/product/context/navigation.dart';
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

class _HomeViewState extends State<HomeView> with _HomePageUtility{
  late final List<TrendingCardModel> trendingCardItems;
  late final List<String> menuItems;
  final int crossAxisCount = 2;
  late InitHomePage initHomePage;

  @override
  void initState() {
    super.initState();
    initHomePage = InitHomePage();
    trendingCardItems = initHomePage.initTrendingCardValues();
    menuItems = initHomePage.initMenuItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: Padding(
          padding: context.padding.mediumSymmetricHorizontal,
          child: ListView(
            children: [
              _searchBar(context),
              _menuPlace(context),
              _trendingTextPlace(context),
              _trendingCardGridViewPlace(context),
            ],
          ),
        ),
      ),
      bottomSheet: const HomePageBottomSheet(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text(
        podcastText,
        style: context.general.textTheme.titleLarge
            ?.copyWith(fontWeight: FontWeight.w600),
      ),
      leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu_outlined,
            color: Colors.white,
          )),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_outlined))
      ],
    );
  }

  SizedBox _trendingCardGridViewPlace(BuildContext context) {
    var cardLengthCeil = (trendingCardItems.length / crossAxisCount).ceil();
    var gridViewSpacingSize = context.sized.dynamicHeigth(0.02);
    var cardConstHeight = context.sized.dynamicHeigth(0.335).ceil();
    var trendingCardGeneralDynamicHeight =
        (cardLengthCeil + 3) * gridViewSpacingSize +
            cardConstHeight * cardLengthCeil +
            context.sized.normalValue;
    return SizedBox(
      width: context.sized.width,
      height: trendingCardGeneralDynamicHeight,
      child: Padding(
        padding: context.padding.topOnlyNormal,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: trendingCardItems.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 0.75,
            crossAxisSpacing: gridViewSpacingSize,
            mainAxisSpacing: gridViewSpacingSize,
          ),
          itemBuilder: (context, index) {
            return ElevatedButton(
              onPressed: (){
                context.route.navigatePush(HomeCardDetailView(model: trendingCardItems[index],));
              },
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                padding: WidgetStatePropertyAll(EdgeInsets.zero),
                elevation: WidgetStatePropertyAll(0),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
              ),
              child: CustomHomeTrendingCard(
                model: trendingCardItems[index],
              ),
            );
          },
        ),
      ),
    );
  }

  Padding _trendingTextPlace(BuildContext context) {
    return Padding(
      padding: context.padding.topOnlyNormal,
      child: Text(
        trendingText,
        style: context.general.textTheme.headlineMedium
            ?.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }

  Padding _menuPlace(BuildContext context) {
    return Padding(
      padding: context.padding.topOnlyMedium,
      child: SizedBox(
        width: context.sized.width,
        height: context.sized.dynamicHeigth(0.06),
        child: ListView.builder(
          itemCount: menuItems.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CustomHomeMenuWidget(
              index: index,
              menuTitle: menuItems[index],
              menuItemsLength: menuItems.length,
            );
          },
        ),
      ),
    );
  }

  SearchBar _searchBar(BuildContext context) {
    return SearchBar(
      trailing: [
        Icon(
          Icons.search_outlined,
          size: context.iconSize.normal,
        ),
      ],
      hintText: searchBarHintText,
    );
  }
}

mixin _HomePageUtility{
  var searchBarHintText = 'Search';
  var trendingText = 'Trending';
  var podcastText = 'Podkes';

}
