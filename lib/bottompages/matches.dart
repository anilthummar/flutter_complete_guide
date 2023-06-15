import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/bottompages/letsdink.dart';
import 'package:flutter_complete_guide/utils/AppColors.dart';
import 'package:flutter_svg/svg.dart';

class Matches extends StatefulWidget {
  @override
  _Matches createState() => _Matches();
}

class _Matches extends State<Matches> with SingleTickerProviderStateMixin {
  late TabController controller;

  // List of Tabs
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Open'),
    Tab(text: 'Scheduled'),
    Tab(text: 'Past'),
  ];

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.purewhite,
        title: HeaderData(),
        bottom: TabBar(
          controller: controller,
          tabs: [
            Tab(
              child: Text("Open"),
            ),
            Tab(
              child: Text("Scheduled"),
            ),
            Tab(
              child: Text("Past"),
            ),
          ],
          onTap: (value) => {},
          indicatorColor: AppColors.appColor,
          labelColor: AppColors.colorBlack,
          unselectedLabelColor: AppColors.colorGray,
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: myTabs.map((Tab tab) {
          String label = tab.text.toString();
          if (label.contains("Open")) {
            return openTabView("20");
          } else if (label.contains("Scheduled")) {
            return openTabView("20");
          } else if (label.contains("Past")) {
            return openTabView("20");
          } else
            return Container();
        }).toList(),
      ),
    );
  }

  Widget openTabView(String strOpenCount) {
    setState(() {
      //strCount=strOpenCount;
    });
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: OpenItem(
                index: index,
                onOpenLikeTap: (index) {
                  ViewMessage("onOpenLikeTap", index, context);
                },
                onOpenShareTap: (index) {
                  ViewMessage("onOpenShareTap", index, context);
                },
                onOpenCommentTap: (index) {
                  ViewMessage("onOpenCommentTap", index, context);
                },
                onOpenLikesTab: (int index) {
                  ViewMessage("onOpenLikesTab", index, context);
                },
                onOpenCommentsCountsTab: (int index) {
                  ViewMessage("onOpenCommentsCountsTab", index, context);
                },
                onViewTab: (int index) {
                  // ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LetsDink()));

                  // Navigator.of(context).push(
                  //   MaterialPageRoute(builder: (context) => LetsDink(),),
                  // );
                },
              ),
            );
          },
          itemCount: 10),
    );
  }

  ViewMessage(String strMessageData, int index, BuildContext mContext) {
    return ScaffoldMessenger.of(mContext).showSnackBar(
      SnackBar(
        content: Text("strMessageData$index"),
      ),
    );
  }

  TabViewData() {
    return Container(
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              controller: controller,
              labelColor: AppColors.colorBlack,
              unselectedLabelColor: AppColors.colorGray,
              tabs: [
                Tab(
                  text: "Open",
                ),
                Tab(
                  text: "Scheduled",
                ),
                Tab(
                  text: "Past",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  HeaderData() {
    return Container(
      color: AppColors.purewhite,
      child: Container(
        child: Row(
          children: [
            Expanded(
              flex: 8,
              child: Row(
                children: [
                  Card(
                    elevation: 0,
                    margin: EdgeInsets.all(4),
                    color: AppColors.cardbgcolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        'assets/images/ic_locationmarker.svg',
                      ),
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
                  height: 18,
                  width: 18,
                  'assets/images/ic_filtermatches.svg',
                ),
                onTap: () => {print("filter matches")},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OpenItem extends StatelessWidget {
  const OpenItem(
      {Key? key,
      required this.index,
      required this.onOpenLikeTap,
      required this.onOpenCommentTap,
      required this.onOpenShareTap,
      required this.onOpenLikesTab,
      required this.onOpenCommentsCountsTab,
      required this.onViewTab})
      : super(key: key);

  // For Like  comments and share click event
  final int index;
  final Function(int index) onOpenLikeTap;
  final Function(int index) onOpenCommentTap;
  final Function(int index) onOpenShareTap;

  //For Likes and comments counts
  final Function(int index) onOpenLikesTab;
  final Function(int index) onOpenCommentsCountsTab;
  final Function(int index) onViewTab;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          WillPopScope(
            child: Container(
              margin: EdgeInsets.all(3),
              height: MediaQuery.of(context).size.height / 3,
              width: 400,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                color: AppColors.purewhite,
                child: Column(
                  children: [
                    //Profile ui and header data item
                    Expanded(
                      flex: 8,
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: Image.asset(
                                width: 120,
                                height: 120,
                                fit: BoxFit.fill,
                                'assets/images/ic_user_open.png',
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: 10, top: 15, right: 10),
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
                                    SizedBox(height: 5),
                                    SvgPicture.asset(
                                      height: 20,
                                      width: 20,
                                      'assets/images/ic_players.svg',
                                    ),
                                    SizedBox(height: 5),
                                    Text.rich(
                                      textScaleFactor: 1.2,
                                      TextSpan(
                                        children: [
                                          const TextSpan(
                                            text: 'Skill Level:',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: AppColors.colorBlack),
                                          ),
                                          const TextSpan(
                                            text: "4.0  ",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: AppColors.colorBlack,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          WidgetSpan(
                                            alignment:
                                                PlaceholderAlignment.middle,
                                            child: InkWell(
                                              child: SvgPicture.asset(
                                                  'assets/images/ic_old_skill_level.svg'),
                                              onTap: () => {
                                                print("Skill Level"),
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text.rich(
                                      textScaleFactor: 1.2,
                                      TextSpan(
                                        children: [
                                          const TextSpan(
                                            text: 'Aug 12, 2023 • 9:00 am',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: AppColors.colorBlack),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text.rich(
                                      textScaleFactor: 1.2,
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Club: ',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: AppColors.btnColor),
                                          ),
                                          TextSpan(
                                            text: "Bay Club",
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor:
                                                    AppColors.btnColor,
                                                decorationThickness: 2,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: AppColors.btnColor),
                                          ),
                                          TextSpan(
                                            text: " • Private",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: AppColors.btnColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text.rich(
                                      textScaleFactor: 1.2,
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Open Spots: ',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: AppColors.btnColor),
                                          ),
                                          TextSpan(
                                            text: "2",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: AppColors.btnColor),
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
                      // child: InkWell(
                      // onTap: () {
                      //   onViewTab.call(index);
                      // },
                      // ),
                    ),
                    // skill level UI
                    Divider(
                        height: 10,
                        color: AppColors.colorLine,
                        thickness: 1,
                        //thickness of divier line
                        indent: 10,
                        //spacing at the start of divider
                        endIndent: 10),
                    //Likes and Comments UI
                    Expanded(
                      flex: 2,
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
                                      onTap: () {
                                        onOpenLikesTab.call(index);
                                      },
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
                                InkWell(
                                  child: Text(
                                    "19 Comments",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: AppColors.colorGray),
                                  ),
                                  onTap: () {
                                    onOpenCommentsCountsTab.call(index);
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      height: 10,
                      color: AppColors.colorLine,
                      thickness: 1,
                    ),
                    //like share comments UI
                    Expanded(
                      flex: 2,
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
                                  onTap: () {
                                    onOpenLikeTap.call(index);
                                  },
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
                                  onTap: () {
                                    onOpenCommentTap.call(index);
                                  },
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
                                  onTap: () {
                                    onOpenShareTap.call(index);
                                  },
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
                    ),
                  ],
                ),
              ),
            ),
            onWillPop: () {

              return Future.value(true);
            },
          ),
        ],
      ),
    );
  }
}
