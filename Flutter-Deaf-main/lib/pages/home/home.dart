import 'package:app_deaf/pages/coures.dart';
import 'package:app_deaf/routers.dart';
import 'package:app_deaf/routers.dart';
import 'package:app_deaf/utils/app_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomaPage extends StatefulWidget {
  const HomaPage({super.key});

  @override
  State<HomaPage> createState() => _HomaPageState();
}

class _HomaPageState extends State<HomaPage> {
  int navindex = 0;
  @override
  Widget build(BuildContext context) {
    return GetX(
        init: AppController(),
        builder: (AppController appController) {
          print('at home statuslearn -->${appController.startlearn}');
          return Scaffold(
            // backgroundColor: Color(0xFFFFB200),
            appBar: AppBar(
              leading: appController.startlearn.value
                  ? IconButton(
                      onPressed: () {
                        appController.startlearn.value = false;
                      },
                      icon: const Icon(Icons.arrow_back))
                  : null,
              backgroundColor: Color(0xFFFFB200),
              title: Text(
                appController.startlearn.value ? 'เริ่มเรียน' : "หน้าแรก",
                style: TextStyle(color: Colors.black),
              ),
            ),

            body: appController.startlearn.value ? CouresPage() : CurrendHome(),
          );
        });
  }

  void _handleCilkCoure() {
    Navigator.pushNamed(context, AppRoute.coure);
    // Navigator.pushNamed(context, AppRoute.navbars);
  }
}

class CurrendHome extends StatelessWidget {
  const CurrendHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(
        init: AppController(),
        builder: (AppController appController) {
          print('at currend --> ${appController.startlearn} ');
          return Center(
            child: Container(
              // btn เริ่มเรียน
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // image logo

                  CircleAvatar(
                    radius: 80,
                    foregroundImage: AssetImage('assets/images/logodeaf.jpg'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //  btn เริ่มเรียน
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF277BC0),
                        shape: const StadiumBorder(),

                        minimumSize: Size(120, 50), // background

                        // foreground
                      ),
                      onPressed: () {
                        appController.startlearn.value = true;
                      },
                      child: Text(
                        'เริ่มเรียน',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
          );
        });
  }
}
