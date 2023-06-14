import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/utils/AppColors.dart';
import 'package:flutter_svg/svg.dart';

class HomePages extends StatefulWidget {
  @override
  _HomePages createState() => _HomePages();
}

class _HomePages extends State<HomePages> {
  late PageController _pageController;

  // Declare and Initialize the PageController- Congratulation screen
  late PageController _pageControllerCongratulation;

  // the index of the current page
  int _activePage = 0;
  final List<Widget> _congratulationpages = [
    congratulationPagesOne(),
    congratulationPagesTwo()
  ];

  int _activePagePlayofWeekpages = 0;
  late PageController _playofweekpagesController;
  final List<Widget> _playofweekpages = [
    playofweekPagesOne(),
    playofweekPagesOne(),
    playofweekPagesOne(),
  ];

  late PageController _pageControllerNewsAnnouncement;

  int _activeNewsAnnouncementPage = 0;
  final List<Widget> _newsAnnouncementPages = [
    newsAnnouncementPagesOne(),
    newsAnnouncementPagesOne(),
    newsAnnouncementPagesOne(),
  ];

  int activePage = 1;
  List<String> images = [
    "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
    "https://wallpaperaccess.com/full/2637581.jpg",
    "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
    _pageControllerCongratulation =
        PageController(viewportFraction: 1, initialPage: 1);
    _playofweekpagesController =
        PageController(viewportFraction: 0.8, initialPage: 1);
    _pageControllerNewsAnnouncement =
        PageController(viewportFraction: 0.9, initialPage: 1);
  }

