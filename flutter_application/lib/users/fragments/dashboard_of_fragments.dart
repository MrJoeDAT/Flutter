import 'package:flutter/material.dart';
import 'package:flutter_application/users/fragments/favorites_fragment_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_fragment_screen.dart';
import 'order_fragment_screen.dart';
import 'profile_fragment_screen.dart';

class DashboardOfFragments extends StatefulWidget {
  @override
  _DashboardOfFragmentsState createState() => _DashboardOfFragmentsState();
}

class _DashboardOfFragmentsState extends State<DashboardOfFragments> {
  int _currentIndex = 0;

  List<Widget> _fragmentScreens = [
    HomeFragmentScreen(),
    FavoriteFragmentScreen(),
    OrderFragmentScreen(),
    ProfileFragmentScreen(),
  ];

  List<Map<String, dynamic>> _navigationButtonsProperties = [
    {
      "active_icon": Icons.home,
      "non_active_icon": Icons.home_outlined,
      "label": "Home",
    },
    {
      "active_icon": Icons.favorite,
      "non_active_icon": Icons.favorite_border,
      "label": "Favorites",
    },
    {
      "active_icon": FontAwesomeIcons.boxOpen,
      "non_active_icon": FontAwesomeIcons.box,
      "label": "Orders",
    },
    {
      "active_icon": Icons.person,
      "non_active_icon": Icons.person_outline,
      "label": "Profile",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text("Welcome"),
        automaticallyImplyLeading: false, // Disable back arrow
      ),*/
      body: _fragmentScreens[_currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors
              .blue, // Set the background color for the entire BottomNavigationBar
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white24,
          items: List.generate(4, (index) {
            var navBtnProperty = _navigationButtonsProperties[index];
            return BottomNavigationBarItem(
              icon: Icon(navBtnProperty["non_active_icon"]),
              activeIcon: Icon(navBtnProperty["active_icon"]),
              label: navBtnProperty["label"],
            );
          }),
        ),
      ),
    );
  }
}
