import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Layout extends StatefulWidget{
  const Layout({super.key});

  @override
  State<Layout> createState() => LayoutState();
}

class LayoutState extends State<Layout>{
  int _selectedIndex = 0;

  static const TextStyle  optionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _options = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Reminders',
      style: optionStyle,
    ),
    Text(
      "Settings",
      style: optionStyle,
    ),

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
        title: Text(AppLocalizations.of(context)!.ash),
      ),
      body: Center(
        child: _options.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.list),
            label: AppLocalizations.of(context)!.reminders,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: AppLocalizations.of(context)!.settings,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}