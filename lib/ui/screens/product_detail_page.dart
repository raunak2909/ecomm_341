import 'package:flutter/material.dart';
import 'package:shopping_application/data/models/product_model.dart';
import 'package:shopping_application/data/remote/api_helper.dart';

import '../../data/remote/urls.dart';

class ProductDetailPage extends StatefulWidget {
  ProductModel selectedProduct;
  ProductDetailPage({required this.selectedProduct});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int selectedOpt = 1;
  int qty = 1;
  ApiHelper? apiHelper;

  @override
  void initState() {
    super.initState();
    apiHelper = ApiHelper();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(flex: 2, child: Container(
            child: Center(child: Image.network(widget.selectedProduct.image!,width: 300,
            height: 300,)),
          )),
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
                      widget.selectedProduct.name!,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$${widget.selectedProduct.price}',
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
                    Expanded(child: Text("This is Description..")),
                    Container(
                      height: 70,
                      margin: EdgeInsets.only(bottom: 16),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 130,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove,  color: Colors.white),
                                  onPressed: () {
                                    if(qty>1){
                                      qty--;
                                      setState(() {

                                      });
                                    }
                                  },
                                ),
                                Text("$qty", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                                IconButton(
                                  icon: Icon(Icons.add,  color: Colors.white),
                                  onPressed: () {
                                    qty++;
                                    setState(() {

                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                            ),
                            onPressed: () async{

                              try{
                               var mRes = await apiHelper!.postApi(url: Urls.ADD_TO_CART_URL, bodyParams: {
                                  "product_id":widget.selectedProduct.id,
                                  "quantity": qty
                                });

                               if(mRes["status"]){
                                 print("Added to cart");
                               } else {
                                 print("Something went wrong!!");
                               }


                              } catch(e){
                               print("Error: $e");
                              }

                            },
                            child: Text("Add to Cart", style: TextStyle(fontSize: 18, color: Colors.white)),
                          ),
                        ],
                      ),
                    )
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


/*
class ProductDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/headphone.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: Icon(Icons.arrow_back, color: Colors.black, size: 28),
                ),
                Positioned(
                  top: 40,
                  right: 20,
                  child: Icon(Icons.favorite_border, color: Colors.black, size: 28),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Wireless Headphone",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$520.00",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange),
                      ),
                      Text(
                        "Seller: Tariqul Islam",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Container(width: 20, height: 20, color: Colors.orange, margin: EdgeInsets.only(right: 8)),
                      Container(width: 20, height: 20, color: Colors.black, margin: EdgeInsets.only(right: 8)),
                      Container(width: 20, height: 20, color: Colors.blue, margin: EdgeInsets.only(right: 8)),
                      Container(width: 20, height: 20, color: Colors.brown),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Description", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.orange)),
                      Text("Specifications", style: TextStyle(fontSize: 16, color: Colors.grey)),
                      Text("Reviews", style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Blandit amet purus eget sed vitae.",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove, color: Colors.black),
                  onPressed: () {},
                ),
                Text("1", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                IconButton(
                  icon: Icon(Icons.add, color: Colors.black),
                  onPressed: () {},
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              onPressed: () {},
              child: Text("Add to Cart", style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}*/
