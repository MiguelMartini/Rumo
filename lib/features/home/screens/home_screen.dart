import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rumo/core/asset_images.dart';
import 'package:rumo/features/home/widgets/bottom_nav_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
    resizeToAvoidBottomInset: false,
    bottomNavigationBar: BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // BottomNavItem(icon: AssetImages.mapIcon, label: 'Mapa'),
          BottomNavItem(
            icon: AssetImages.mapIcon,
            label: 'Mapa',
            isSelected: currentIndex == 0,
            onTap: () => setState(() {
              currentIndex = 0;
            }),
          ),
          BottomNavItem(
            icon: AssetImages.diaryIcon,
            label: 'Diários',
            isSelected: currentIndex == 1,
            onTap: () => setState(() {
              currentIndex = 1;
            }),
          ),
          IconButton.filled(
            style: IconButton.styleFrom(backgroundColor: Color(0xFFDDE1FF)),
            onPressed: () {},
            icon: Icon(Icons.add, color: Color(0xFF4E61F6), size: 20),
          ),
          BottomNavItem(
            icon: AssetImages.exploreIcon,
            label: 'Explorar',
            isSelected: currentIndex == 2,
            onTap: () => setState(() {
              currentIndex = 2;
            }),
          ),
          BottomNavItem(
            icon: AssetImages.profileIcon,
            label: 'Perfil',
            isSelected: currentIndex == 3,
            onTap: () => setState(() {
              currentIndex = 3;
            }),
          ),
          // BottomNavItem(icon: AssetImages.exploreIcon, label: 'Explorar'),
          // BottomNavItem(icon: AssetImages.profileIcon, label: 'Perfil'),
        ],
      ),
    ),
  );
}
