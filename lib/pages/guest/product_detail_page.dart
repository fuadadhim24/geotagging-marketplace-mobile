import 'package:flutter/material.dart';
import 'package:geotagging_marketplace_mobile/shared/theme.dart'; // Sesuaikan dengan nama file dan path theme.dart Anda

class ProductDetailPage extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String storeName;
  final double rating;

  const ProductDetailPage({
    required this.imageUrl,
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
            Image.network(
              imageUrl,
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
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Informasi Tambahan',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12.0),
                  ListTile(
                    leading: Icon(Icons.local_shipping),
                    title: Text('Pilihan Delivery'),
                    onTap: () {
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.map),
                    title: Text('Lokasi'),
                    onTap: () {
                    },
                  ),
                  Divider(),
                  // Promo/voucher
                  ListTile(
                    leading: Icon(Icons.local_offer),
                    title: Text('Promo/Voucher'),
                    onTap: () {
                      // Handle action when promo/voucher is tapped
                    },
                  ),
                  Divider(),
                  // Menu produk lainnya
                  ListTile(
                    leading: Icon(Icons.menu),
                    title: Text('Menu Produk Lainnya'),
                    onTap: () {
                      // Handle action when other products menu is tapped
                    },
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
              // Handle action when add to cart button is pressed
            },
            child: Icon(Icons.add_shopping_cart),
          ),
          SizedBox(height: 16.0),
          FloatingActionButton(
            onPressed: () {
              // Handle action when share button is pressed
            },
            child: Icon(Icons.share),
          ),
          SizedBox(height: 16.0),
          FloatingActionButton(
            onPressed: () {
              // Handle action when nearby button is pressed
            },
            child: Icon(Icons.location_on),
          ),
        ],
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
        imageUrl: 'https://via.placeholder.com/600x400',
        productName: 'Nama Produk',
        storeName: 'Nama Toko',
        rating: 4.5,
      ),
    ),
  );
}
