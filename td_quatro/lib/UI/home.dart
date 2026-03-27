import 'package:flutter/material.dart';
import 'package:td_dos/UI/mytheme.dart';
import 'package:td_dos/modele/task.dart';
import 'package:td_dos/modele/AcceuilPage.dart';
import 'package:td_dos/modele/recherchePage.dart';

import '../modele/AddTask.dart';
import '../modele/MainPage.dart';
import '../modele/ProfilPage.dart';
import '../modele/SettingsPage.dart';


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{

  final List<Widget> pages = [
    MainPage(),
    AccueilPage(),
    RecherchePage(),
    ProfilPage(),
    SettingsPage()
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Mon AppBar', style: Theme.of(context).appBarTheme.titleTextStyle),
          centerTitle: true,
        ),
        body:
        pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(

        selectedItemColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        unselectedItemColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.language), label: 'Main'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Recherche'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Paramètres'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,

      ),
      floatingActionButton: _selectedIndex==0?FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => AddTask(),
          )
          );
        },
        child: const Icon(Icons.add),):const SizedBox.shrink(),
    );
  }
}