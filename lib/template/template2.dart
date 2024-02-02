import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rip_card_maker/template/edit_template_page.dart';

class TemplateData {
  String latePerson;
  String dob;
  String dod;
  String desc;
  String image;
  Widget widget;

  TemplateData({
    required this.latePerson,
    required this.dob,
    required this.dod,
    required this.desc,
    required this.image,
    required this.widget,
  });
}


class ChooseTemplate extends StatefulWidget {
  List<Widget> gridTemplates = [];

  @override
  State<ChooseTemplate> createState() => _ChooseTemplateState();

  Widget generateCardWidget(int index, TemplateData templateData) {
    return gridTemplates[index];
  }
}

class _ChooseTemplateState extends State<ChooseTemplate> {
  List<TemplateData> templateDataList = [];

  @override
  void initState() {
    super.initState();
    templateDataList = [
      TemplateData(
        latePerson: "John Doe",
        dob: "January 1, 1980",
        dod: "February 2, 2022",
        desc: "Beloved husband, father, and grandfather",
        image: '',
        widget: gridChooseTemplate1(
          "John Doe",
          "mmmm d, yyyy",
          "mmmm d, yyyy",
          "Beloved husband, father, and grandfather",
          const Image(image: AssetImage("path/to/image")),
        ),
      ),

      TemplateData(
        latePerson: "Dr. Buda",
        dob: "January 1, 1980",
        dod: "February 2, 2022",
        desc: "Beloved husband, father, and grandfather",
        image: '',
        widget: gridChooseTemplate2(
          "Dr. Buda",
          "mmmm d, yyyy",
          "mmmm d, yyyy",
          "Beloved husband, father, and grandfather",
          const Image(image: AssetImage("path/to/image")),
        ),
      ),

      TemplateData(
        latePerson: "Late person name",
        dob: "January 1, 1980",
        dod: "February 2, 2022",
        desc: "Beloved husband, father, and grandfather",
        image: '',
        widget: gridChooseTemplate3(
          "Late person name",
          "mmmm d, yyyy",
          "mmmm d, yyyy",
          "Beloved husband, father, and grandfather",
          const Image(image: AssetImage("path/to/image")),
        ),
      ),

      TemplateData(
        latePerson: "John Doe",
        dob: "January 1, 1980",
        dod: "February 28, 2024",
        desc: "Please accept my deepest condolences for the loss of John.\n\nYou are in my thoughts and heartfell prayers. John will be dearly missed by all.",
        image: '',
        widget: gridChooseTemplate4(
          "John Doe",
          "mmmm d, yyyy",
          "mmmm d, yyyy",
          "Please accept my deepest condolences for the loss of John.\n\nYou are in my thoughts and heartfell prayers. John will be dearly missed by all.",
          const Image(image: AssetImage("path/to/image")),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose template"),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 10,
            // childAspectRatio: 1
            crossAxisSpacing: 10,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditTemplatePage(
                          // selectedWidget: gridTemplates[index],
                          index : index,
                          templateData: templateDataList[index],
                          onEditComplete: (updatedData){
                            setState(() {
                              templateDataList[index] = updatedData;
                            });
                          },
                          )));
                },
                child: templateDataList[index].widget);
          }),
    );
  }
}

