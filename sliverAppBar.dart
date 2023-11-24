import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: MyWidgetClass(),
      ), //scaffold
    );
  }
}

class MyWidgetClass extends StatefulWidget {
  const MyWidgetClass({super.key});

  @override
  State createState() => _MyWidgetClassState();
}

class _MyWidgetClassState extends State<MyWidgetClass> {
  Decoration boxdecoration = BoxDecoration(
    color: Colors.pink,
    border: Border.all(),
    borderRadius: BorderRadius.circular(23),
  );

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      const SliverAppBar(
        title: Text('Keeper'),
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: [
          Icon(Icons.favorite),
        ],
        expandedHeight: 450,
        flexibleSpace: FlexibleSpaceBar(),
      ), //sliver appbar,

      SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          return Container(
              decoration: boxdecoration,
              height: 100,
              width: 100,
              margin: const EdgeInsets.all(20));
        }, childCount: 25), //builderdeligate
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2), //griddelegate
      ), //slivergrid
    ]);
  }
}

class Person {
  final int? id;
  final String name;
  final int amount;
  final String? image;

  Person({this.id, required this.name, this.amount = 0, this.image});
}

class MyCustomAppBar extends SliverPersistentHeaderDelegate {
  MyCustomAppBar(this.screenWidth) {
    profilePicTranslateTween =
        Tween<double>(begin: screenWidth / 2 - 45 - 40 + 15, end: 40.0);
  }
  double screenWidth;
  Tween<double>? profilePicTranslateTween;
  static ColorTween appBarColor =
      ColorTween(begin: Colors.white, end: Colors.green);
  static final appbarIconColorTween =
      ColorTween(begin: Colors.grey[800], end: Colors.white);
  static final phoneNumberTranslateTween = Tween<double>(begin: 20.0, end: 0.0);

  static final phoneNumberFontSizeTween = Tween<double>(begin: 20.0, end: 16.0);
  static final profileImageRadiusTween = Tween<double>(begin: 3.5, end: 1.0);
  

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final relativeScroll = min(shrinkOffset, 45) / 45;

    final relativeScroll70px = min(shrinkOffset, 70) / 70;
    return Container(
      color: appBarColor.transform(relativeScroll),
      child: Stack(
        children: [
          Stack(
            children: [
              Positioned(
                left: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back, size: 25),
                  color: appbarIconColorTween.transform(relativeScroll),
                ),
              ),
              Positioned(
                right: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert, size: 25),
                  color: appbarIconColorTween.transform(relativeScroll),
                ),
              ),
              Positioned(
                  top: 15,
                  left: 90,
                  child: displayPhoneNumber(relativeScroll70px)),
              Positioned(
                  top: 5,
                  left: profilePicTranslateTween!.transform(relativeScroll70px),
                  child: displayProfilePicture(relativeScroll70px)),
            ],
          ),
        ],
      ),
    );
  }

  Widget displayProfilePicture(double relativeFullScrollOffset) {
    return Transform(
      transform: Matrix4.identity()
        ..scale(
          profileImageRadiusTween.transform(relativeFullScrollOffset),
        ),
      child: const CircleAvatar(
        backgroundImage: NetworkImage(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEgzwHNJhsADqquO7m7NFcXLbZdFZ2gM73x8I82vhyhg&s"),
      ),
    );
  }

  Widget displayPhoneNumber(double relativeFullScrollOffset) {
    if (relativeFullScrollOffset >= 0.8) {
      return Transform(
        transform: Matrix4.identity()
          ..translate(
            0.0,
            phoneNumberTranslateTween
                .transform((relativeFullScrollOffset - 0.8) * 5),
          ),
        child: Text(
          "+3 3333333333",
          style: TextStyle(
            fontSize: phoneNumberFontSizeTween
                .transform((relativeFullScrollOffset - 0.8) * 5),
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }

  @override
  double get maxExtent => 120;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
