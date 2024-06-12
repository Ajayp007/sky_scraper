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

  @override
  Widget build(BuildContext context) {
    providerWH = context.watch<HomeProvider>();
    providerRH = context.read<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bookmark"),
        centerTitle: true,
        backgroundColor: const Color(0xff47BFDF),
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        padding:
            const EdgeInsets.only(top: 24, bottom: 12, left: 12, right: 12),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff47BFDF),
              Color(0xff4A91FF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: providerWH!.bookmark!.length,
          itemBuilder: (context, index) {
            return Container(
              height: 80,
              padding: const EdgeInsets.only(left: 20,right: 20),
              margin: const EdgeInsets.all(15),
              width: MediaQuery.sizeOf(context).width * 0.96,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.blue.shade200.withOpacity(0.2),
                border: Border.all(width: 1, color: Colors.white),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${providerRH!.bookmark![index]}",style: TextStyle(fontSize: 18),),
                  const Text("⛈️",style: TextStyle(fontSize: 20),),
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
    );
  }
}
