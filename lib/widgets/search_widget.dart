import 'package:flutter/material.dart';
import 'package:fx3/model/athletes.dart';
import 'package:fx3/view_athletes_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'details_card.dart';

class SearchWidget extends SearchDelegate<Athletes> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.black12,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ));
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchFinder(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SearchFinder(query: query);
  }
}

class SearchFinder extends StatelessWidget {
  final String query;

  const SearchFinder({Key? key, required this.query}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();

    return ValueListenableBuilder(
      valueListenable: Hive.box<Athletes>('athletes').listenable(),
      builder: (context, Box<Athletes> athletesBox, _) {
        ///* this is where we filter data
        var results = query.isEmpty
            ? athletesBox.values.toList() // whole list
            : athletesBox.values.where((element) {
                return element.name.toLowerCase().contains(query) ||
                    element.id.toString().contains(query) ||
                    element.phoneNumber.toString().contains(query);
              }).toList();

        return results.isEmpty
            ? const Center(child: CardText(text: 'No results found !'))
            : Column(
                children: [
                  const SizedBox(height: 12),
                  const DetailsCard(),
                  Expanded(
                    child: Scrollbar(
                      controller: scrollController,
                      thumbVisibility: true,
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: results.length,
                        itemBuilder: (context, index) {
                          // passing as a custom list
                          final Athletes athleteListItem = results[index];

                          return athletesWidget(
                              context, athleteListItem, index);
                        },
                      ),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
