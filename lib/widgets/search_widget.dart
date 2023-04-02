import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fx3/model/boxes.dart';
import 'package:fx3/provider/search_provider.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        color: Colors.blue,
        child: Row(
          children: [
            const SizedBox(width: 12),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.03,
              height: MediaQuery.of(context).size.height / 13,
              child: TextField(
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                cursorColor: Colors.black,
                controller: searchController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "search".tr(),
                  suffixIconColor: Colors.black54,
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search, color: Colors.black54)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(width: 0, color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(width: 0, color: Colors.blue),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
