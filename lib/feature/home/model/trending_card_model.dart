
import 'dart:ui';

class TrendingCardModel{
  final String title;
  final Color cardColor;
  final String artistName;
  final String artistImage;
  final double playTime;

  TrendingCardModel(
      {required this.title,
      required this.cardColor,
      required this.artistName,
      required this.artistImage,
      required this.playTime});
}