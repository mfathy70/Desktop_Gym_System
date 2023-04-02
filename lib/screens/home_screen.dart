import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fx3/model/athletes.dart';
import 'package:fx3/model/boxes.dart';
import 'package:fx3/restart.dart';
import 'package:fx3/search_athletes.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../add_athletes.dart';

const List<String> list = <String>['Arabic', 'English'];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: appBar(context),
        drawer: appDrawer(context),
        body: const TabBarView(children: [
          Text('tab1'),
          AddAthletes(),
          SearchAthletes(),
        ]),
      ),
    );
  }

  Drawer appDrawer(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
          borderRadius: Localizations.localeOf(context).languageCode == "en"
              ? const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20))
              : const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20))),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[languageButton(context)],
      ),
    );
  }

  DropdownButton<String> languageButton(BuildContext context) {
    return DropdownButton(
      borderRadius: BorderRadius.circular(20),
      icon: const Icon(Icons.language),
      hint: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'language'.tr(),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      underline: const SizedBox(),
      iconSize: 0,
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        if (value == "English") {
          setState(() {
            context.setLocale(const Locale('en', 'US'));
            RestartWidget.restartApp(context);
          });
        }
        if (value == "Arabic") {
          setState(() {
            context.setLocale(const Locale('ar', 'AR'));
            RestartWidget.restartApp(context);
          });
        }
        ;
      },
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      bottom: TabBar(tabs: [
        Tab(
          icon: const Icon(Icons.person),
          text: "attendance".tr(),
        ),
        Tab(
          icon: const Icon(Icons.person_add_rounded),
          text: "addAthlete".tr(),
        ),
        Tab(
          icon: const Icon(Icons.person_search_rounded),
          text: "searchAathletes".tr(),
        ),
      ]),
    );
  }
}
