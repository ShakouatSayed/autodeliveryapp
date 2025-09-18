import 'package:autodeliveryapp/onboardingScreen/OnboardingCard.dart';
import 'package:flutter/material.dart';

import '../singInPage/SignInPage.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreen();
}

class _OnboardingScreen extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> onboardingData = [
    {
      "icon": Icons.flash_on,
      "title": "Auto-accept insights",
      "subtitle": "Get faster to new offers with one-tap flows",
    },
    {
      "icon": Icons.inventory,
      "title": "Multi-app control",
      "subtitle": "Manage all rider apps from one dashboard",
    },
    {
      "icon": Icons.rocket_launch,
      "title": "Priority & Safety",
      "subtitle": "Get app priority, avoid double accept conflicts",
    },
  ];

  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:  Text(
          "Welcome",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.03),

              //PageView for slides
              SizedBox(
                height: screenHeight * 0.3,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboardingData.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return OnboardingCard(
                      icon: onboardingData[index]["icon"],
                      title: onboardingData[index]["title"],
                      subtitle: onboardingData[index]["subtitle"],
                    );
                  },
                ),
              ),
              SizedBox(height: 15),
              //Dots Indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onboardingData.length,
                  (index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    width: _currentPage == index ? 12 : 8,
                    height: _currentPage == index ? 12 : 8,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? Colors.blue
                          : Colors.grey.shade400,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.38),

              //Bottom Buttons
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _currentPage == onboardingData.length - 1 ? Colors.green : Colors.blue,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.2,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    if (_currentPage == onboardingData.length - 1) {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> SignInPage()));
                    } else {
                      _pageController.nextPage(
                        duration: Duration(microseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    _currentPage == onboardingData.length - 1
                        ? "Get Started"
                        : "Next",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     //Skip button
              //     TextButton(
              //       onPressed: () {
              //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SignInPage()));
              //       },
              //       child: Text("Skip", style: TextStyle(color: Colors.grey)),
              //     ),
              //
              //     //Next button
              //     ElevatedButton(
              //       style: ElevatedButton.styleFrom(
              //         backgroundColor: Colors.blue,
              //         padding: EdgeInsets.symmetric(
              //           horizontal: screenWidth * 0.2,
              //           vertical: 14,
              //         ),
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(30),
              //         ),
              //       ),
              //       onPressed: () {
              //         if (_currentPage == onboardingData.length - 1) {
              //           Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> SignInPage()));
              //         } else {
              //           _pageController.nextPage(
              //             duration: Duration(microseconds: 300),
              //             curve: Curves.easeInOut,
              //           );
              //         }
              //       },
              //       child: Text(
              //         _currentPage == onboardingData.length - 1
              //             ? "Get Started"
              //             : "Next",
              //         style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //           fontSize: 16,
              //           color: Colors.white,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
