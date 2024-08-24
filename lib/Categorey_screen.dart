import 'package:finalproject/Constants/textconstant.dart';
import 'package:finalproject/provider/api_provider.dart';
import 'package:finalproject/screens/catproduct_screen.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List images = [
    'assets/Beauty.jpg',
    'assets/Fragrances.webp',
    'assets/Furniture.webp',
    'assets/Groceries.jpeg',
    'assets/Home Decoration.jpeg',
    'assets/Kitchen Accessories.jpeg',
    'assets/Laptops.jpeg',
    'assets/Mens Shirts.jpeg',
    'assets/Mens Shoes.jpeg',
    'assets/Mens Watches.jpeg',
    'assets/Mobile Accessories.jpeg',
    'assets/Motorcycle.jpeg',
    'assets/Skin Care.jpeg',
    'assets/Smartphones.jpeg',
    'assets/Sports Accessories.jpeg',
    'assets/Sunglasses.jpeg',
    'assets/Tablets.jpeg',
    'assets/Tops.jpeg',
    'assets/Vehicle.jpeg',
    'assets/Womens Bages.jpeg',
    'assets/Womens Dresses.jpeg',
    'assets/Womens Jewellery.jpeg',
    'assets/Womens Shoes.jpeg',
    'assets/Womens Watches.jpeg',
  ];

  List<String> categories = [];
  bool isLoading = true;

  getCategories() async {
    categories = (await ApiProvider().getCategories())!;

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TEXT(
                name: 'Categories',
              ),
            ),
            isLoading
                ? Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 3,
                        mainAxisSpacing: 3,
                      ),
                      itemCount: categories.length,
                      itemBuilder: (BuildContext context, int index) => InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CatproductScreen(
                                category: categories[index],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 5,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: CategoryBuild(
                            name: categories[index],
                            image: images[index],
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    ));
  }
}

Widget CategoryBuild({required String? image, required String? name}) => Stack(
      children: [
        Image.asset(
          image!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.black.withOpacity(.4),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 1),
            child: Text(
              name ?? '',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(3.0, 3.0),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
