import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //use static key word to asscess instance menber
  static List<MoviesModel> mainMovieList = [
    MoviesModel(movieName: 'Pk', movieRating: "7.5/10"),
    MoviesModel(movieName: 'Kgf', movieRating: "9.5/10"),
    MoviesModel(movieName: 'RRR', movieRating: "8.5/10"),
    MoviesModel(movieName: 'Ravanan', movieRating: "4.5/10"),
    MoviesModel(movieName: 'Kaithi', movieRating: "6.9/10"),
  ];
  List<MoviesModel> displayMovieList = List.from(mainMovieList);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar'),
      ),
      body: Center(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
              onChanged: (textValue) {
                setState(() {
                  // updating display list on user search
                  // taking mainList element to lowerCase then
                  //it's conntains input lowerCase value
                  displayMovieList = mainMovieList
                      .where((element) => element.movieName.toLowerCase().contains(textValue.toLowerCase()))
                      .toList();
                });
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: displayMovieList.isEmpty
                ? const Center(
                    child: Text('Result not Fount'),
                  )
                : ListView.builder(
                    itemCount: displayMovieList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(displayMovieList[index].movieName),
                        subtitle: Text('${displayMovieList[index].movieRating}'),
                      );
                    }),
          ),
        ]),
      ),
    );
  }
}

class MoviesModel {
  String movieName;
  String? movieRating;
  MoviesModel({
    required this.movieName,
    this.movieRating,
  });
}
