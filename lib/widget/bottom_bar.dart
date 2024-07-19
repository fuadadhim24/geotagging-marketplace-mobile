import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:geotagging_marketplace_mobile/pages/guest/home_page.dart';
import 'package:geotagging_marketplace_mobile/pages/guest/nearby_page.dart';
import 'package:geotagging_marketplace_mobile/pages/guest/profile_page.dart';
import 'package:geotagging_marketplace_mobile/shared/theme.dart';

const List<TabItem> items = [
  TabItem(
    icon: Icons.home,
    title: 'Home',
  ),
  TabItem(
    icon: Icons.shopping_cart_outlined,
    title: 'Disekitar',
  ),
  TabItem(
    icon: Icons.account_circle,
    title: 'Profile',
  ),
];

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  late PageController _pageController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          HomePage(),
          NearbyPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 15, left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomBarFloating(
            items: items,
            backgroundColor: darkBlueColor, 
            color: blueColor, 
            colorSelected: Colors.white,
            indexSelected: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
