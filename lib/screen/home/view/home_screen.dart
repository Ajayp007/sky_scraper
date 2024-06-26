import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/shared_helper.dart';
import '../../../utils/theme_provider.dart';
import '../../internet/no_internet.dart';
import '../model/home_model.dart';
import '../provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ThemeProvider? providerR;
  ThemeProvider? providerW;
  TextEditingController txtSearch = TextEditingController();
  HomeProvider? providerWH;
  HomeProvider? providerRH;

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().checkConnection();
    context.read<HomeProvider>().getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<ThemeProvider>();
    providerW = context.watch<ThemeProvider>();
    providerWH = context.watch<HomeProvider>();
    providerRH = context.read<HomeProvider>();
    return SafeArea(
      child: providerWH!.isInternet == false
          ? const NoInternet()
          : Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                  padding: const EdgeInsets.only(
                      top: 8, bottom: 12, left: 12, right: 12),
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
                  child: FutureBuilder(
                    future: providerWH!.model,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: Text("${snapshot.error}"));
                      } else if (snapshot.hasData) {
                        HomeModel? model = snapshot.data;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            SearchBar(
                              controller: txtSearch,
                              leading: IconButton(
                                onPressed: () {
                                  providerWH!.search(txtSearch.text);
                                },
                                icon: const Icon(Icons.search_outlined),
                              ),
                              hintText: "Search...",
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.location_on_outlined),
                                ),
                                Text(
                                  "${model!.name}",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {
                                    providerRH!.bookmark!.add(txtSearch.text);
                                  },
                                  icon: const Icon(Icons.bookmark_outline),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Center(
                              child: Text(
                                "🌦️",
                                style: TextStyle(fontSize: 200),
                              ),
                            ),
                            Center(
                              child: Container(
                                height: 300,
                                width: MediaQuery.sizeOf(context).width * 0.8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.blue.shade200,
                                  border:
                                      Border.all(width: 1, color: Colors.white),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 12),
                                    const Text(
                                      "Today,13 June",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "${model.mainModel!.temp}°",
                                      style: const TextStyle(fontSize: 70),
                                    ),
                                    Text(
                                      "${model.weather![0].description}",
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(height: 30),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                    "assets/image/windy.png"),
                                                const SizedBox(width: 24),
                                                const Text("Wind"),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                    "assets/image/hum.png"),
                                                const SizedBox(width: 24),
                                                const Text("Hum"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 10),
                                        const Column(
                                          children: [
                                            Text("|"),
                                            SizedBox(height: 20),
                                            Text("|"),
                                          ],
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                    "${model.windModel!.speed}"),
                                              ],
                                            ),
                                            const SizedBox(height: 20),
                                            Row(
                                              children: [
                                                Text(
                                                    "${model.mainModel!.humidity}%"),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, 'detail',
                                    arguments: model);
                              },
                              child: Center(
                                child: Container(
                                  height: 50,
                                  alignment: Alignment.center,
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.46,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Text(
                                    "Forecast report >",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ),
              drawer: Drawer(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      Image.network(
                        "https://cdn-icons-png.flaticon.com/512/10127/10127236.png",
                        fit: BoxFit.cover,
                        height: 150,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        leading: const Icon(Icons.home_outlined),
                        title: const Text("Home"),
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
                      ListTile(
                        onTap: () {},
                        leading: const Icon(Icons.light_mode_outlined),
                        title: const Text("ThemeMode"),
                        trailing: Switch(
                          value: providerW!.themeMode!,
                          onChanged: (value) {
                            setThemeData(value);
                            providerR!.setTheme();
                          },
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, 'bookmark');
                        },
                        leading: const Icon(Icons.bookmark_border_outlined),
                        title: const Text("Bookmark"),
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
                      ListTile(
                        onTap: () {},
                        leading: const Icon(Icons.share_outlined),
                        title: const Text("Share"),
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
