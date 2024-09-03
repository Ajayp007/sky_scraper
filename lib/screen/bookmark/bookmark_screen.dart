import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/theme_provider.dart';
import '../home/provider/home_provider.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  HomeProvider? providerWH;
  HomeProvider? providerRH;
  ThemeProvider? providerR;
  ThemeProvider? providerW;

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getBook();
  }

  @override
  Widget build(BuildContext context) {
    providerWH = context.watch<HomeProvider>();
    providerRH = context.read<HomeProvider>();
    providerR = context.read<ThemeProvider>();
    providerW = context.watch<ThemeProvider>();
    return Scaffold(
      body: Stack(
        children: [
          providerW!.themeMode! == false
              ? Image.network(
                  "https://i.pinimg.com/736x/70/81/29/7081293704e5282caec520734f262432.jpg",
                  fit: BoxFit.cover,
                  height: MediaQuery.sizeOf(context).height,
                )
              : Image.network(
                  "https://media.istockphoto.com/id/1155985333/photo/blue-sky-and-white-clouds-in-summer.webp?b=1&s=612x612&w=0&k=20&c=KUNu-lWzna3EhSz51TNIf1KlhLf3Vr0SlmYe__J6csU=",
                  fit: BoxFit.cover,
                  height: MediaQuery.sizeOf(context).height,
                ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 12, right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: providerWH!.bookmark.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 80,
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        width: MediaQuery.sizeOf(context).width * 0.96,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.blue.shade200.withOpacity(0.2),
                          border: Border.all(width: 1, color: Colors.white),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              providerRH!.bookmark[index],
                              style: const TextStyle(fontSize: 18),
                            ),
                            const Text(
                              "⛈️",
                              style: TextStyle(fontSize: 20),
                            ),
                            IconButton(
                              onPressed: () {
                                providerWH!.deleteBookmark(index);
                              },
                              icon: const Icon(Icons.delete_outline_outlined),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
