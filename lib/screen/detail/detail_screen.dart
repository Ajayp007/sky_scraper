import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sky_scraper/screen/home/model/home_model.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    HomeModel model = ModalRoute.of(context)!.settings.arguments as HomeModel;
    return Scaffold(
      appBar: AppBar(
        title: Text("${model.name}"),
        centerTitle: true,
        backgroundColor: const Color(0xff47BFDF),
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        padding:
            const EdgeInsets.only(top: 32, bottom: 12, left: 12, right: 12),
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Today",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                              color: Colors.blue.shade200,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.white70)),
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
                              color: Colors.blue.shade200,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.white70)),
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
                              color: Colors.blue.shade200,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.white70)),
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
                              color: Colors.blue.shade200,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.white70)),
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
                              color: Colors.blue.shade200,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.white70)),
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
                              color: Colors.blue.shade200,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.white70)),
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
                              color: Colors.blue.shade200,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.white70)),
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
                  height: 300,
                  padding: const EdgeInsets.all(12),
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade300),
                  child: Row(
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
                          const Text("Feels like"),
                          Text("${model.mainModel!.feels_like}"),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
