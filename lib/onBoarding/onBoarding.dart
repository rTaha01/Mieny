import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mieny/Constans.dart';
import 'package:mieny/OnBoarding/starterPages/authStarter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

late PageController _pageController;
bool isLastIndex = false;

class _BoardingScreenState extends State<BoardingScreen> {
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => isLastIndex = index == 2);
              },
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: context.heightTransformer(dividedBy: 7),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset("assets/Images/undraw_bike.png"),
                    ),
                    SizedBox(
                      height: context.heightTransformer(dividedBy: 14),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Real-time tracking",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25,
                                    color: const Color(0xff0D0D0D),
                                    fontFamily: "Inter")),
                      ),
                    ),
                    SizedBox(
                      height: context.heightTransformer(dividedBy: 40),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Track your vehicle's location in real\ntime, so you always know where it is.",
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  fontWeight: FontWeight.w400,
                                  height: 1.3,
                                  fontSize: 19,
                                  color: const Color(0xff344054),
                                  fontFamily: "Inter"),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: context.heightTransformer(dividedBy: 5.5),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset("assets/Images/undraw_security.png"),
                    ),
                    SizedBox(
                      height: context.heightTransformer(dividedBy: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Real-time protection",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25,
                                    color: const Color(0xff0D0D0D),
                                    fontFamily: "Inter")),
                      ),
                    ),
                    SizedBox(
                      height: context.heightTransformer(dividedBy: 41),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Get notified if your device is lost or\nstolen, and remotely lock or wipe it.",
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  fontWeight: FontWeight.w400,
                                  height: 1.3,
                                  fontSize: 19,
                                  color: const Color(0xff344054),
                                  fontFamily: "Inter"),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: context.heightTransformer(dividedBy: 7),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset("assets/Images/location_tracking.png"),
                    ),
                    SizedBox(
                      height: context.heightTransformer(dividedBy: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Location History",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25,
                                    color: const Color(0xff0D0D0D),
                                    fontFamily: "Inter")),
                      ),
                    ),
                    SizedBox(
                      height: context.heightTransformer(dividedBy: 41),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "View your vehicle's travel history to\nsee where it has been and when.",
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  fontWeight: FontWeight.w400,
                                  height: 1.3,
                                  fontSize: 19,
                                  color: const Color(0xff344054),
                                  fontFamily: "Inter"),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Row(
                    children: [
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: 3,
                        effect: SlideEffect(
                            dotColor: Colors.orange.shade100,
                            activeDotColor: primaryColor,
                            dotWidth: 12,
                            dotHeight: 2.9),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                isLastIndex
                    ? Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: InkWell(
                          onTap: () {
                            Get.off(() => const AuthStarter(),transition: Transition.fade);
                          },
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: primaryColor,
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(right: 40.0),
                        child: InkWell(
                          onTap: () {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 800),
                                curve: Curves.ease);
                          },
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: primaryColor,
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
