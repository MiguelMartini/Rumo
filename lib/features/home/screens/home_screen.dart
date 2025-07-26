import 'package:flutter/material.dart';
import 'package:rumo/core/asset_images.dart';
import 'package:rumo/features/diary/screens/user_diaries_screen.dart';
import 'package:rumo/features/home/widgets/bottom_nav_item.dart';
import 'package:rumo/features/user/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  void onSelectItem(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  

  @override
  Widget build(BuildContext context) => Scaffold(
    resizeToAvoidBottomInset: false,
    bottomNavigationBar: BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BottomNavItem(
            icon: AssetImages.mapIcon,
            label: 'Mapa',
            currentSelectedIndex: currentIndex,
            index: 0,
            onSelectItem: onSelectItem,
          ),
          BottomNavItem(
            icon: AssetImages.diaryIcon,
            label: 'Diários',
           currentSelectedIndex: currentIndex,
            index: 1,
            onSelectItem: onSelectItem,
          ),
          IconButton.filled(
            style: IconButton.styleFrom(backgroundColor: Color(0xFFDDE1FF)),
            onPressed: () {},
            icon: Icon(Icons.add, color: Color(0xFF4E61F6), size: 20),
          ),
          BottomNavItem(
            icon: AssetImages.exploreIcon,
            label: 'Explorar',
            currentSelectedIndex: currentIndex,
            index: 2,
            onSelectItem: onSelectItem,
          ),
          BottomNavItem(
            icon: AssetImages.profileIcon,
            label: 'Perfil',
             currentSelectedIndex: currentIndex,
            index: 3,
            onSelectItem: onSelectItem,
          ),
        ],
      ),
    ),
    body: Builder(
      builder: (context){
        return switch (currentIndex) {
          1 => UserDiariesScreen(),
          2 => Center(child: Text('Explorar')),
          3 => ProfileScreen(),
          _ => Scaffold(
            appBar: AppBar(title: Text('AppBar Mapa')),
            body: Center(child: Text('Mapa')),
          ),
        };
      }
    ),
  );
}
