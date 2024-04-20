import 'package:flutter/material.dart';
import 'package:musicapp/core/widget/custom_elevated_button.dart';
import 'package:musicapp/feature/detail/view_model/detail_view_model.dart';
import 'package:musicapp/feature/home/model/trending_card_model.dart';
import 'package:musicapp/product/context/border_radius.dart';
import 'package:musicapp/product/context/general.dart';
import 'package:musicapp/product/context/icon_size.dart';
import 'package:musicapp/product/context/navigation.dart';
import 'package:musicapp/product/context/padding.dart';
import 'package:musicapp/product/context/size.dart';

class HomeCardDetailView extends StatefulWidget {
  const HomeCardDetailView({super.key, required this.model});

  final TrendingCardModel model;

  @override
  State<HomeCardDetailView> createState() => _HomeCardDetailViewState();
}

class _HomeCardDetailViewState extends HomeCardDetailViewModel {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: Padding(
          padding: context.padding.mediumSymmetricHorizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _contentImageAndColorContainer(context),
              _contentTitlePlace(context),
              _artistNamePlace(context),
              _podcastTimeComponent(context),
              _playOrNextAndPrevPlace(context),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text(appbarTitleText,style: context.general.textTheme
        .titleLarge?.copyWith(fontWeight: FontWeight.w500),),
      leading: IconButton(onPressed: () {
        context.route.pop();
      }, icon: const Icon(Icons.arrow_back_ios_new_outlined)),
    );
  }

  SizedBox _podcastTimeComponent(BuildContext context) {
    return SizedBox(
              height: context.sized.dynamicHeigth(0.16),
              width: context.sized.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Slider(
                    value: musicProgress.clamp(0.0, 1.0),
                    onChanged: (double value) {
                      setState(() {
                        musicProgress = value;
                      });
                    },
                    onChangeEnd: (double value) {
                      musicProgress = value > 1.0 ? 1.0 : value;
                      currentTimeInSeconds = (musicProgress * totalMusicTimeInSeconds).round();
                      setState(() {});
                    },
                    min: 0.0,
                    max: 1.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '${(currentTimeInSeconds ~/ 60).toString().padLeft(2, '0')}:${(currentTimeInSeconds % 60).toString().padLeft(2, '0')}',
                        style: context.general.textTheme.headlineSmall,
                      ),
                      Text("${(totalMusicTimeInSeconds ~/ 60).toString().padLeft(2,"0")}:${(totalMusicTimeInSeconds % 60).toString().padLeft(2,"0")}",style: context.general.textTheme.headlineSmall,),
                    ],
                  ),
                ],
              ),
            );
  }

  Padding _contentImageAndColorContainer(BuildContext context) {
    return Padding(
              padding: context.padding.topOnlyMedium,
              child: Container(
                height: context.sized.dynamicHeigth(0.4),
                decoration: BoxDecoration(
                  borderRadius: context.border.dynamicBorderRadiusCircular(borderSize: 0.01),
                  color: widget.model.cardColor,
                  image: DecorationImage(
                      image: AssetImage(widget.model.artistImage),
                      alignment: Alignment.bottomCenter,
                      fit: BoxFit.fitHeight),
                ),
              ),
            );
  }

  Padding _contentTitlePlace(BuildContext context) {
    return Padding(
              padding: context.padding.topOnlyNormal,
              child: Text(widget.model.title,style: context.general.textTheme
                .headlineSmall?.copyWith(fontWeight: FontWeight.w600),),
            );
  }

  Padding _artistNamePlace(BuildContext context) {
    return Padding(
              padding: context.padding.topOnlyNormal,
              child: Text(widget.model.artistName,),
            );
  }

  Padding _playOrNextAndPrevPlace(BuildContext context) {
    return Padding(
              padding: context.padding.topOnlyNormal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.first_page,size: context.iconSize.large,)),
                  Padding(
                    padding: context.padding.dynamicSymmetric(horizontal: 0.01),
                    child: CustomElevatedButton(
                      backgroundColor: Colors.white10,
                      shape: RoundedRectangleBorder(
                        borderRadius: context.border.dynamicBorderRadiusCircular(borderSize: context.sized.floatActionButtonSize / 2)
                      ),
                      height: context.sized.floatActionButtonSize,
                        width: context.sized.floatActionButtonSize,
                        onPressed: toggleMusic,
                        child: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          size: context.iconSize.large,
                        ),
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.last_page,size: context.iconSize.large,)),
                ],
              ),
            );
  }
}
