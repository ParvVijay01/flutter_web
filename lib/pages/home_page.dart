import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/text_button.dart';
import 'package:portfolio/routes/app_pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> words = ["Photographer", "Stargazer", "Selenophile"];
  int _currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startWordAnimation();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startWordAnimation() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % words.length;
      });
    });
  }

  void _navigateTo(String route) {
    if (Get.currentRoute != route) {
      Get.offNamed(route);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 100,
          leadingWidth: 100,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Text(
              "GARV CHAPLOT",
              style: TextStyle(
                color: Theme.of(context).cardColor,
                fontWeight: FontWeight.bold,
                fontSize:
                    screenWidth > 600 ? screenWidth * 0.03 : screenWidth * 0.06,
              ),
            ),
          ),
          actions: [
            if (screenWidth > 600) ...[
              MyTextButton(
                onPressed: () => _navigateTo(AppPages.HOME),
                text: "Home",
              ),
              const SizedBox(width: 10),
              MyTextButton(
                onPressed: () => _navigateTo(AppPages.GALLERY),
                text: "Gallery",
              ),
              const SizedBox(width: 10),
              MyTextButton(
                onPressed: () => _navigateTo(AppPages.ABOUT),
                text: "Contact",
              ),
              const SizedBox(width: 10),
            ] else ...[
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: PopupMenuButton<String>(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onSelected: _navigateTo,
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: AppPages.HOME,
                      child: const Text("Home"),
                    ),
                    PopupMenuItem(
                      value: AppPages.GALLERY,
                      child: const Text("Gallery"),
                    ),
                    PopupMenuItem(
                      value: AppPages.ABOUT,
                      child: const Text("Contact"),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 40),
              child: Row(
                children: [
                  const Text(
                    "I'm a ",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ClipRect(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        final offsetAnimation = Tween<Offset>(
                          begin: const Offset(0, 1),
                          end: Offset.zero,
                        ).animate(animation);

                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                      child: Text(
                        words[_currentIndex],
                        key: ValueKey<int>(_currentIndex),
                        style: const TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
