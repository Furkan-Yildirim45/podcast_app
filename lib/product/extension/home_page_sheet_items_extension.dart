import 'package:musicapp/core/extension/capitalize_on_string.dart';

enum HomePageBottomSheetItems{
  discover,library,profile
}

extension HomePageBottomSheetItemsExtension on HomePageBottomSheetItems{
  String get getTitle{
    switch(this){
      case HomePageBottomSheetItems.discover:
      case HomePageBottomSheetItems.library:
      case HomePageBottomSheetItems.profile:
        return name.capitalizeFirstLetter;
    }
  }
}
