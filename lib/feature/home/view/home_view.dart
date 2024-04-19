import 'package:flutter/material.dart';
import 'package:musicapp/product/context/border_radius.dart';
import 'package:musicapp/product/context/general.dart';
import 'package:musicapp/product/context/icon_size.dart';
import 'package:musicapp/product/context/padding.dart';
import 'package:musicapp/product/context/size.dart';

import '../../../product/widget/custom_home_menu.dart';
import '../../../product/widget/custom_home_trending_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: context.sized.dynamicHeigth(0.02),
                      mainAxisSpacing: context.sized.dynamicHeigth(0.02),
                    ),
                    itemBuilder: (context, index) {
                      return const CustomHomeTrendingCard();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
