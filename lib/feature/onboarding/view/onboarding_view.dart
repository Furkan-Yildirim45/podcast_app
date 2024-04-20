import 'package:flutter/material.dart';
import 'package:musicapp/feature/home/view/home_view.dart';
import 'package:musicapp/product/context/general.dart';
import 'package:musicapp/product/context/navigation.dart';
import 'package:musicapp/product/context/padding.dart';
import 'package:musicapp/product/context/size.dart';

class OnBoardingView extends StatelessWidget with _OnBoardingUtility{
  OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    var normalValue = context.sized.normalValue;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _buildFloatActionButton(context),
      body: SafeArea(
        child: Padding(
          padding: context.padding.mediumSymmetricHorizontal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _imageContainer(context),
              _titlePodcast(context),
              _contentPodcast(context),
              _pageTransitionIndicator(context, normalValue),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _pageTransitionIndicator(BuildContext context, double normalValue) {
    return SizedBox(
              height: context.sized.dynamicHeigth(0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _transitionPageCircle(context, normalValue, Colors.grey),
                  Padding(
                    padding: context.padding.dynamicSymmetric(
                      horizontal: 0.01,
                    ),
                    child: _transitionPageCircle(
                        context, normalValue * 2.5, const Color(0xff525298)),
                  ),
                  _transitionPageCircle(context, normalValue, Colors.grey),
                ],
              ),
            );
  }

  Padding _contentPodcast(BuildContext context) {
    return Padding(
              padding: context.padding.topOnlyNormal,
              child: Text(
                contentText,
                style: context.general.textTheme.bodyLarge
                    ?.copyWith(color: Colors.white70),
                textAlign: TextAlign.center,
              ),
            );
  }

  Padding _titlePodcast(BuildContext context) {
    return Padding(
              padding: context.padding.topOnlyMedium,
              child: Text(
                titlePodcast,
                style: context.general.theme.textTheme.displaySmall?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w600),
              ),
            );
  }

  Container _imageContainer(BuildContext context) {
    return Container(
              decoration: const BoxDecoration(color: Colors.transparent),
              height: context.sized.dynamicHeigth(0.4),
              child: Image.asset(
                onBoardingImage,
                fit: BoxFit.contain,
              ),
            );
  }

  SizedBox _buildFloatActionButton(BuildContext context) {
    var dynamicHeigth = context.sized.dynamicHeigth(0.09);
    return SizedBox(
      height: dynamicHeigth,
      width: dynamicHeigth,
      child: FloatingActionButton(
        onPressed: () {
          context.route.navigatePush(const HomeView());
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.arrow_forward_outlined,
          color: Colors.black,
        ),
      ),
    );
  }

  Container _transitionPageCircle(
      BuildContext context, double size, Color color) {
    var heightValue = context.sized.normalValue;
    return Container(
      width: size,
      height: heightValue,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(heightValue / 2),
      ),
    );
  }
}

mixin _OnBoardingUtility{
  var contentText = 'A podcast is an episodic serios of spoken word digital audio files that a user can download to a personal device for easy listening';
  var titlePodcast = 'PodKes';
  var onBoardingImage = "assets/images/boarding_image.png";
}
