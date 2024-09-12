import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wallpaper_api/model_class/model.dart';
import 'package:wallpaper_api/page/full_Screen.dart';
import 'package:wallpaper_api/services/services.dart';

class SecondPage extends StatefulWidget {
  final String dis;
  final String imgurl;
  final String name;

  SecondPage(
      {super.key, required this.dis, required this.imgurl, required this.name});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'WallPics',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(widget.imgurl))),
              ),
              Positioned(
                  top: 20,
                  left: 330,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.7),
                    ),
                    height: 45,
                    width: 45,
                    child: InkWell(
                      onTap: () {
                        Get.to(() => FullScreenPage(imageUrl:widget.imgurl));
                      },
                      child: Icon(
                        Icons.fullscreen,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ))
            ]),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Gap(10),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.dis,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),

                      ],
                    ),
                  ),
                  Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          Gap(8),
                          Text(
                            'Phoptographer',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey.withOpacity(0.2)),
                              child: Text(
                                'DreamLense Production',
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold),
                              ))
                        ],
                      )
                    ],
                  ),
                  Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                          Gap(8),
                          Text(
                            widget.name,
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                              child: Text(
                                'pixel',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold),
                              ))
                        ],
                      )
                    ],
                  ),
                  Gap(10),
                ],
              ),
            ),
            SizedBox(
              width:200,  // Set the width here
              child: MaterialButton(
                height: 50,
                color: Colors.yellow,
                onPressed: () {
                  WallpaperServices().openUrl(widget.imgurl);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Download", style: TextStyle(fontSize: 20)),
                    Icon(Icons.download),
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
