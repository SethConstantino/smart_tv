import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.select): ActivateIntent(),
      },
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Breaking Code'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> images = [
    "https://pbs.twimg.com/media/Eu7kZRRWgAMJjj8.png",
    "https://pbs.twimg.com/media/Eu7kZRRWgAMJjj8.png",
    "https://pbs.twimg.com/media/Eu7kZRRWgAMJjj8.png",
    "https://pbs.twimg.com/media/Eu7kZRRWgAMJjj8.png",
    "https://pbs.twimg.com/media/Eu7kZRRWgAMJjj8.png",
    "https://pbs.twimg.com/media/Eu7kZRRWgAMJjj8.png",
    "https://pbs.twimg.com/media/Eu7kZRRWgAMJjj8.png",
    "https://pbs.twimg.com/media/Eu7kZRRWgAMJjj8.png",
    "https://pbs.twimg.com/media/Eu7kZRRWgAMJjj8.png",
    "https://pbs.twimg.com/media/Eu7kZRRWgAMJjj8.png",
    "https://pbs.twimg.com/media/Eu7kZRRWgAMJjj8.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView(
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1.0,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: images.map((url) {
          return InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailScreen(url)));
              },
              child: Card(child: Image.network(url)));
        }).toList(),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String url;
  const DetailScreen(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Card(child: Image.network(url)),
      ),
    );
  }
}
