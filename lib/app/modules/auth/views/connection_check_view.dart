// ignore_for_file: file_names, always_use_package_imports

import 'dart:async';
import 'dart:io';

import 'package:atelyam/app/modules/home/views/bottom_nav_bar.dart';
import 'package:atelyam/constants/customWidget/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';

class ConnectionCheckView extends StatefulWidget {
  const ConnectionCheckView({super.key});

  @override
  _ConnectionCheckViewState createState() => _ConnectionCheckViewState();
}

class _ConnectionCheckViewState extends State {
  @override
  void initState() {
    super.initState();
    checkConnection();
  }

  GetStorage storage = GetStorage();
  void checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result.first.rawAddress.isNotEmpty) {
        await Future.delayed(const Duration(seconds: 4), () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const BottomNavBar();
              },
            ),
          );
        });
      }
    } on SocketException catch (_) {
      _showDialog();
    }
  }

  void _showDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: const RoundedRectangleBorder(borderRadius: borderRadius20),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                padding: const EdgeInsets.only(top: 100, left: 15, right: 15),
                decoration: const BoxDecoration(color: Colors.white, borderRadius: borderRadius20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'noConnection1'.tr,
                      style: const TextStyle(fontSize: 24.0, color: kPrimaryColor, fontFamily: gilroyMedium),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      child: Text(
                        'noConnection2'.tr,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.black, fontFamily: gilroyMedium, fontSize: 16.0),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Future.delayed(const Duration(milliseconds: 1000), () => checkConnection());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        shape: const RoundedRectangleBorder(borderRadius: borderRadius10),
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                      ),
                      child: Text(
                        'noConnection3'.tr,
                        style: const TextStyle(fontSize: 18, color: Colors.white, fontFamily: gilroyMedium),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                maxRadius: 70,
                minRadius: 60,
                child: Container(
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                  child: ClipRRect(
                    child: Image.asset('assets/icons/noconnection.gif', fit: BoxFit.fill),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: backgroundColor, body: Center(child: Lottie.asset(loadingLottie, width: 70, height: 70)));
  }
}
