import 'package:flutter/material.dart';
import 'package:shopmobile/models/Product.dart';
import 'package:shopmobile/services/products.dart'; // Import your Product model

class AllProducts extends StatefulWidget {
  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  late Future<List<Product>> _futureProducts;

  @override
  void initState() {
    super.initState();
    _futureProducts = ProductsApis().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Products'),
      ),
      body: FutureBuilder<List<Product>>(
        future: _futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Product> products = snapshot.data ?? [];
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  productName: products[index].name,
                  productDescription: products[index].description,
                  productPrice: products[index].price,
                  productImage: products[index].image,
                );
              },
            );
          }
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String productName;
  final String productDescription;
  final double productPrice;
  final String productImage;

  const ProductCard({
    super.key,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productImage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: Image.network(
          productImage,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        title: Text(
          productName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(productDescription),
            Text(
              'Price: $productPrice',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        onTap: () {
          // Add navigation logic here if needed
        },
      ),
    );
  }
}
