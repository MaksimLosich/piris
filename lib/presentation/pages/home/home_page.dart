import 'package:flutter/material.dart';
import 'package:piris1/presentation/pages/account/account_page.dart';
import 'package:piris1/presentation/pages/deposits/deposits_page.dart';
import 'package:piris1/presentation/pages/main/main_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.people)),
            Tab(icon: Icon(Icons.monetization_on_outlined)),
            Tab(icon: Icon(Icons.monetization_on_outlined)),
          ],
        ),
        body: TabBarView(
          children: [
            MainPage(),
            DepositsPage(),
            AccountPage(),
          ],
        ),
      ),
    );
  }
}
