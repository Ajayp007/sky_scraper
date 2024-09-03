import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scraper/screen/home/model/home_model.dart';

import '../../utils/theme_provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  ThemeProvider? providerR;
  ThemeProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<ThemeProvider>();
    providerW = context.watch<ThemeProvider>();
    HomeModel model = ModalRoute.of(context)!.settings.arguments as HomeModel;
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
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 60, left: 12, right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "${model.name}",
                        style: const TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Today",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        "June, 13",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            padding: const EdgeInsets.only(top: 10),
                            margin: const EdgeInsets.only(right: 12),
                            height: 140,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple.shade200,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.white70,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text("${model.mainModel!.temp}°"),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Image.network(
                                      "https://cdn-icons-png.freepik.com/512/1779/1779940.png",
                                      fit: BoxFit.cover,
                                      height: 40,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text("8 am"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 60,
                            padding: const EdgeInsets.only(top: 10),
                            height: 140,
                            margin: const EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                                color: Colors.deepPurple.shade200,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.white70)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text("${model.mainModel!.temp}°"),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Text(
                                      "🌦️",
                                      style: TextStyle(fontSize: 35),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Text("9 am"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 60,
                            padding: const EdgeInsets.only(top: 10),
                            height: 140,
                            margin: const EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                                color: Colors.deepPurple.shade200,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.white70)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text("${model.mainModel!.temp}°"),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Text(
                                      "⛈️",
                                      style: TextStyle(fontSize: 35),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Text("10 am"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 60,
                            padding: const EdgeInsets.only(top: 10),
                            height: 140,
                            margin: const EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                                color: Colors.deepPurple.shade200,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.white70)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text("${model.mainModel!.temp}°"),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Text(
                                      "🌨️",
                                      style: TextStyle(fontSize: 35),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Text("11 am"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 60,
                            padding: const EdgeInsets.only(top: 10),
                            height: 140,
                            margin: const EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                                color: Colors.deepPurple.shade200,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.white70)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text("${model.mainModel!.temp}°"),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Text(
                                      "☀️",
                                      style: TextStyle(fontSize: 33),
                                    ),
                                    const SizedBox(
                                      height: 18,
                                    ),
                                    const Text("12 pm"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 60,
                            padding: const EdgeInsets.only(top: 10),
                            height: 140,
                            margin: const EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                                color: Colors.deepPurple.shade200,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.white70)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text("${model.mainModel!.temp}°"),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Text(
                                      "☁️",
                                      style: TextStyle(fontSize: 35),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Text("01 pm"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 60,
                            padding: const EdgeInsets.only(top: 10),
                            height: 140,
                            margin: const EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                                color: Colors.deepPurple.shade200,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.white70)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text("${model.mainModel!.temp}°"),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Text(
                                      "☀️",
                                      style: TextStyle(fontSize: 35),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Text("02 pm"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(height: 30),
                  const Text(
                    "Next Forecast",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Jun, 13",
                              style: TextStyle(fontSize: 18),
                            ),
                            const Text(
                              "🌦️",
                              style: TextStyle(fontSize: 30),
                            ),
                            Text(
                              "${model.mainModel!.temp}",
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Jun, 14",
                              style: TextStyle(fontSize: 18),
                            ),
                            const Text(
                              "☀️",
                              style: TextStyle(fontSize: 30),
                            ),
                            Text(
                              "${model.mainModel!.temp}",
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Jun, 15",
                              style: TextStyle(fontSize: 18),
                            ),
                            const Text(
                              "🌥️",
                              style: TextStyle(fontSize: 30),
                            ),
                            Text(
                              "${model.mainModel!.temp}",
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Jun, 16",
                              style: TextStyle(fontSize: 18),
                            ),
                            const Text(
                              "⛈️",
                              style: TextStyle(fontSize: 30),
                            ),
                            Text(
                              "${model.mainModel!.temp}",
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Jun, 17",
                              style: TextStyle(fontSize: 18),
                            ),
                            const Text(
                              "🌨️",
                              style: TextStyle(fontSize: 30),
                            ),
                            Text(
                              "${model.mainModel!.temp}",
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Jun, 18",
                              style: TextStyle(fontSize: 18),
                            ),
                            const Text(
                              "☁️",
                              style: TextStyle(fontSize: 30),
                            ),
                            Text(
                              "${model.mainModel!.temp}",
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 270,
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(16),
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.blue.shade200.withOpacity(0.2),
                      border: Border.all(width: 1, color: Colors.white),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  "🌡️",
                                  style: TextStyle(fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text("Feels like"),
                                Text("${model.mainModel!.feels_like}"),
                              ],
                            ),
                            const SizedBox(width: 20),
                            Column(
                              children: [
                                const Text(
                                  "🌪️",
                                  style: TextStyle(fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text("Wind Speed"),
                                Text("${model.windModel!.speed}"),
                              ],
                            ),
                            const SizedBox(width: 20),
                            Column(
                              children: [
                                const Text(
                                  "💧",
                                  style: TextStyle(fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text("Humidity"),
                                Text("${model.mainModel!.humidity}"),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  "♒️",
                                  style: TextStyle(fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text("Pressure"),
                                Text("${model.mainModel!.pressure}"),
                              ],
                            ),
                            const SizedBox(width: 20),
                            Column(
                              children: [
                                const Icon(Icons.remove_red_eye_outlined),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text("Visibility"),
                                Text("${model.visibility}"),
                              ],
                            ),
                            const SizedBox(width: 20),
                            Column(
                              children: [
                                const Text(
                                  "⛅︎",
                                  style: TextStyle(fontSize: 22),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text("Cloud"),
                                Text("${model.cloudsModel!.all}°"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
