import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/common/data/profile.dart';
import 'package:portfolio/common/utils/contact.dart';
import 'package:url_launcher/url_launcher.dart';
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
        fontFamily: 'Inter',
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
                width: 300,
                height: 570,
                margin: const EdgeInsets.only(top: 50),
                decoration: const BoxDecoration(
                  color: paletteSurface,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 230, 230, 230),
                      offset: Offset(0, 4),
                      blurRadius: 5.0,
                      spreadRadius: 0.3,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Container(
                        padding: const EdgeInsets.only(top: 30),
                        child: Image.asset(
                          'assets/img/my_avatar_150.png',
                          scale: 1.25,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 15),
                      child: const Text(
                        "Jeyson Flores",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 20),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 25, right: 25),
                      decoration: const BoxDecoration(
                        color: paletteBackground,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Software Engineer",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: _buildLinkButtons(profileLinks),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: _buildContactData(profileContact),
                    ),
                  ],
                )),
            Expanded(child: Container(color: Colors.blue, child: Text("2"))),
            const SizedBox(width: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildLinkButtons(List<Contact> data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(data.length, (index) {
        return Container(
          margin: EdgeInsets.only(right: index == (data.length - 1) ? 0 : 10),
          child: CircleAvatar(
            backgroundColor: paletteBackground,
            radius: 20,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: ImageIcon(
                AssetImage("assets/img/${data[index].icon}.png"),
              ),
              color: Colors.black87,
              onPressed: () async {
                final Uri url = Uri.parse(data[index].data);
                await launchUrl(url, mode: LaunchMode.externalApplication);
              },
            ),
          ),
        );
      }),
    );
  }

  Widget _buildContactData(List<Contact> data) {
    return Column(
      children: List.generate(data.length, (index) {
        return Container(
          height: 40,
          margin: const EdgeInsets.only(top: 10, left: 25, right: 25),
          decoration: const BoxDecoration(
            color: paletteBackground,
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(right: 10),
                child: CircleAvatar(
                  backgroundColor: paletteBackground,
                  radius: 20,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: ImageIcon(
                      AssetImage("assets/img/${data[index].icon}.png"),
                    ),
                    color: Colors.black87,
                    onPressed: null,
                  ),
                ),
              ),
              SelectableText(
                data[index].data,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        );
      }),
    );
  }
}
