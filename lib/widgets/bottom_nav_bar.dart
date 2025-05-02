import 'package:chikitsa/addmedicine/add_medicin.dart';
import 'package:chikitsa/constants/color/colors.dart';
import 'package:chikitsa/report_page/dashboard.dart';
import 'package:chikitsa/medic_page/medic_page.dart';
import 'package:chikitsa/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({super.key});

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  final PersistentTabController tabviewcontroller =
      PersistentTabController(initialIndex: 0);

  List<Widget> buildScreens() {
    return [
      ReportPage(),
      MedicationTrackerHomePage(),
      const ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home",
        activeColorPrimary: ChikitsaColors.primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: GestureDetector(
          onDoubleTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AddMedicinePage(),
            ));
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: "Profile",
        activeColorPrimary: ChikitsaColors.primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: tabviewcontroller,
      screens: buildScreens(),
      items: navBarsItems(),
      backgroundColor: Colors.white,
      navBarStyle: NavBarStyle.style15,
    );
  }
}
