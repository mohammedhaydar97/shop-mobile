import 'package:flutter/material.dart';
import 'package:shopmobile/models/Product.dart';
import 'package:shopmobile/widgets/statless/ProductCard.dart';
import 'package:shopmobile/services/products.dart';

class NewReleaseList extends StatefulWidget {
  @override
  _NewReleaseListState createState() => _NewReleaseListState();
}

class _NewReleaseListState extends State<NewReleaseList> {
  ProductsApis productsApis = ProductsApis();
  List<Product> productList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    List<Product> products = await productsApis.fetchData();
    setState(() {
      productList = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1400,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: productList.asMap().entries.map((entry) {
            int index = entry.key;
            Product product = entry.value;
            return ProductCard(product: product, index: index);
          }).toList(),
        ),
      ),
    );
  }
}
