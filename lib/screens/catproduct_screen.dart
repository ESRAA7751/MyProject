import 'package:finalproject/provider/api_provider.dart';
import 'package:finalproject/provider/models/cart_model.dart'; // تحقق من وجود هذا النموذج والتأكد من أنه صحيح
import 'package:finalproject/provider/models/catproduct_model.dart'; // تحقق من وجود هذا النموذج والتأكد من أنه صحيح
import 'package:flutter/material.dart';

class CatproductScreen extends StatefulWidget {
  final String category;

  const CatproductScreen({super.key, required this.category});

  @override
  State<CatproductScreen> createState() => _CatproductScreenState();
}

class _CatproductScreenState extends State<CatproductScreen> {
  List<Product> products = [];
  bool isLoading = true;

  Future<void> getProducts() async {
    CatProguct? response =
        await CatProductApi().getProductsByCategory(widget.category);
    setState(() {
      if (response != null) {
        products = response.products ?? [];
      }
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products in ${widget.category}'),
      ),
      body: isLoading
          ? Expanded(child: Center(child: CircularProgressIndicator()))
          : products.isEmpty
              ? Center(child: Text('No products available.'))
              : ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return Container(
                        padding: EdgeInsets.all(30),
                        margin: EdgeInsets.all(30),
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
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                products[index].thumbnail ?? '',
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                products[index].title ?? '',
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
                                'Price: \$${products[index].price ?? 0}',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ));
                  },
                ),
    );
  }
}

