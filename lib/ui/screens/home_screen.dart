import 'package:carousel_custom_slider/carousel_custom_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_application/ui/screens/product/product_bloc.dart';
import 'package:shopping_application/ui/screens/product/product_event.dart';
import 'package:shopping_application/ui/screens/product/product_state.dart';
import 'package:shopping_application/ui/screens/product_detail_page.dart';
import 'package:shopping_application/ui/widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(GetAllProductEvent());
  }

  List<String> mSliderList = [
    "https://img.freepik.com/free-vector/flat-horizontal-sale-banner-template-with-photo_23-2149000923.jpg",
    "https://static.vecteezy.com/system/resources/previews/006/560/561/non_2x/4-april-sale-poster-or-banner-with-4-over-on-product-podium-scene-april-4-sales-banner-template-design-for-social-media-and-website-special-offer-sale-50-off-campaign-or-promotion-free-vector.jpg",
    "https://img.pikbest.com/origin/10/01/82/867pIkbEsTAIq.png!sw800",
    "https://static.vecteezy.com/system/resources/previews/028/197/684/non_2x/mega-sale-banner-template-design-special-offer-discount-shopping-banner-template-vector.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Icon(Icons.menu), Icon(Icons.notification_add)],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(right: 12, left: 7),
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Light background color
                  borderRadius: BorderRadius.circular(25), // Rounded edges
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    // Search icon
                    suffixIcon: Container(
                      padding: const EdgeInsets.only(left: 10),
                      // Padding for spacing
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(
                              color: Colors.grey,
                              width: 2.0), // Vertical Divider
                        ),
                      ),
                      child: const Icon(Icons.tune,
                          color: Colors.grey), // Filter icon
                    ),
                    // Filter icon
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12.0), // Adjust padding
                  ),
                ),
              ),
              SizedBox(
                height: 11,
              ),
              SizedBox(
                height: 200,
                child: CarouselCustomSlider(
                  childrenStackBuilder: (index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 11.0, left: 11.0),
                        child: Text(
                          "Sale $index",
                          style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                  sliderList: mSliderList,
                  width: double.infinity,
                  height: 200,
                  fitPic: BoxFit.fitHeight,
                  autoPlayCurve: Curves.bounceOut,
                  effect: SwapEffect(
                    dotHeight: 7.0,
                    dotWidth: 7.0,
                    paintStyle: PaintingStyle.fill,
                    type: SwapType.yRotation,
                    activeDotColor: Theme
                        .of(context)
                        .primaryColor,
                    dotColor: Theme
                        .of(context)
                        .colorScheme
                        .inversePrimary,
                  ),
                ),
              ),
              SizedBox(
                height: 11,
              ),
              SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 20,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return const Column(
                      children: [
                        CircleAvatar(
                          child: FlutterLogo(),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text('items')
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext _, int index) =>
                  const SizedBox(
                    width: 7,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Special for you'),
                  TextButton(onPressed: () {}, child: const Text('see all'))
                ],
              ),
              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is ProductErrorState) {
                    return Center(
                      child: Text(state.errorMsg),
                    );
                  }

                  if (state is ProductLoadedState) {
                    return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12),
                        itemCount: state.mProducts.length,
                        itemBuilder: (gridCtx, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => ProductDetailPage(),));
                            },
                            child: ProductCard(
                              imgUrl: state.mProducts[index].image!,
                              price: double.parse(
                                  state.mProducts[index].price ?? "0.0"),
                            ),
                          );
                        });
                  }

                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
