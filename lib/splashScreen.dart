import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rip_card_maker/pages/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 2), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> const HomePagee() ));
    });
  } 

  @override
  void dispose() {
    
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays:SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.black,
            Colors.black,
            Colors.black,
            Colors.black,
            Colors.amber
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight)
        ),
          child: Padding(
            padding:  EdgeInsets.fromLTRB(0,size.height*0.4,0,0),
            child: Column(
              children: [
                const Center(
                  child: Text("Rip Card Maker", style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber
                  ),)
                ),
                // Image.asset("assests/images/hardiktext.png",
                // height: size.height*0.15,),
                Image.asset("assests/images/diyosplash.png",
                height: size.height*0.2,)
              ],
            ),
          ),
      ),
    );
  }
}