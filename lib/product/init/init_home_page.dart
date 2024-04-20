
import 'package:flutter/material.dart';
import 'package:musicapp/feature/home/model/trending_card_model.dart';

class InitHomePage{
  List<TrendingCardModel> initTrendingCardValues(){
    final List<TrendingCardModel> trendingCardItems = [
      TrendingCardModel(title: "The Missing 96 percent of the universe", cardColor: Colors.purpleAccent, artistName: "Claire Malone", artistImage: "assets/images/person_one.png", playTime: 1304),
      TrendingCardModel(title: "How Dolly Parton me to an epiphany", cardColor: Colors.blueAccent, artistName: "Emma Storm", artistImage: "assets/images/person_two.png", playTime: 583),
      TrendingCardModel(title: "The Missing 96 percent of the universe", cardColor: Colors.deepOrange, artistName: "Lara Carter", artistImage: "assets/images/person_three.png", playTime: 2151),
      TrendingCardModel(title: "The Missing 96 percent of the universe", cardColor: Colors.yellow, artistName: "David Hawk", artistImage: "assets/images/person_four.png", playTime: 1250),
      TrendingCardModel(title: "The Missing 96 percent of the universe", cardColor: Colors.lightGreen, artistName: "Howard Moon", artistImage: "assets/images/person_five.png", playTime: 936),
    ];
    return trendingCardItems;
  }

  List<String> initMenuItems(){
    final List<String> menuItems = [
      "All","Life","Comedy","Tech","Metal","classic"
    ];
    return menuItems;
  }
}