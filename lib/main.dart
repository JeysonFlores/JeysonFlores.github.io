import 'package:flutter/material.dart';
import 'common/utils/adaptative.dart';
import 'common/data/palette.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Portfolio',
      theme: ThemeData(
        textTheme: const TextTheme(headline1: TextStyle(color: Colors.black87)),
        backgroundColor: paletteBackground,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends AdaptativeState<HomePage> {
  @override
  Widget buildMobile(BuildContext context) {
    return Container(
      child: const Text("xdd"),
    );
  }

  @override
  Widget buildDesktop(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          children: <Widget>[
            const SizedBox(width: 100),
            Container(
              width: MediaQuery.of(context).size.width * 0.21,
              height: MediaQuery.of(context).size.width * 0.8,
              margin: const EdgeInsets.only(top: 50),
              decoration: const BoxDecoration(
                color: paletteSurface,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: const Text(
                "Xddd",
                style: TextStyle(color: paletteAccent),
              ),
            ),
            Expanded(child: Container(color: Colors.blue, child: Text("2"))),
            const SizedBox(width: 100),
          ],
        ),
      ),
    );
  }
}
