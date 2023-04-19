import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/utils/AppColors.dart';
import 'package:flutter_complete_guide/model/splashmodel.dart';

class SplashScreen1 extends StatefulWidget{

  const SplashScreen1({Key? key}) : super(key: key);


  @override
  State<SplashScreen1> createState() => _onSplashScreen1State();


}

class _onSplashScreen1State extends State<SplashScreen1>{


    int currentIndex = 0;

    List<SplashModel> allinonboardlist = [
      SplashModel(
          "There are many variations of",
    "passages of Lorem Ipsum available.All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary",
          "Prepard by exparts",1),
      SplashModel(
          "There are many variations of passages of Lorem Ipsum available. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary",
          "Delivery to your home","assets/images/ic_splash1.png",1),
      SplashModel(
          "assets/images/ic_splash1.png",
          "There are many variations of passages of Lorem Ipsum available. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary",
          "Enjoy with everyone",1),
    ];

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: Text(
        //     "Food Express",
        //     style: TextStyle(color: AppColors.appColor),
        //   ),
        //   backgroundColor: AppColors.t,
        // ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemCount: allinonboardlist.length,
                itemBuilder: (context, index) {
                  return PageBuilderWidget(
                      title: allinonboardlist[index].title,
                      description: allinonboardlist[index].description,
                      imgurl: allinonboardlist[index].localImageSrc);
                }),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.25,
              left: MediaQuery.of(context).size.width * 0.44,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  allinonboardlist.length,
                      (index) => buildDot(index: index),
                ),
              ),
            ),
            currentIndex < allinonboardlist.length - 1
                ? Positioned(
              bottom: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width,


              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.appColor,

                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              bottomLeft:Radius.circular(20.0) ,
                              topLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0))),
                    ),
                    child: const Text(
                      "Skip",
                      style: TextStyle(fontSize: 18, color: AppColors.colorWhite),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.appColor,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              bottomLeft:Radius.circular(20.0) ,
                              topLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0))),
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(fontSize: 18, color: AppColors.colorWhite),
                    ),
                  )
                ],
              ),
            )
                : Positioned(
              bottom: MediaQuery.of(context).size.height * 0.2,
              left: MediaQuery.of(context).size.width * 0.33,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.appColor,


                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.0),
                            bottomLeft:Radius.circular(20.0) ,
                            topLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0))),

                ),
                child: const Text(
                  "Get Started",
                  style: TextStyle(fontSize: 18, color: AppColors.colorWhite),
                ),
              ),
            ),
          ],
        ),
      );
    }

    AnimatedContainer buildDot({int? index}) {
      return AnimatedContainer(
        duration: AppColors.kAnimationDuration,
        margin: const EdgeInsets.only(right: 5),
        height: 6,
        width: currentIndex == index ? 20 : 6,
        decoration: BoxDecoration(
          color: currentIndex == index ? AppColors.appColor : const Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3),
        ),
      );
    }
}

class PageBuilderWidget extends StatelessWidget {
  String title;
  String description;
  String imgurl;
  PageBuilderWidget(
      {Key? key,
        required this.title,
        required this.description,
        required this.imgurl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Image.asset(imgurl),
          ),
          const SizedBox(
            height: 20,
          ),
          //Title Text
          Text(title,
              style: const TextStyle(
                  color: AppColors.appColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w700)),
          const SizedBox(
            height: 20,
          ),
          //description
          Text(description,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                color: AppColors.appColor,
                fontSize: 14,
              ))
        ],
      ),
    );
  }
}
