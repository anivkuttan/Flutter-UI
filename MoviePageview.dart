import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(color: Colors.orange),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 1);
  }

  List<String> images = [
    'https://images.unsplash.com/photo-1619884889432-b242fdee532a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8c2VhcmNofGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60',
    'https://images.unsplash.com/photo-1495344517868-8ebaf0a2044a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8c2VhcmNofGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60',
    'https://plus.unsplash.com/premium_photo-1670508511045-1b9d41253f25?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8c2VhcmNofGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60',
    'https://plus.unsplash.com/premium_photo-1663099407652-82aa5350a364?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fHNlYXJjaHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60',
    'https://images.unsplash.com/photo-1584438784894-089d6a62b8fa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHNlYXJjaHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60',
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            /// animated Switcher to control the smooth Switch
            AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              child: Container(
                // key is defined to identify each child unic
                key: ValueKey<int>(currentIndex),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(images[currentIndex]),
                    fit: BoxFit.cover,
                  ),
                ),
                // backdrop filler to blur
                // backdrop filter takes child uness it not work

                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
              ),
            ),
            PageView.builder(
              controller: pageController,
              onPageChanged: (pageIndex) {
                setState(() {
                  currentIndex = pageIndex;
                });
              },
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index) {
                return FractionallySizedBox(
                  heightFactor: 0.6,
                  widthFactor: 0.7,
                  child: Container(
                    alignment: const Alignment(0, 0),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(24),
                      ),
                      image: DecorationImage(
                        image: AssetImage(images[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const Text(
                      'Hello',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
