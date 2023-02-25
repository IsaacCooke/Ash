import 'package:flutter/material.dart';

import 'package:client/l10n/app_localizations_context.dart';
import 'package:client/pages/home.dart';
import 'package:client/pages/reminders.dart';
import 'package:client/pages/settings.dart';

class Layout extends StatefulWidget{
  const Layout({super.key});

  @override
  State<Layout> createState() => LayoutState();
}

class LayoutState extends State<Layout>{
  int _selectedIndex = 0;

  static const List<Widget> _options = <Widget>[
    Home(),
    Reminders(),
    Settings(),

    // All of these text widgets need to be replaced by the necessary page widgets.
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.ash),
      ),
      body: Center(
        child: _options.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: context.loc.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.list),
            label: context.loc.reminders,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: context.loc.settings,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}