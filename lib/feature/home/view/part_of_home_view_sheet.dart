
part of'home_view.dart';

class HomePageBottomSheet extends StatefulWidget {
  const HomePageBottomSheet({
    super.key,
  });

  @override
  State<HomePageBottomSheet> createState() => _HomePageBottomSheetState();
}

class _HomePageBottomSheetState extends State<HomePageBottomSheet> {
  int initialActiveIndex = 0;

  final List<TabItem> items = [
    TabItem(icon: Icons.home_outlined,title: HomePageBottomSheetItems.discover.getTitle),
    TabItem(icon: Icons.library_music_outlined,title: HomePageBottomSheetItems.library.getTitle),
    TabItem(icon: Icons.person_2_outlined,title: HomePageBottomSheetItems.profile.getTitle),
  ];

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      backgroundColor: const Color(0xff252836),
      top: 0,
      initialActiveIndex: initialActiveIndex,
      color: Colors.grey,
      elevation: 0,
      activeColor: Colors.white,
      onTap: (index) {
        setState(() {
          initialActiveIndex = index;
        });
      },
      items: items,
    );
  }
}