  // Dispose the PageController
  @override
  void dispose() {
    _pageController.dispose();
    _pageControllerCongratulation.dispose();
    _playofweekpagesController.dispose();
    _pageControllerNewsAnnouncement.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderData(),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  carouselPageView(),
                  scoreCardView(),
                  congratulationSlider(),
                  playOFWeekSlider(),
                  newsAnnouncementSlider(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  congratulationSlider() {
    return Container(
      child: SizedBox(
        child: Column(
          children: [
            Container(
              height: 404,
              width: MediaQuery.of(context).size.width,
              color: AppColors.lightgreenbg,
              child: PageView.builder(
                allowImplicitScrolling: true,
                controller: _pageControllerCongratulation,
                pageSnapping: true,
                itemCount: _congratulationpages.length,
                onPageChanged: (int page) {
                  setState(() {
                    _activePage = page;
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  print(
                      "onPageChanged => $index, ${index % _congratulationpages.length} ");
                  return _congratulationpages[
                      index % _congratulationpages.length];
                },
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 100,
              child: Container(
                padding: EdgeInsets.only(bottom: 25),
                color: AppColors.lightgreenbg,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                      _congratulationpages.length,
                      (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: InkWell(
                              onTap: () {
                                // _pageControllerCongratulation.animateToPage(
                                //     index,
                                //     duration: const Duration(milliseconds: 300),
                                //     curve: Curves.easeIn);
                              },
                              child: CircleAvatar(
                                radius: 8,
                                backgroundColor: _activePage == index
                                    ? AppColors.colorWhite
                                    : Colors.grey,
                              ),
                            ),
                          )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  playOFWeekSlider() {
    return Container(
      child: SizedBox(
        child: Column(
          children: [
            Container(
              height: 325,
              width: MediaQuery.of(context).size.width,
              color: AppColors.colorWhite,
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Play of The Week',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.colorBlack),
                      ),
                      Text(
                        "View all",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.appColor),
                      ),
                    ],
                  ),
                  Expanded(
                    child: PageView.builder(
                      allowImplicitScrolling: true,

                      controller: _playofweekpagesController,
                      // controller: _pageController,
                      pageSnapping: true,
                      itemCount: _playofweekpages.length,

                      onPageChanged: (int page) {
                        setState(() {
                          _activePagePlayofWeekpages = page;
                        });
                      },
                      itemBuilder: (BuildContext context, int index) {
                        print(
                            "onPageChanged => $index, ${index % _playofweekpages.length} ");
                        return _playofweekpages[
                            index % _playofweekpages.length];
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  newsAnnouncementSlider() {
    return Container(
      child: SizedBox(
        child: Column(
          children: [
            Container(
              height: 510,
              width: MediaQuery.of(context).size.width,
              color: AppColors.colorFullYellow,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: 10, left: 10, right: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Newa & Announcement',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.colorBlack),
                        ),
                        Text(
                          "View all",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.appColor),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: PageView.builder(
                      allowImplicitScrolling: true,
                      controller: _pageControllerNewsAnnouncement,
                      pageSnapping: true,
                      itemCount: _newsAnnouncementPages.length,
                      onPageChanged: (int page) {
                        setState(() {
                          _activeNewsAnnouncementPage = page;
                        });
                      },
                      itemBuilder: (BuildContext context, int index) {
                        print(
                            "onPageChanged => $index, ${index % _newsAnnouncementPages.length} ");
                        return _newsAnnouncementPages[
                            index % _newsAnnouncementPages.length];
                      },
                    ),
                    flex: 3,
                  ),
                ],
              ),
            )
            // Container(
            //   padding: EdgeInsets.all(10),
            //   height: 400,
            //   width: MediaQuery.of(context).size.width,
            //   color: AppColors.colorFullYellow,
            //   margin: EdgeInsets.only(top: 10, left: 10, right: 10,bottom: 10),
            //   child: Column(
            //     children: [
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text(
            //             'Newa & Announcement',
            //             style: TextStyle(
            //                 fontSize: 18,
            //                 fontWeight: FontWeight.bold,
            //                 color: AppColors.colorBlack),
            //           ),
            //           Text(
            //             "View all",
            //             style: TextStyle(
            //                 fontSize: 18,
            //                 fontWeight: FontWeight.bold,
            //                 color: AppColors.appColor),
            //           ),
            //         ],
            //       ),
            //       Expanded(
            //         child: PageView.builder(
            //           allowImplicitScrolling: true,
            //           controller: _pageControllerNewsAnnouncement,
            //           pageSnapping: true,
            //           itemCount: _newsAnnouncementPages.length,
            //           onPageChanged: (int page) {
            //             setState(() {
            //               _activeNewsAnnouncementPage = page;
            //             });
            //           },
            //           itemBuilder: (BuildContext context, int index) {
            //             print(
            //                 "onPageChanged => $index, ${index % _newsAnnouncementPages.length} ");
            //             return _newsAnnouncementPages[
            //                 index % _newsAnnouncementPages.length];
            //           },
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  scoreCardView() {
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12),
      child: SizedBox(
        child: Column(
          children: [
            //First ROW
            Row(
              children: [
                //Open Matches 1
                Container(
                  height: 105,
                  width: 175,
                  margin: const EdgeInsets.all(8),
                  child: Card(
                    color: AppColors.colorLightYellow,
                    elevation: 5,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 15, left: 5),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 7,
                                child: Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        "12",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: AppColors.colorWhite),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: InkWell(
                                  child: SvgPicture.asset(
                                    height: 28,
                                    width: 28,
                                    'assets/images/letsdink.svg',
                                    color: AppColors.colorWhite,
                                  ),
                                  onTap: () => {print("letsdink list")},
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 10, left: 5),
                          child: const Text(
                            "Open Matches",
                            style: TextStyle(
                                fontSize: 15, color: AppColors.colorWhite),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //Scheduled Matches
                Container(
                  height: 105,
                  width: 175,
                  margin: EdgeInsets.all(0),
                  child: Card(
                    color: AppColors.colorRed,
                    elevation: 5,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 15, left: 5),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 7,
                                child: Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        "8",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: AppColors.colorWhite),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: InkWell(
                                  child: SvgPicture.asset(
                                    height: 28,
                                    width: 28,
                                    'assets/images/ic_calendar_white.svg',
                                    color: AppColors.colorWhite,
                                  ),
                                  onTap: () =>
                                      {print("ic_calendar_white list")},
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 10, left: 5),
                          child: const Text(
                            "Scheduled Matches",
                            style: TextStyle(
                                fontSize: 15, color: AppColors.colorWhite),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            //Second ROW
            Row(
              children: [
                //Upcoming Events 3
                Container(
                  height: 105,
                  width: 175,
                  margin: const EdgeInsets.all(8),
                  child: Card(
                    color: AppColors.colorLightRed,
                    elevation: 5,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 15, left: 5),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 7,
                                child: Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        "32",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: AppColors.colorWhite),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: InkWell(
                                  child: SvgPicture.asset(
                                    height: 28,
                                    width: 28,
                                    'assets/images/events.svg',
                                    color: AppColors.colorWhite,
                                  ),
                                  onTap: () => {print("events list")},
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 10, left: 5),
                          child: const Text(
                            "Upcoming Events",
                            style: TextStyle(
                                fontSize: 15, color: AppColors.colorWhite),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //Recently Joined 4
                Container(
                  height: 105,
                  width: 175,
                  margin: EdgeInsets.all(0),
                  child: Card(
                    color: AppColors.colorBlue,
                    elevation: 5,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 15, left: 5),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 7,
                                child: Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        "15",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: AppColors.colorWhite),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: InkWell(
                                  child: SvgPicture.asset(
                                    height: 28,
                                    width: 28,
                                    'assets/images/letsdink.svg',
                                    color: AppColors.colorWhite,
                                  ),
                                  onTap: () =>
                                      {print("ic_calendar_white list")},
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 10, left: 5),
                          child: const Text(
                            "Recently Joined",
                            style: TextStyle(
                                fontSize: 15, color: AppColors.colorWhite),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  HeaderData() {
    return Card(
      elevation: 2,
      child: Container(
        height: 80,
        // width: double.infinity,
        color: AppColors.colorWhite,
        child: Container(
          child: Row(
            children: [
              Expanded(
                flex: 7,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 5),
                      child: Image.asset(
                        height: 50,
                        width: 50,
                        'assets/images/ic_profile.png',
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 7),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text.rich(
                            textScaleFactor: 1.1,
                            TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Tennessee, Nashville',
                                  style: TextStyle(
                                      fontSize: 13, color: AppColors.appColor),
                                ),
                                const TextSpan(
                                  text: '   ',
                                  style: TextStyle(
                                      fontSize: 13, color: AppColors.appColor),
                                ),
                                WidgetSpan(
                                  child: InkWell(
                                    child: SvgPicture.asset(
                                        'assets/images/ic_path.svg'),
                                    onTap: () => {
                                      print("direction click"),
                                    },
                                  ),
                                ),
                                const TextSpan(
                                  text: "\n3 miles",
                                  style: TextStyle(
                                      fontSize: 13, color: AppColors.colorGray),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  child: SvgPicture.asset(
                    height: 28,
                    width: 28,
                    'assets/images/ic_alert_home.svg',
                  ),
                  onTap: () => {print("Notification list")},
                ),
              ),
              Expanded(
                flex: 2,
                child: InkWell(
                  child: SvgPicture.asset(
                    height: 28,
                    width: 28,
                    'assets/images/ic_shake.svg',
                  ),
                  onTap: () => {print("Shake phone")},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  carouselPageView() {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
              itemCount: images.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                bool active = pagePosition == activePage;
                return slider(images, pagePosition, active);
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: indicators(images.length, activePage),
        )
      ],
    );
  }
}

AnimatedContainer slider(images, pagePosition, active) {
  double margin = active ? 3 : 3;

  return AnimatedContainer(
    duration: Duration(milliseconds: 500),
    curve: Curves.easeInOutCubic,
    margin: EdgeInsets.all(margin),
    decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(images[pagePosition]))),
  );
}

imageAnimation(PageController animation, images, pagePosition) {
  return AnimatedBuilder(
    animation: animation,
    builder: (context, widget) {
      print(pagePosition);

      return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 200,
        child: widget,
      );
    },
    child: Container(
      margin: EdgeInsets.all(0),
      child: Image.network(images[pagePosition]),
    ),
  );
}

List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: EdgeInsets.all(5),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          color:
              currentIndex == index ? AppColors.appColor : AppColors.colorGray,
          shape: BoxShape.circle,
          border: BorderDirectional()),
    );
  });
}

// Page One
class congratulationPagesOne extends StatelessWidget {
  const congratulationPagesOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 30, left: 15, right: 15),
            child: Text.rich(
              textScaleFactor: 1.5,
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Congratulations! ',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.colorWhite),
                  ),
                  TextSpan(
                    text: "\nOn Improving Skill Level.",
                    style: TextStyle(fontSize: 12, color: AppColors.colorWhite),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            height: 263,
            width: 370,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 15,
              color: AppColors.colorWhite,
              child: Column(
                children: [
                  Flexible(
                    child: Container(
                      child: Row(
                        children: [
                          //profile UI
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10, top: 15),
                                  child: Image.asset(
                                    height: 110,
                                    width: 65,
                                    'assets/images/ic_profile.png',
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // profile UI header
                          Expanded(
                            flex: 7,
                            child: Container(
                              margin: EdgeInsets.only(left: 1, top: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Ben Johns",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                        color: AppColors.btnColor),
                                  ),
                                  SizedBox(height: 2),
                                  SvgPicture.asset(
                                    height: 20,
                                    width: 20,
                                    'assets/images/ic_players.svg',
                                  ),
                                  Text.rich(
                                    textScaleFactor: 1.1,
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Location: ',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: AppColors.btnColor),
                                        ),
                                        TextSpan(
                                          text: "Carmel Valley,CA",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                              color: AppColors.btnColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10, top: 5),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          child: SvgPicture.asset(
                                            height: 15,
                                            width: 15,
                                            'assets/images/ic_chat.svg',
                                          ),
                                          onTap: () => {print("ic_like")},
                                        ),
                                        const SizedBox(width: 10),
                                        InkWell(
                                          child: SvgPicture.asset(
                                            height: 15,
                                            width: 15,
                                            'assets/images/ic_adduser.svg',
                                          ),
                                          onTap: () => {print("ic_like")},
                                        ),
                                        const SizedBox(width: 10),
                                        InkWell(
                                          child: SvgPicture.asset(
                                            height: 15,
                                            width: 15,
                                            'assets/images/ic_addin_group.svg',
                                          ),
                                          onTap: () => {print("ic_like")},
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    flex: 5,
                  ),
                  // skill level UI
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Old Skill Level
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.colorDropdown,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            height: 36,
                            width: 142,
                            alignment: Alignment.center,
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Old Skill Level:',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.purewhite),
                                  ),
                                  const TextSpan(
                                    text: "3.0  ",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.colorWhite,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  WidgetSpan(
                                    alignment: PlaceholderAlignment.middle,
                                    child: InkWell(
                                      child: SvgPicture.asset(
                                          'assets/images/ic_old_skill_level.svg'),
                                      onTap: () => {
                                        print("direction click"),
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),

                          SvgPicture.asset(
                            height: 17,
                            width: 17,
                            'assets/images/ic_download_setting.svg',
                          ),
                          //New skill level
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.appColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            height: 36,
                            width: 142,
                            alignment: Alignment.center,
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'New Skill Level:',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.purewhite),
                                  ),
                                  const TextSpan(
                                    text: "4.0  ",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.colorWhite,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  WidgetSpan(
                                    alignment: PlaceholderAlignment.middle,
                                    child: InkWell(
                                      child: SvgPicture.asset(
                                          'assets/images/ic_old_skill_level.svg'),
                                      onTap: () => {
                                        print("direction click"),
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    flex: 4,
                  ),
                  Divider(
                      height: 10,
                      color: AppColors.colorGray,
                      thickness: 1,
                      //thickness of divier line
                      indent: 10,
                      //spacing at the start of divider
                      endIndent: 10),
                  //like and comments UI
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                child: Container(
                                  padding: EdgeInsets.all(4),
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color: AppColors.appColor,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: InkWell(
                                    child: SvgPicture.asset(
                                      height: 10,
                                      width: 10,
                                      'assets/images/ic_white_like.svg',
                                    ),
                                    onTap: () => {print("ic_like")},
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "34 Likes",
                                style: TextStyle(
                                    fontSize: 15, color: AppColors.colorGray),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "19 Comments",
                                style: TextStyle(
                                    fontSize: 15, color: AppColors.colorGray),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    flex: 2,
                    fit: FlexFit.tight,
                  ),
                  Divider(
                      height: 10,
                      color: AppColors.colorGray,
                      thickness: 0.8,
                      //thickness of divier line
                      indent: 0,
                      //spacing at the start of divider
                      endIndent: 0),
                  //like share comments UI
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                child: SvgPicture.asset(
                                  height: 20,
                                  width: 20,
                                  'assets/images/ic_like.svg',
                                ),
                                onTap: () => {print("ic_like")},
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "Like",
                                style: TextStyle(
                                    fontSize: 15, color: AppColors.colorGray),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              InkWell(
                                child: SvgPicture.asset(
                                  height: 20,
                                  width: 20,
                                  'assets/images/ic_comments.svg',
                                ),
                                onTap: () => {print("ic_comments")},
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "Comments",
                                style: TextStyle(
                                    fontSize: 15, color: AppColors.colorGray),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              InkWell(
                                child: SvgPicture.asset(
                                  height: 20,
                                  width: 20,
                                  'assets/images/ic_share.svg',
                                ),
                                onTap: () => {print("ic_share")},
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "Share",
                                style: TextStyle(
                                    fontSize: 15, color: AppColors.colorGray),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    flex: 2,
                    fit: FlexFit.tight,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class newsAnnouncementPagesOne extends StatelessWidget {
  const newsAnnouncementPagesOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10,bottom: 10),
            height: 440,
            width: 370,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 15,
              color: AppColors.colorWhite,
              child: Column(
                children: [
                  Expanded(
                    flex: 10,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child:
                                  Image.network('https://wallpaperaccess.com/full/2637581.jpg'),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          'Aeque porro quisquam est qui dolorem ipsum quia dolor.',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: AppColors.colorBlack,
                                      ),
                                    ),
                                    TextSpan(text: "\n "),
                                    WidgetSpan(
                                      child: SizedBox(height: 20),
                                    ),
                                    TextSpan(
                                      text: "Posted on: Aug 12, 2023 • 9:00 am",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.colorGray,
                                      ),
                                    ),
                                    TextSpan(text: "\n "),
                                    WidgetSpan(
                                      child: SizedBox(height: 20),
                                    ),
                                    TextSpan(
                                      text:
                                          "Lorem ipsum dolor sit amet, conse fouijqtdf ctetury adipis cing elit, sed do eiusmod…",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: AppColors.colorGray,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    // flex: 7,
                  ),
                  //like and comments UI
                  Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  child: Container(
                                    padding: EdgeInsets.all(4),
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        color: AppColors.appColor,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: InkWell(
                                      child: SvgPicture.asset(
                                        height: 10,
                                        width: 10,
                                        'assets/images/ic_white_like.svg',
                                      ),
                                      onTap: () => {print("ic_like")},
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "34 Likes",
                                  style: TextStyle(
                                      fontSize: 15, color: AppColors.colorGray),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "19 Comments",
                                  style: TextStyle(
                                      fontSize: 15, color: AppColors.colorGray),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      flex: 1),
                  Divider(
                      height: 10,
                      color: AppColors.colorGray,
                      thickness: 0.8,
                      //thickness of divier line
                      indent: 0,
                      //spacing at the start of divider
                      endIndent: 0),
                  //like share comments UI
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                child: SvgPicture.asset(
                                  height: 20,
                                  width: 20,
                                  'assets/images/ic_like.svg',
                                ),
                                onTap: () => {print("ic_like")},
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "Like",
                                style: TextStyle(
                                    fontSize: 15, color: AppColors.colorGray),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              InkWell(
                                child: SvgPicture.asset(
                                  height: 20,
                                  width: 20,
                                  'assets/images/ic_comments.svg',
                                ),
                                onTap: () => {print("ic_comments")},
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "Comments",
                                style: TextStyle(
                                    fontSize: 15, color: AppColors.colorGray),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              InkWell(
                                child: SvgPicture.asset(
                                  height: 20,
                                  width: 20,
                                  'assets/images/ic_share.svg',
                                ),
                                onTap: () => {print("ic_share")},
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "Share",
                                style: TextStyle(
                                    fontSize: 15, color: AppColors.colorGray),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    flex: 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class playofweekPagesOne extends StatelessWidget {
  const playofweekPagesOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 263,
            width: 370,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 15,
              color: AppColors.colorWhite,
              child: Column(
                children: [
                  Expanded(
                    flex: 9,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(15.0)),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // flex: 7,
                  ),
                  //like and comments UI
                  Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  child: Container(
                                    padding: EdgeInsets.all(4),
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        color: AppColors.appColor,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: InkWell(
                                      child: SvgPicture.asset(
                                        height: 10,
                                        width: 10,
                                        'assets/images/ic_white_like.svg',
                                      ),
                                      onTap: () => {print("ic_like")},
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "34 Likes",
                                  style: TextStyle(
                                      fontSize: 15, color: AppColors.colorGray),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "19 Comments",
                                  style: TextStyle(
                                      fontSize: 15, color: AppColors.colorGray),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      flex: 2),
                  Divider(
                      height: 10,
                      color: AppColors.colorGray,
                      thickness: 0.8,
                      //thickness of divier line
                      indent: 0,
                      //spacing at the start of divider
                      endIndent: 0),
                  //like share comments UI
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                child: SvgPicture.asset(
                                  height: 20,
                                  width: 20,
                                  'assets/images/ic_like.svg',
                                ),
                                onTap: () => {print("ic_like")},
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "Like",
                                style: TextStyle(
                                    fontSize: 15, color: AppColors.colorGray),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              InkWell(
                                child: SvgPicture.asset(
                                  height: 20,
                                  width: 20,
                                  'assets/images/ic_comments.svg',
                                ),
                                onTap: () => {print("ic_comments")},
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "Comments",
                                style: TextStyle(
                                    fontSize: 15, color: AppColors.colorGray),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              InkWell(
                                child: SvgPicture.asset(
                                  height: 20,
                                  width: 20,
                                  'assets/images/ic_share.svg',
                                ),
                                onTap: () => {print("ic_share")},
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "Share",
                                style: TextStyle(
                                    fontSize: 15, color: AppColors.colorGray),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    flex: 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Page Two
class congratulationPagesTwo extends StatelessWidget {
  const congratulationPagesTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 30, left: 15, right: 15),
            child: Text.rich(
              textScaleFactor: 1.5,
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Congratulations! ',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.colorWhite),
                  ),
                  TextSpan(
                    text: "\nOn Improving Your Recommendation Level.",
                    style: TextStyle(fontSize: 12, color: AppColors.colorWhite),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            height: 263,
            width: 370,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 15,
              color: AppColors.colorWhite,
              child: Column(
                children: [
                  Flexible(
                    child: Container(
                      child: Row(
                        children: [
                          //profile UI
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10, top: 15),
                                  child: Image.asset(
                                    height: 110,
                                    width: 65,
                                    'assets/images/ic_profile.png',
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // profile UI header
                          Expanded(
                            flex: 7,
                            child: Container(
                              margin: EdgeInsets.only(left: 1, top: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Ben Johns",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                        color: AppColors.btnColor),
                                  ),
                                  SizedBox(height: 2),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Skill Level: ',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: AppColors.btnColor),
                                        ),
                                        TextSpan(
                                          text: "5.0 ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                              color: AppColors.btnColor),
                                        ),
                                        WidgetSpan(
                                          alignment:
                                              PlaceholderAlignment.middle,
                                          child: InkWell(
                                            child: SvgPicture.asset(
                                                'assets/images/ic_old_skill_level.svg'),
                                            onTap: () => {
                                              print("direction click"),
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Text.rich(
                                    textScaleFactor: 1.1,
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Location: ',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: AppColors.btnColor),
                                        ),
                                        TextSpan(
                                          text: "Carmel Valley,CA",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                              color: AppColors.btnColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10, top: 5),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          child: SvgPicture.asset(
                                            height: 15,
                                            width: 15,
                                            'assets/images/ic_chat.svg',
                                          ),
                                          onTap: () => {print("ic_like")},
                                        ),
                                        const SizedBox(width: 10),
                                        InkWell(
                                          child: SvgPicture.asset(
                                            height: 15,
                                            width: 15,
                                            'assets/images/ic_adduser.svg',
                                          ),
                                          onTap: () => {print("ic_like")},
                                        ),
                                        const SizedBox(width: 10),
                                        InkWell(
                                          child: SvgPicture.asset(
                                            height: 15,
                                            width: 15,
                                            'assets/images/ic_addin_group.svg',
                                          ),
                                          onTap: () => {print("ic_like")},
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    flex: 5,
                  ),
                  // skill level UI
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Old Skill Level
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.colorDropdown,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            height: 36,
                            width: 142,
                            alignment: Alignment.center,
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Recommended',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.purewhite),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SvgPicture.asset(
                            height: 17,
                            width: 17,
                            'assets/images/ic_download_setting.svg',
                          ),
                          //New skill level
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.appColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            height: 36,
                            width: 142,
                            padding: EdgeInsets.only(top: 3.0),
                            child: Text.rich(
                              textAlign: TextAlign.center,
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Highly \nRecommended',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.purewhite),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    flex: 4,
                  ),
                  Divider(
                      height: 10,
                      color: AppColors.colorGray,
                      thickness: 1,
                      //thickness of divier line
                      indent: 10,
                      //spacing at the start of divider
                      endIndent: 10),
                  //like and comments UI
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                child: Container(
                                  padding: EdgeInsets.all(4),
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color: AppColors.appColor,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: InkWell(
                                    child: SvgPicture.asset(
                                      height: 10,
                                      width: 10,
                                      'assets/images/ic_white_like.svg',
                                    ),
                                    onTap: () => {print("ic_like")},
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "34 Likes",
                                style: TextStyle(
                                    fontSize: 15, color: AppColors.colorGray),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "19 Comments",
                                style: TextStyle(
                                    fontSize: 15, color: AppColors.colorGray),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    flex: 2,
                    fit: FlexFit.tight,
                  ),
                  Divider(
                      height: 10,
                      color: AppColors.colorGray,
                      thickness: 0.8,
                      //thickness of divier line
                      indent: 0,
                      //spacing at the start of divider
                      endIndent: 0),
                  //like share comments UI
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                child: SvgPicture.asset(
                                  height: 20,
                                  width: 20,
                                  'assets/images/ic_like.svg',
                                ),
                                onTap: () => {print("ic_like")},
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "Like",
                                style: TextStyle(
                                    fontSize: 15, color: AppColors.colorGray),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              InkWell(
                                child: SvgPicture.asset(
                                  height: 20,
                                  width: 20,
                                  'assets/images/ic_comments.svg',
                                ),
                                onTap: () => {print("ic_comments")},
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "Comments",
                                style: TextStyle(
                                    fontSize: 15, color: AppColors.colorGray),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              InkWell(
                                child: SvgPicture.asset(
                                  height: 20,
                                  width: 20,
                                  'assets/images/ic_share.svg',
                                ),
                                onTap: () => {print("ic_share")},
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "Share",
                                style: TextStyle(
                                    fontSize: 15, color: AppColors.colorGray),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    flex: 2,
                    fit: FlexFit.tight,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