// grid template 1
Widget gridChooseTemplate1(String latePerson, String dob, String dod, String desc, Image image) {
  return Card(
    color: const Color.fromARGB(255, 249, 249, 249),
    child: Stack(
      children: [
        const Positioned(
            right: -50,
            top: -12,
            child: Image(
                height: 70,
                image: AssetImage("assests/images/flowerbush.png"))),
        const Positioned(
            left: -50,
            bottom: -12,
            child: RotatedBox(
              quarterTurns: 2,
              child: Image(
                  height: 70,
                  image: AssetImage("assests/images/flowerbush.png")),
            )),
        Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: Text(
              "In loving memory of",
              style: GoogleFonts.islandMoments(
                  fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )),
        Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: CircleAvatar(
              radius: 55,
              // backgroundImage: AssetImage("assests/images/budo.jpg"),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  // image: DecorationImage(
                  //     image: image)
                ),
                // child: Image.file(
                // File(widget.image!.path),
                // fit: BoxFit.cover,
                // ),
              ),
            )),
        Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Container(
              height: 150,
              child: const Image(
                  image: AssetImage("assests/images/roundflower.png")),
            )),
        Positioned(
          top: 210,
          right: 0,
          left: 0,
          child: Text(
            latePerson,
            style: GoogleFonts.islandMoments(
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          top: 250,
          right: 0,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$dob${"  -  "}",
                style: GoogleFonts.julee(),
                textAlign: TextAlign.center,
              ),
              Text(
                dod,
                style: GoogleFonts.julee(),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Positioned(
          top: 272,
          right: 0,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                desc,
                style: GoogleFonts.julee(height: 0.8),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

//grid template 2
Widget gridChooseTemplate2(String latePerson, String dob, String dod, String desc, Image image) {
  return Card(
    color: const Color.fromARGB(255, 196, 251, 249),
    child: Stack(
      children: [
        const Positioned(
            right: 0,
            bottom: 0,
            child: Image(
                height: 90,
                image: AssetImage("assests/images/bouquet-flowers.png"))),
        const Positioned(
            left: 0,
            top: 0,
            child: RotatedBox(
              quarterTurns: 2,
              child: Image(
                  height: 90,
                  image: AssetImage("assests/images/bouquet-flowers.png")),
            )),
        Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: Text(
              "In loving memory of",
              style: GoogleFonts.islandMoments(
                  fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )),
        Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: CircleAvatar(
              radius: 55,
              // backgroundImage: AssetImage("assests/images/budo.jpg"),
              child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assests/images/budo.jpg"))),
              ),
            )),
        Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Container(
              height: 150,
              child:
                  const Image(image: AssetImage("assests/images/flowerok.png")),
            )),
        Positioned(
          top: 210,
          right: 0,
          left: 0,
          child: Text(
            latePerson,
            style: GoogleFonts.islandMoments(
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          top: 250,
          right: 0,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                dob,
                style: GoogleFonts.julee(),
                textAlign: TextAlign.center,
              ),
              const Text("  -  "),
              Text(
                dod,
                style: GoogleFonts.julee(),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Positioned(
          top: 272,
          right: 0,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                desc,
                style: GoogleFonts.julee(height: 0.8),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget gridChooseTemplate3(String latePerson, String dob, String dod, String desc, Image image) {
  return Stack(
    children: [
      Card(
        color: Colors.blueGrey[100],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(50),
                        image: const DecorationImage(
                            image: AssetImage("assests/images/budo.jpg"),
                            fit: BoxFit.cover)),
                    // padding: EdgeInsets.all(8.0),
                    // child: Image(image: AssetImage("assests/images/budo.jpg"), fit: BoxFit.cover,),
                  ),
                  Image.asset(
                    "assests/images/line_design.png",
                    width: 100,
                  )
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "In Loving Memory of",
                      style: GoogleFonts.julee(),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      latePerson.toUpperCase(),
                      style: GoogleFonts.koulen(fontSize: 22, fontWeight: FontWeight.bold),
                      // style: TextStyle(
                      //   fontSize: 22,
                      //   fontWeight: FontWeight.bold
                      // ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: Text("$dob - $dod"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      desc,
                      textAlign: TextAlign.center,
                      // style: GoogleFonts.julee(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      const Positioned(
        top: 5,
        left: 5,
        height: 100,
        child: RotatedBox(
          quarterTurns: 2,
          child: Image(
            image: AssetImage("assests/images/borderr.png"),
          ),
        ),
      ),
      const Positioned(
        bottom: 5,
        right: 5,
        height: 100,
        child: Image(
          image: AssetImage("assests/images/borderr.png"),
        ),
      ),
    ],
  );
}

//template 24
Widget gridChooseTemplate4(String latePerson, String dob, String dod, String desc, Image image) {
  return Card(
    color: Colors.black,
    child: Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey, width: 6),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  desc,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 30,),
                const Text(
                  "Yours,",
                  style: TextStyle(color: Colors.white),
                ),
                const Text(
                  "Jagadish Poudel",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Rest in Peace", style: TextStyle(
                color: Colors.white, fontSize: 16
              ),),
              const SizedBox(height: 30,),
              Container(
                child: Stack(
                  children: [Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationZ(
                    math.pi / 4,
                  ),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        width: 3,
                        color: Colors.blueGrey,
                      ),
                    )),
                    ),
                    const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assests/images/budo.jpg"),
                ),
                    ]
                ),
              ),const SizedBox(height: 30,), Text(latePerson, style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold,
              ),),
              
            ],
          ),
          const SizedBox(width: 30,)
        ],
      ),
    ),
  );
}
