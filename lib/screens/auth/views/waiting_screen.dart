import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trubuy/components/tap_widget.dart';
import 'package:trubuy/extension/app_extension.dart';
import 'package:trubuy/route/screen_export.dart';

class WaitingScreen extends StatefulWidget {
  const WaitingScreen({super.key});

  @override
  State<WaitingScreen> createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.red)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Wait For 24 Hour Activation/Deactivation After Activation Upload Products",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ),

          Positioned(
            top: 50.h,
            right: 20.w,
            child: TapWidget(
              onTap: (){
                Navigator.pushReplacementNamed(context, logInScreenRoute) ;
                 //context.pushScreen(nextScreen: LoginScreen()) ;

              },
              child: Text(
                "Logout",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          )
        ],
      ),
    );
  }
}
