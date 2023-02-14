import 'package:flutter/material.dart';
import 'package:custom_navigation_drawer_v2/commons/collapsing_navigation_drawer_widget.dart';
import 'package:custom_navigation_drawer_v2/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Navigation Drawer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: drawerBackgroundColor,
          leading: IconButton(
            icon: const Icon(Icons.login),
            onPressed: () {
              setState(() {
                isHidden = !isHidden;
              });
            },
          ),
          title: const Text(
            "Collapsing Navigation Drawer/Sidebar",
          ),
        ),
        //drawer: CollapsingNavigationDrawer(),
        body: Stack(
          children: <Widget>[
            Container(
              color: selectedColor,
            ),
            CollapsingNavigationDrawer(isHidden: isHidden),
          ],
        ));
  }
}
