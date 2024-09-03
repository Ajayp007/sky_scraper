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
  var scaffoldKey = GlobalKey<ScaffoldState>();
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
    return providerWH!.isInternet == false
        ? const NoInternet()
        : Scaffold(
            key: scaffoldKey,
            body: Stack(
              children: [
                providerW!.themeMode! == false
                    ? Image.network(
                        "https://i.pinimg.com/736x/70/81/29/7081293704e5282caec520734f262432.jpg",
                        fit: BoxFit.cover,
                        height: MediaQuery.sizeOf(context).height,
                        width: MediaQuery.sizeOf(context).width,
                      )
                    : Image.network(
                        "https://media.istockphoto.com/id/1155985333/photo/blue-sky-and-white-clouds-in-summer.webp?b=1&s=612x612&w=0&k=20&c=KUNu-lWzna3EhSz51TNIf1KlhLf3Vr0SlmYe__J6csU=",
                        fit: BoxFit.cover,
                        height: MediaQuery.sizeOf(context).height,
                        width: MediaQuery.sizeOf(context).width,
                      ),
                SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 60, left: 12, right: 12),
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
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      scaffoldKey.currentState!.openDrawer();
                                    },
                                    icon: const Icon(Icons.menu),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.82,
                                    child: SearchBar(

                                      controller: txtSearch,
                                      leading: IconButton(
                                        onPressed: () {
                                          providerWH!.search(txtSearch.text);
                                        },
                                        icon: const Icon(Icons.search_outlined),
                                      ),
                                      hintText: "Search...",
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon:
                                        const Icon(Icons.location_on_outlined),
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
                                      providerRH!.setBookmark(model.name!);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              "Added Bookmark Successfully"),
                                        ),
                                      );
                                    },
                                    icon: const Icon(Icons.bookmark_outline),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Container(
                                  height: 300,
                                  width: MediaQuery.sizeOf(context).width * 0.8,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: providerW!.themeMode! == false
                                        ? Colors.deepPurple.shade200
                                        : Colors.blue.shade200,
                                    border: Border.all(
                                        width: 1, color: Colors.white),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                height: 20,
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
              ],
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
                          Bookmark.bookmark.setThemeData(value);
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
          );
  }
}
