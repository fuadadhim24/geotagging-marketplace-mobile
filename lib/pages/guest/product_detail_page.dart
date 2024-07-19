import 'package:flutter/material.dart';
import 'package:geotagging_marketplace_mobile/shared/theme.dart';

class ProductDetailPage extends StatelessWidget {
  final String imageAsset;
  final String productName;
  final String storeName;
  final double rating;

  const ProductDetailPage({
    required this.imageAsset,
    required this.productName,
    required this.storeName,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Produk'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Gambar produk
            Image.asset(
              imageAsset,
              height: 300.0,
              fit: BoxFit.cover,
            ),
            // Informasi produk
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Toko: $storeName',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[600],
                        size: 20.0,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        '$rating',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Informasi tambahan dan tombol aksi
            Container(
              padding: EdgeInsets.all(16.0),
              color: darkBlueColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Informasi Tambahan',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Pilihan Pengiriman: Ambil di Tempat atau Diantarkan',
                          style: TextStyle(fontSize: 16.0, color: whiteColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0),
                  Card(
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ada yang menunggu kamu lo!',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Klaim vouchernya sebelum kehabisan.',
                            style: TextStyle(fontSize: 14.0),
                          ),
                          SizedBox(height: 12.0),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                // Handle action when 'Mau Lihat Voucher' button is pressed
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                              child: Text(
                                'Mau Lihat Voucher',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            // Menu produk lainnya
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Menu Produk Lainnya',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Container(
                    height: 175.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildProductCard('assets/img/sayur1.jpeg', 'Sawi', '4.5'),
                        _buildProductCard('assets/img/sayur2.jpeg', 'Selada', '4.2'),
                        _buildProductCard('assets/img/sayur5.jpeg', 'Bayam', '4.7'),
                        _buildProductCard('assets/img/sayur8.jpeg', 'Kacang', '4.3'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Tombol-tombol floating
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // Handle action when 'Add to Cart' button is pressed
            },
            child: Icon(Icons.add_shopping_cart),
          ),
          SizedBox(height: 16.0),
          FloatingActionButton(
            onPressed: () {
              // Handle action when 'Share' button is pressed
            },
            child: Icon(Icons.share),
          ),
          SizedBox(height: 16.0),
          FloatingActionButton(
            onPressed: () {
              // Handle action when 'Nearby' button is pressed
            },
            child: Icon(Icons.location_on),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(String imagePath, String productName, String rating) {
    return Container(
      width: 120.0,
      margin: EdgeInsets.only(right: 12.0),
      child: Card(
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              height: 80.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    children: [
                      Icon(Icons.star, size: 16.0, color: Colors.orange),
                      SizedBox(width: 4.0),
                      Text(
                        rating,
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
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

// Contoh penggunaan halaman detail produk
void navigateToProductDetail(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ProductDetailPage(
        imageAsset: 'assets/img/produk1.jpg',
        productName: 'Nama Produk',
        storeName: 'Nama Toko',
        rating: 4.5,
      ),
    ),
  );
}
