import 'package:flutter/material.dart';
import 'package:mieny/Constans.dart';
import 'package:mieny/Design/mainMap.dart';
import 'package:mieny/design/Notification/notificationPage.dart';
import 'package:mieny/design/Profile/profilePage.dart';


class NavBar extends StatefulWidget {
  const NavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}



class _NavBarState extends State<NavBar> {



  Widget currentScreen = const MapScreen();

  int currenttab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: currentScreen,
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          elevation: 0,
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  minWidth: 35,
                  onPressed: () {
                    setState(() {
                      currentScreen = const MapScreen();
                      currenttab = 0;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/Icons/Home.png",
                        height: 35,
                        color: currenttab == 0
                            ? primaryColor
                            : Colors.black,
                      ),
                      const SizedBox(width: 6,),
                      Text(
                        currenttab == 0 ? "Home" : "",
                        style: TextStyle(
                            color: currenttab == 0
                                ? primaryColor
                                : Colors.black,
                            fontSize: 16,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  padding: const EdgeInsets.only(top: 5),
                  minWidth: 50,
                  onPressed: () {
                    setState(() {
                      currentScreen = const NotificationPage();

                      currenttab = 1;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/Icons/Notification.png",
                        height: 35,
                        color: currenttab == 1
                            ? primaryColor
                            : Colors.black,
                      ),
                      const SizedBox(width: 6,),
                      Text(
                        currenttab == 1 ? "Notification" : "",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontFamily: "Inter",
                          color: currenttab == 1
                              ? primaryColor
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen = const ProfilePage();
                      currenttab = 2;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                          "assets/Icons/Profile.png",
                          height: 35,
                          color: currenttab == 2
                              ? primaryColor
                              : Colors.black
                      ),
                      const SizedBox(width: 6,),
                      Text(
                        currenttab == 2 ? "Profile" : "",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontFamily: "Inter",
                          color: currenttab == 2
                              ? primaryColor
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}