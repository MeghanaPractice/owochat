import 'package:flutter/material.dart';
import 'package:owo_chat/constants.dart';
import 'package:owo_chat/screens/login_screen.dart';
import 'package:owo_chat/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:owo_chat/components.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation; //for curved

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 1,
      ),
    );
    animation = CurvedAnimation(
        parent: controller,
        curve: Curves.easeOutCirc); //apply animation onto controller

    controller.forward();

    controller.addStatusListener((status) {
      print(status);
    });

    controller.addListener(() {
      setState(() {}); //verifies to change state
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1DDBE2).withOpacity(controller.value),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'cat',
                  child: Container(
                    child: Image.asset('images/logo1.png'),
                    height: animation.value * 100,
                  ),
                ),
                AnimatedTextKit(repeatForever: true, animatedTexts: [
                  FlickerAnimatedText(
                    'OwO CHAT',
                    textStyle: kTextAnimationStyle,
                  ),
                ]),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              clr: Color(0xFF03EC9A),
              lble: 'Log In',
              onPress: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              clr: Color(0xFF4877EF),
              lble: 'Register',
              onPress: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
