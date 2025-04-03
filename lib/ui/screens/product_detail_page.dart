import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int selectedOpt = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 2, child: Container()),
          Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(11),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 16,
                          spreadRadius: 2,
                          color: Colors.black45,
                          offset: const Offset(0, 7))
                    ],
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Wireless Headphone',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$512.00',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Seller: Tariqul Islam',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                          textAlign: TextAlign.right,
                        )),
                    Row(
                      children: [
                        getMyContainer(
                            mWidget: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  '4.8',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            mWidth: 50),
                        Text(
                          '  320 Reviews',
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Text(
                      'Color',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.orange),
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        Container(
                          padding: EdgeInsets.all(2),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.orange, width: 1)),
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.orange),
                          ),
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.orange),
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.orange),
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.orange),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){
                            selectedOpt = 1;
                            setState((){

                            });
                          },
                          child: selectedOpt == 1
                              ? InkWell(
                                  onTap: () {
                                    selectedOpt = 1;
                                    setState(() {

                                    });
                                  },
                                child: getMyContainer(
                                    mPadding: 8,
                                    mHeight: 40,
                                    mWidget: Center(
                                      child: Text(
                                        "Descriptiion",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )),
                              )
                              : Text(
                                  "Descriptiion",
                                  style: TextStyle(color: Colors.black),
                                ),
                        ),
                        InkWell(
                            onTap: () {
                              selectedOpt = 2;
                              setState(() {

                              });
                            },
                          child: selectedOpt == 2 ?
                              getMyContainer(
                                    mPadding: 8,
                                    mHeight: 40,
                                    mWidget: Center(
                                      child: Text(
                                        "Specifications",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ))
                              : Text(
                                  "Specifications",
                                  style: TextStyle(color: Colors.black),
                                ),
                        ),
                        InkWell(
                          onTap: () {
                            selectedOpt = 3;
                            setState(() {

                            });
                          },
                          child: selectedOpt == 3
                              ? getMyContainer(
                                  mPadding: 8,
                                  mHeight: 40,
                                  mWidget: Center(
                                    child: Text(
                                      "Reviews",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ))
                              : Text(
                                  "Reviews",
                                  style: TextStyle(color: Colors.black),
                                ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget getMyContainer(
      {double? mWidth,
      double? mHeight,
      required Widget mWidget,
      double mPadding = 2}) {
    return Container(
      padding: EdgeInsets.only(
          left: mPadding * 2,
          right: mPadding * 2,
          top: mPadding,
          bottom: mPadding),
      width: mWidth,
      height: mHeight,
      decoration: BoxDecoration(
          color: Colors.orange, borderRadius: BorderRadius.circular(100)),
      child: mWidget,
    );
  }
}
