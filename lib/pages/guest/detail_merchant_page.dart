import 'package:flutter/material.dart';

class DetailMerchantPage extends StatelessWidget {
  final Map<String, dynamic> merchant;

  const DetailMerchantPage({Key? key, required this.merchant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List produk untuk merchant yang dipilih
    final List<Map<String, dynamic>> productList = merchant['products'];

    return Scaffold(
      appBar: AppBar(
        title: Text(merchant['name']),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            pinned: true,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      merchant['imageUrl'],
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 10.0,
                      left: 10.0,
                      right: 10.0,
                      child: SafeArea(
                        child: Text(
                          merchant['name'],
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
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
                                merchant['description'],
                                style: TextStyle(fontSize: 12.0),
                              ),
                              SizedBox(height: 12.0),
                              // Informasi tambahan lainnya seperti lokasi, jam buka, dll.
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
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
                          itemCount: productList.length,
                          itemBuilder: (context, index) {
                            final product = productList[index];
                            return ProductCard(
                              imageAsset: product['imageAsset'],
                              productName: product['productName'],
                              category: product['category'],
                              rating: product['rating'],
                              price: product['price'],
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
  final String imageAsset;
  final String productName;
  final String category;
  final double rating;
  final String price;

  const ProductCard({
    required this.imageAsset,
    required this.productName,
    required this.category,
    required this.rating,
    required this.price,
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
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imageAsset,
                height: 100.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
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
                      SizedBox(width: 8.0),
                      Text(
                        'Rp $price',
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
