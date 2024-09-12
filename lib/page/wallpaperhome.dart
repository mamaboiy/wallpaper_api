import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:wallpaper_api/model_class/model.dart';
import 'package:wallpaper_api/page/Details_page.dart';

import '../services/services.dart';

class Wallpaperhome extends StatefulWidget {
  const Wallpaperhome({super.key});

  @override
  State<Wallpaperhome> createState() => _WallpaperhomeState();
}

class _WallpaperhomeState extends State<Wallpaperhome> {
  List<Tab> catagories = [
    Tab(
      text: 'CITY',
    ),
    Tab(
      text: 'CAR',
    ),
    Tab(
      text: 'ANIMAL',
    ),
    Tab(
      text: 'NATURE',
    ),
    Tab(
      text: 'FLOWER',
    ),
    Tab(
      text: 'GUNS',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: catagories.length,
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text(
                "BACKDROPS",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow),
              ),
              centerTitle: true,
              bottom: TabBar(
                tabs: catagories,
                indicator: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(30)),
                unselectedLabelColor: Colors.white,
                isScrollable: true,
                indicatorWeight: 0,
                dividerColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.black,
                physics: BouncingScrollPhysics(),
              )),
          body: TabBarView(
            children: catagories.map((tab) => CustomGridview(tab)).toList(),
          )),
    );
  }

  FutureBuilder<List<WallpaperClass>> CustomGridview(Tab tab) {
    return FutureBuilder<List<WallpaperClass>>(
        future: WallpaperServices().fetchWallpaperData(tab.text!.toLowerCase()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No data found'));
          } else {
            return MasonryGridView.count(
              itemCount: snapshot.data!.length,
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              itemBuilder: (context, index) {
                final photos = snapshot.data![index];
                return InkWell(
                  onTap: (){
                    Get.to(SecondPage(dis: photos.dis,imgurl: photos.imgurl,name: photos.name,),);
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: (index % 3 + 2) * 100,
                    decoration: BoxDecoration(
                        color: Color(
                            int.parse(photos.color.replaceAll('#', '0xff'))),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: NetworkImage('${photos.imgurl}'),
                            fit: BoxFit.cover)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${photos.name}',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
        });
  }
}
