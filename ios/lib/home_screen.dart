import 'package:finalproject/Auth/auth.dart';
import 'package:finalproject/Constants/textconstant.dart';
import 'package:finalproject/provider/api_provider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  String? userName;

  Future<void> GetUserData() async {
    Map<String, dynamic>? userData = await getUserData();
    setState(() {
      userName = userData?['name'] ?? 'No Name';
    });
  }
  getproduct() async {
    productsList = await ProductsApi().getProducts();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    GetUserData();
    getproduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              TEXT(name:  'Welcome $userName'),
              SizedBox(height: 30),

              Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.black54),
                    SizedBox(width: 10),
                    Text('Search', style: TextStyle(color: Colors.black54)),
                  ],
                ),
              ),
              SizedBox(height: 25),

              isLoading == true
                  ? Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Expanded(
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: productsList!.products!.length,
                          itemBuilder: (BuildContext context, int index) =>
                              Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.7),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: ProductBuild(
                              name: productsList!.products![index].title!,
                              price: productsList!.products![index].price!
                                  .toString(),
                              image: productsList!.products![index].thumbnail!,
                            ),
                          ),
                        ),

                    )
            ],
          ),
        ),
      ),
    );
  }
}

Widget ProductBuild({
  required String name,
  required String price,
  required String image,
}) =>
    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.network(image),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            '\$$price',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
