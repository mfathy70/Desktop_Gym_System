import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fx3/widgets/details_card.dart';
import 'package:fx3/widgets/dialogs/details_dialog.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'model/athletes.dart';
import 'model/boxes.dart';

class ViewAthletes extends StatefulWidget {
  const ViewAthletes({super.key});

  @override
  State<ViewAthletes> createState() => _ViewAthletesState();
}

class _ViewAthletesState extends State<ViewAthletes> {
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

  if (athletes.isEmpty) {
    return Center(
      child: Text(
        "noAthletes".tr(),
        style: const TextStyle(fontSize: 24),
      ),
    );
  } else {
    return Column(
      children: [
        const DetailsCard(),
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
