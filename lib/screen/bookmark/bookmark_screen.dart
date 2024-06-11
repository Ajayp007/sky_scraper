import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home/provider/home_provider.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  HomeProvider? providerWH;
  HomeProvider? providerRH;
  TextEditingController txtSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    providerWH = context.watch<HomeProvider>();
    providerRH = context.read<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose City"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SearchBar(
              controller: txtSearch,
              leading: IconButton(
                onPressed: () {
                  providerWH!.search(txtSearch.text);
                  providerRH!.bookmark!.add(txtSearch.text);
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.search_outlined),
              ),
              hintText: "Search...",
            ),
          ],
        ),
      ),
    );
  }
}
