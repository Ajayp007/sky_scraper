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
                      top: 32, bottom: 12, left: 12, right: 12),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'bookmark');
                            },
                            icon: const Icon(Icons.location_on_outlined),
                          ),
                          Text(
                            "${providerWH!.model!.name}",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.bookmark_outline),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Image.asset(
                          "assets/image/imag1.png",
                          fit: BoxFit.cover,
                          height: 300,
                          width: 300,
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 300,
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.blue.shade200,
                            border: Border.all(width: 1, color: Colors.white),
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
                              const Text(
                                "30°",
                                style: TextStyle(fontSize: 70),
                              ),
                              const Text(
                                "Cloudy",
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset("assets/image/windy.png"),
                                          const SizedBox(width: 24),
                                          const Text("Wind"),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset("assets/image/hum.png"),
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
                                  const Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("10 km/h"),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        children: [
                                          Text("50 %"),
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
                        height: 100,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'detail',
                              arguments: providerWH!.model);
                        },
                        child: Center(
                          child: Container(
                            height: 50,
                            alignment: Alignment.center,
                            width: MediaQuery.sizeOf(context).width * 0.46,
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
