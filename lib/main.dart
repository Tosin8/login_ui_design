import 'package:flutter/material.dart';

import 'package:flutter/gestures.dart'; 
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MaterialApp(title: 'Flutter Login Ui', home: MyCustomLoginUI()));
}

class MyCustomLoginUI extends StatefulWidget {
  const MyCustomLoginUI({Key? key}) : super(key: key);

  @override
  State<MyCustomLoginUI> createState() => _MyCustomLoginUIState();
}

class _MyCustomLoginUIState extends State<MyCustomLoginUI>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: .7, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    )
      ..addListener(
        () {
          setState(() {});
        },
      )
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff292C31),
      body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: SizedBox(
                height: height,
                child: Column(
                  children: [
                    const Expanded(child: SizedBox()),
                    Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            SizedBox(),
                            Text('Sign In',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white), 
                                    )),                           const SizedBox(),

                                    component1(Icons.account_circle_outlined, 'Username', 
                                    false, false), 
                                    component1(Icons.email_outlined, 'Email...', false, true),
                                    component1(Icons.lock_outlined, 'Password', true, false),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        RichText(
                                          text: const TextSpan(
                                            text: 'Forgot Password ',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                    
                                          ), 
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              HapticFeedback.lightImpact();
                                              Fluttertoast.showToast(
                                                  msg: 'Forgot Password',
                                                  toastLength: Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.black,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);
          })        ), 
          SizedBox(width: width/10), 
          RichText(
            text: const TextSpan(text: 'Create a new Account', style: TextStyle(
              color: Colors.white,
               fontSize: 15,
                fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()
                ..onTap = () {
                  HapticFeedback.lightImpact();
                  Fluttertoast.showToast(
                      msg: 'Create a new Account',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 16.0
                      );
                }),
          ),
          )], 
                ), 
                 
            )
                                              ), 
                                       
    ),
    );
    
                         
  }
}
