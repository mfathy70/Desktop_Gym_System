import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../screens/search_screen.dart';

class SearchScreenButton extends StatelessWidget {
  const SearchScreenButton({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SearchScreen(
                    searchController: searchController,
                  )));
        },
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.white,
            fixedSize: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height / 13)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "search".tr(),
              style: const TextStyle(color: Colors.black54, fontSize: 18),
            ),
            const Icon(Icons.search, color: Colors.black54),
          ],
        ),
      ),
    );
  }
}
