import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Aboutpage extends StatelessWidget {
  const Aboutpage({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text("About Us", style: TextStyle(color: Colors.black)),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              )),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                const SizedBox(height: 10.0),
                Container(
                  width: media.width * 0.2,
                  height: media.width * 0.2,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(image: AssetImage("assests/images/icon.png"))
                  ),
                  // child: Image.asset(
                  //   'assests/images/icon.png',
                  //   width: media.width * 0.2,
                  // ),
                ),
                Divider(
                  thickness: 3,
                ),
                Text("Rip Card Maker", style: TextStyle(
                  color: Color.fromARGB(247, 134, 111, 111),
                  fontWeight: FontWeight.bold,
                  fontSize: 24
                ),),
                const Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 12.0),
                  child: Text(
                    'Create heartfelt RIP cards effortlessly with our Rip Card Maker App. This user-friendly app offers easy customization with elegant templates and personalized messages. Honor your loved ones with a touch of comfort and elegance. Use it to craft meaningful tributes.',
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 10),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15.0),
                    decoration:const  BoxDecoration(
                      borderRadius:  BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                      color:  Color.fromARGB(247, 207, 191, 191)
                      // color: Color.fromARGB(255, 48, 59, 97),
                    ),
                    child: const Column(
                      children: [
                        Text(
                          'Thulo Technology Pvt. Ltd.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 8.0),
                          child: Text(
                            'Thulo Technology is a software development company that specializes in mobile application development. It is a team of highly motivated and skilled individuals who are passionate about creating innovative solutions to real-world problems.',
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.black),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 10),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15.0),
                    decoration:const  BoxDecoration(
                      borderRadius:  BorderRadius.only(
                        bottomLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                      ),
                      color:  Color.fromARGB(247, 207, 191, 191),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Contact Us For App Development',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // email
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                launch('mailto:info@thulotechnology.com'
                                    '?subject=Passport Size Photo Maker Pro&body=Hello Thulo Technology, ');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Icon(
                                    Icons.email,
                                    size: 40,
                                    color: Color.fromARGB(255, 13, 14, 14),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            InkWell(
                              onTap: () {
                                launch('tel:+977-9809373860');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Icon(
                                    Icons.phone,
                                    size: 40,
                                    color: Color.fromARGB(255, 13, 14, 14),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            InkWell(
                              onTap: () {
                                launch('https://thulotechnology.com/');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Icon(
                                    Icons.language,
                                    size: 40,
                                    color: Color.fromARGB(255, 13, 14, 14),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}