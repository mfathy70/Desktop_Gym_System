import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fx3/screens/search_screen.dart';
import 'package:fx3/widgets/custom_textfield.dart';
import 'package:fx3/widgets/dialogs/details_dialog.dart';
import 'package:fx3/widgets/dialogs/edit_details_dialog.dart';
import 'package:fx3/widgets/search_widget.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'model/athletes.dart';
import 'model/boxes.dart';
import 'widgets/search_screen_button.dart';

class SearchAthletes extends StatefulWidget {
  const SearchAthletes({super.key});

  @override
  State<SearchAthletes> createState() => _SearchAthletesState();
}

class _SearchAthletesState extends State<SearchAthletes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<Box<Athletes>>(
          valueListenable: Boxes.getAthletes().listenable(),
          builder: (context, box, _) {
            final athletes = box.values.toList().cast<Athletes>();
            return buildContent(context, athletes);
          }),
    );
  }
}

Widget buildContent(BuildContext context, List<Athletes> athletes) {
  ScrollController scrollController = ScrollController();
  TextEditingController searchController = TextEditingController();

  if (athletes.isEmpty) {
    return const Center(
      child: Text(
        'No athletes yet!',
        style: TextStyle(fontSize: 24),
      ),
    );
  } else {
    return Column(
      children: [
        SearchScreenButton(searchController: searchController),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 60, child: CardText(text: "id".tr())),
                  SizedBox(width: 150, child: CardText(text: "name".tr())),
                  SizedBox(width: 120, child: CardText(text: "phone".tr())),
                  SizedBox(
                      width: 120, child: CardText(text: "paymentDate".tr())),
                  SizedBox(width: 120, child: CardText(text: "paid".tr())),
                  SizedBox(width: 100, child: CardText(text: "coach".tr())),
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

class CardText extends StatelessWidget {
  const CardText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      overflow: TextOverflow.fade,
    );
  }
}

Widget athletesWidget(BuildContext context, Athletes athlete, index) {
  // final color = athlete ? Colors.red : Colors.green;

  return GestureDetector(
    onTap: () {
      detailsDialog(context, athlete, index);
    },
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 60, child: CardText(text: athlete.id.toString())),
            SizedBox(width: 150, child: CardText(text: athlete.name)),
            SizedBox(width: 120, child: CardText(text: athlete.phoneNumber)),
            SizedBox(
              width: 120,
              child: CardText(
                  text:
                      "${athlete.paymentDate.day}/${athlete.paymentDate.month}/${athlete.paymentDate.year}"),
            ),
            SizedBox(
                width: 120,
                child: CardText(text: "${athlete.paid.toString()} EGP")),
            SizedBox(width: 100, child: CardText(text: athlete.withCoach)),
          ],
        ),
      ),
    ),
  );
}
