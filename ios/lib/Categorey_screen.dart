import 'dart:math';

import 'package:finalproject/provider/api_provider.dart';
import 'package:finalproject/screens/catproduct_screen.dart';
import 'package:flutter/material.dart';


class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final Random _random = Random();

  // Function to generate a random color
  Color _getRandomColor() {
    return Color.fromARGB(
      200,
      _random.nextInt(200),
      _random.nextInt(200),
      _random.nextInt(200),
    );
  }
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
              child: Text(
                'Categories',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff105161),
                ),
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
                            colorback: _getRandomColor(),                          ),
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

Widget CategoryBuild({required Color? colorback, required String? name}) => Stack(
      children: [
        Container(
          color:colorback,

          width: double.infinity,
          height: double.infinity,
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.black.withOpacity(.4),

          child: Padding(
            padding: const EdgeInsets.only(left: 15,right: 1),
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
