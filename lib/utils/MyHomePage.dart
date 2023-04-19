import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'AppColors.dart';

class MyHomePageExpand extends StatelessWidget {
  const MyHomePageExpand({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: MyStatefulWidget());
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  var data = [
    'One',
    'Two',
    'Three',
    'Four',
    'Five',
    'Six',
    'Seven',
    'Eight',
    'Nine',
    'Ten'
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 250.0,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text('Collapsing Header'),
            background: Image.network(
              "https://cdn.pixabay.com/photo/2019/12/14/07/21/mountain-4694346_960_720.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {

              return Container(
                // alignment: Alignment.center,
                // height: 100,
                // color: Colors.red[100],
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 20),
                          Column(
                            children: <Widget>[
                              const Text(
                                'Set Up Your Profile ',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: AppColors.btnColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 20),
                              // card view
                              SizedBox(
                                height: 160,
                                width: 130,
                                child: Card(
                                  elevation: 0.5,
                                  color: AppColors.borderColor,
                                  child: InkWell(
                                      onTap: () {
                                        showCupertinoModalPopup(
                                          context: context,
                                          builder: (BuildContext cont) {
                                            return CupertinoActionSheet(
                                              actions: [
                                                CupertinoActionSheetAction(
                                                  onPressed: () async {
                                                    Navigator.pop(context);
                                                  },
                                                  child:
                                                  const Text('Take a Photo',
                                                      style: TextStyle(
                                                        color: AppColors
                                                            .colorGray,
                                                        fontSize: 15,
                                                      )),
                                                ),
                                                CupertinoActionSheetAction(
                                                  onPressed: () async {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text(
                                                    'Photo Gallery',
                                                    style: TextStyle(
                                                      color: AppColors.colorGray,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                              cancelButton:
                                              CupertinoActionSheetAction(
                                                onPressed: () async {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                    color: AppColors.colorGray,
                                                    decorationColor:
                                                    AppColors.colorGray,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Align(
                                        child: SvgPicture.asset(
                                          'assets/images/ic_camera_plus.svg',
                                        ),
                                        // child: Image.network('https://picsum.photos/130/160'),
                                      )),
                                ),
                              ),

                              const SizedBox(height: 20),
                              // first name
                              Container(
                                height: 50,
                                padding:
                                const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.appColor),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: TextFormField(
                                  style: const TextStyle(
                                    color: AppColors.btnColor,
                                  ),
                                  cursorColor: AppColors.appColor,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    labelText: "First name",
                                    border: InputBorder.none,
                                    labelStyle: TextStyle(
                                      color: AppColors.colorGray,
                                    ),
                                    focusColor: AppColors.appColor,
                                    hintStyle: TextStyle(
                                      color: AppColors.btnColor,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              //last name
                              Container(
                                height: 50,
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: TextFormField(
                                  style: const TextStyle(
                                    color: AppColors.btnColor,
                                  ),
                                  cursorColor: AppColors.appColor,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    labelText: "Last name",
                                    border: InputBorder.none,
                                    labelStyle: TextStyle(
                                      color: AppColors.colorGray,
                                    ),
                                    focusColor: AppColors.appColor,
                                    hintStyle: TextStyle(
                                      color: AppColors.btnColor,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              //Picklist
                              Container(
                                height: 190,
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: TextFormField(
                                  style: const TextStyle(
                                    color: AppColors.btnColor,
                                  ),
                                  cursorColor: AppColors.appColor,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    labelText: "Bio",
                                    border: InputBorder.none,
                                    labelStyle: TextStyle(
                                      color: AppColors.colorGray,
                                    ),
                                    focusColor: AppColors.appColor,
                                    hintStyle: TextStyle(
                                      color: AppColors.btnColor,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              // Tell us types of matches text
                              const Text(
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                "Tell us the types of matches you are looking for.Your Bio will appear in your Player Profile.",
                                style: TextStyle(
                                    color: AppColors.colorGray,
                                    fontSize: 15,
                                    fontFamily:
                                    'Poppins-Regular'),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ],
                      ),
                    ),

                  ),
                ),
              );

            },
            childCount:data.length
          ),
        ),
      ],
    );
  }
}