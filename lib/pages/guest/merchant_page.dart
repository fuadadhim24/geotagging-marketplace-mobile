import 'package:flutter/material.dart';

class MerchantPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar dengan gambar latar belakang
          SliverAppBar(
            expandedHeight: 200.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Merchant Name'),
              background: Image.network(
                'https://via.placeholder.com/600x200',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // SliverList untuk konten laman toko
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Informasi laman toko
                      Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tentang Toko',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 12.0),
                              Text(
                                'Deskripsi singkat tentang toko ini dan apa yang ditawarkan.',
                                style: TextStyle(fontSize: 12.0),
                              ),
                              SizedBox(height: 12.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Buka: 09:00 - 21:00 WIB',
                                    style: TextStyle(fontSize: 13.0),
                                  ),
                                  Text(
                                    'Lokasi: Jakarta',
                                    style: TextStyle(fontSize: 13.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      // Produk-produk yang ditawarkan oleh toko
                      Text(
                        'Produk Unggulan',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Container(
                        height: 250.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return ProductCard(
                              imageUrl: 'https://via.placeholder.com/150',
                              productName: 'Produk ${index + 1}',
                              category: 'Kategori ${index % 3 + 1}',
                              rating: 4.5,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String category;
  final double rating;

  const ProductCard({
    required this.imageUrl,
    required this.productName,
    required this.category,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      margin: EdgeInsets.only(right: 12.0),
      child: Card(
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imageUrl,
              height: 100.0,
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
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    category,
                    style: TextStyle(fontSize: 12.0, color: Colors.grey),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, size: 16.0, color: Colors.orange),
                      SizedBox(width: 4.0),
                      Text(
                        '$rating',
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

void navigateToMerchantPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MerchantPage(),
    ),
  );
}
