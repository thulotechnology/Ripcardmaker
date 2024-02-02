import 'package:flutter/material.dart';
import 'package:rip_card_maker/aboutus.dart';
import 'package:rip_card_maker/template/template2.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePagee extends StatefulWidget {
  const HomePagee({super.key});

  @override
  State<HomePagee> createState() => _HomePageeState();
}

class _HomePageeState extends State<HomePagee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage("assests/images/rip_card_maker home.png"),
                height: 150,
              ),
              const Text(
                "CARD MAKER",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
              ),
              const Text("Rip Card Maker"),
              const SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ChooseTemplate()));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(202, 166, 223, 235),
                              Color.fromARGB(255, 173, 246, 176),
                              Color.fromARGB(255, 143, 194, 235)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(3, 5),
                          ),
                        ],
                      ),
                      child: const Column(
                        children: [
                          Icon(
                            Icons.create_outlined,
                            size: 30,
                          ),
                          Text(
                            "Create Card",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  )),
                  // const SizedBox(
                  //   width: 15,
                  // ),
                  // Expanded(
                  //     child: GestureDetector(
                  //   onTap: () {
                  //     Navigator.of(context).push(MaterialPageRoute(
                  //         builder: (context) =>
                  //             FavoritesPage(favoriteItems: [])));
                  //   },
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(vertical: 10),
                  //     decoration: const BoxDecoration(
                  //       gradient: LinearGradient(
                  //           colors: [
                  //             Color.fromARGB(202, 166, 223, 235),
                  //             Color.fromARGB(255, 173, 246, 176),
                  //             Color.fromARGB(255, 143, 194, 235)
                  //           ],
                  //           begin: Alignment.topLeft,
                  //           end: Alignment.bottomRight),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.grey,
                  //           spreadRadius: 3,
                  //           blurRadius: 5,
                  //           offset: Offset(3, 5),
                  //         ),
                  //       ],
                  //     ),
                  //     child: const Column(
                  //       children: [
                  //         Icon(
                  //           Icons.favorite,
                  //           size: 30,
                  //         ),
                  //         Text(
                  //           "Favourites",
                  //           style: TextStyle(
                  //               fontSize: 16, fontWeight: FontWeight.bold),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ))
              
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Aboutpage()));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(202, 166, 223, 235),
                              Color.fromARGB(255, 173, 246, 176),
                              Color.fromARGB(255, 143, 194, 235)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(3, 5),
                          ),
                        ],
                      ),
                      child: const Column(
                        children: [
                          Icon(
                            Icons.info,
                            size: 30,
                          ),
                          Text(
                            "About us",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  )),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: GestureDetector(
                        onTap: (){
                           launchUrlString("https://thulotechnology.com/privacy-policy/");
                        },
                        child: Container(
                                            padding: const EdgeInsets.symmetric(vertical: 10),
                                            decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(202, 166, 223, 235),
                          Color.fromARGB(255, 173, 246, 176),
                          Color.fromARGB(255, 143, 194, 235)
                        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(3, 5),
                          ),
                        ],
                                            ),
                                            child: const Column(
                        children: [
                          Icon(
                            Icons.privacy_tip,
                            size: 30,
                          ),
                          Text(
                            "Privacy Policy",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ],
                                            ),
                                          ),
                      ))
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(202, 166, 223, 235),
                        Color.fromARGB(255, 173, 246, 176),
                        Color.fromARGB(255, 143, 194, 235)
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(3, 5),
                        ),
                      ],
                    ),
                    child: const Column(
                      children: [
                        Icon(
                          Icons.share,
                          size: 30,
                        ),
                        Text(
                          "Share App",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
