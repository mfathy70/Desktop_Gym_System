import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fx3/search_athletes.dart';
import 'package:fx3/widgets/search_widget.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/athletes.dart';
import '../model/boxes.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.searchController});

  final TextEditingController searchController;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final contactsBox = Hive.box<Athletes>("athletes");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "FX3 Club",
          style: TextStyle(fontSize: 24),
        ),
        bottom: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height / 12),
            child: const SearchWidget()),
      ),
      body: ValueListenableBuilder<Box<Athletes>>(
          valueListenable: Boxes.getAthletes().listenable(),
          builder: (context, box, _) {
            final athletes = box.values.toList().cast<Athletes>();
            final searchValue = widget.searchController.text;

            var result = searchValue.isEmpty
                ? box.values.toList()
                : box.values
                    .where((element) => element.name.contains(searchValue));
            return buildContent(context, athletes, searchValue);
          }),
    );
  }
}

Widget buildContent(
    BuildContext context, List<Athletes> athletes, String value) {
  ScrollController scrollController = ScrollController();

  if (athletes.isEmpty) {
    return const Center(
      child: Text(
        'No results found !',
        style: TextStyle(fontSize: 24),
      ),
    );
  } else {
    return Column(
      children: [
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardText(text: "id".tr()),
                  CardText(text: "name".tr()),
                  CardText(text: "phone".tr()),
                  CardText(text: "paymentDate".tr()),
                  CardText(text: "paid".tr()),
                  CardText(text: "coach".tr()),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Scrollbar(
            controller: scrollController,
            thumbVisibility: true,
            child: ListView.builder(
              controller: scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: athletes.length,
              itemBuilder: (BuildContext context, int index) {
                final athlete = athletes[index];

                return athletesWidget(context, athlete, index);
              },
            ),
          ),
        ),
      ],
    );
  }
}
