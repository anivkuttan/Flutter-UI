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
