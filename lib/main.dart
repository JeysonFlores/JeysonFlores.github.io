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
      title: 'Jeyson Flores Portfolio',
      theme: ThemeData(
        textTheme: const TextTheme(headline1: TextStyle(color: Colors.black87)),
        backgroundColor: paletteBackground,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Row(
          children: <Widget>[
            const SizedBox(width: 100),
            Container(
                width: 250,
                height: 550,
                margin: const EdgeInsets.only(top: 50),
                decoration: const BoxDecoration(
                  color: paletteSurface,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        "https://raw.githubusercontent.com/JeysonFlores/setaPanel/snippets/rep-resources/seta_logo.png",
                      ),
                    ),
                    const Text("Jeyson Flores"),
                    const Text("Software Engineer"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("GH"),
                        Text("Linkedin"),
                        Text("OCC")
                      ],
                    )
                  ],
                )),
            Expanded(child: Container(color: Colors.blue, child: Text("2"))),
            const SizedBox(width: 100),
          ],
        ),
      ),
    );
  }
}
