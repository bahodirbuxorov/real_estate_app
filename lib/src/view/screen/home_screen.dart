import 'package:flutter/material.dart';
import 'package:home/src/view/screen/product_list_screen.dart';
import 'package:home/src/view/screen/profile_screen.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../../../core/app_data.dart';
import '../animation/page_transition_switcher_wrapper.dart';
import 'cart_screen.dart';
import 'favorite_screen.dart';


class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  static const List<Widget> screens = [
    ProductListScreen(),
    FavoriteScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int newIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Center(

      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Scaffold(

          bottomNavigationBar: StylishBottomBar(
            currentIndex: newIndex,
            onTap: (index) {
              newIndex = index;
              setState(() {});
            },

            items: AppData.bottomNavBarItems

                .map(
                  (item) => BottomBarItem(
                    backgroundColor: item.activeColor,
                    icon: item.icon,
                    title: Text(
                      item.title,
                      style: TextStyle(
                        color: item.activeColor,
                      ),
                    ),
                  ),
                )
                .toList(),
            option: BubbleBarOptions(
              opacity: 0.3,
              unselectedIconColor: Colors.grey,
              borderRadius: BorderRadius.circular(
                15.0,
              ),
            ),
          ),
          body: PageTransitionSwitcherWrapper(
            child: HomeScreen.screens[newIndex],
          ),
        ),
      ),
    );
  }
}
