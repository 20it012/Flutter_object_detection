import 'package:flutter/material.dart';
import 'package:flutter_object_detection/HomePage.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:page_transition/page_transition.dart';

class MySplashPage extends StatefulWidget {
  // const MySplashPage({Key? key}) : super(key: key);

  @override
  State<MySplashPage> createState() => _MySplashPageState();
}

class _MySplashPageState extends State<MySplashPage> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 3000,
      nextScreen: HomePage(),
      splash: Image.asset("assets/back.jpg"),
        // splashIconSize: 9000,
        // splashTransition: SplashTransition.fadeTransition,
        // pageTransitionType: PageTransitionType.scale,
        // backgroundColor: Colors.blue
      // fit: BoxFit.cover,
      // height: double.infinity,
      // width: double.infinity,
      // alignment: Alignment.center,
      //
      // useLoader: true,
      // loaderColor: Colors.pink,
      // loadingText: const Text("loading...", style: TextStyle(color: Colors.white),),
    );
  }
}
