import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Product {
  final String imageAsset;
  final String productName;
  final double rating;
  final String price;
  final String category;

  Product({
    required this.imageAsset,
    required this.productName,
    required this.rating,
    required this.price,
    required this.category,
  });
}

class PopularPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      imageAsset: 'assets/img/sayur8.jpeg',
      productName: 'Produk 1',
      rating: 4.5,
      price: '10.000',
      category: 'Murah',
    ),
    Product(
      imageAsset: 'assets/img/sayur9.jpeg',
      productName: 'Produk 2',
      rating: 4.0,
      price: '12.000',
      category: 'Rating Tinggi',
    ),
    Product(
      imageAsset: 'assets/img/sayur10.jpeg',
      productName: 'Produk 3',
      rating: 4.2,
      price: '9.000',
      category: 'Terdekat',
    ),
    Product(
      imageAsset: 'assets/img/sayur11.jpeg',
      productName: 'Produk 4',
      rating: 4.8,
      price: '15.000',
      category: 'Nostalgia',
    ),
    Product(
      imageAsset: 'assets/img/sayur12.jpeg',
      productName: 'Produk 5',
      rating: 4.3,
      price: '8.000',
      category: 'Murah',
    ),
    Product(
      imageAsset: 'assets/img/sayur13.jpeg',
      productName: 'Produk 6',
      rating: 4.6,
      price: '11.000',
      category: 'Rating Tinggi',
    ),
    Product(
      imageAsset: 'assets/img/sayur1.jpeg',
      productName: 'Produk 7',
      rating: 4.1,
      price: '12.300',
      category: 'Terdekat',
    ),
    Product(
      imageAsset: 'assets/img/sayur2.jpeg',
      productName: 'Produk 8',
      rating: 4.7,
      price: '13.000',
      category: 'Nostalgia',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildCategorySection('Murah'),
            _buildProductGrid('Murah'),
            SizedBox(height: 16.0),
            _buildCategorySection('Rating Tinggi'),
            _buildProductGrid('Rating Tinggi'),
            SizedBox(height: 16.0),
            _buildCategorySection('Terdekat'),
            _buildProductGrid('Terdekat'),
            SizedBox(height: 16.0),
            _buildCategorySection('Nostalgia'),
            _buildProductGrid('Nostalgia'),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection(String category) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            _getCategoryDescription(category),
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  String _getCategoryDescription(String category) {
    switch (category) {
      case 'Murah':
        return 'Produk dengan harga terbaik untuk Anda';
      case 'Rating Tinggi':
        return 'Produk dengan rating tertinggi dari pelanggan kami';
      case 'Terdekat':
        return 'Produk yang tersedia di sekitar Anda';
      case 'Nostalgia':
        return 'Produk klasik yang membawa kenangan';
      default:
        return '';
    }
  }

  Widget _buildProductGrid(String category) {
    final filteredProducts =
        products.where((product) => product.category == category).toList();
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 5.5,
      ),
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        return _buildProductCard(filteredProducts[index]);
      },
    );
  }

  Widget _buildProductCard(Product product) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('product-detail', arguments: product);
      },
      child: Card(
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 3 / 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  product.imageAsset,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.productName,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    children: [
                      Icon(Icons.star, size: 16.0, color: Colors.orange),
                      SizedBox(width: 4.0),
                      Text(
                        product.rating.toString(),
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    '\Rp. '+product.price,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
