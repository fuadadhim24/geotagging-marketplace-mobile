import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:geotagging_marketplace_mobile/pages/guest/product_detail_page.dart';
import 'package:geotagging_marketplace_mobile/shared/theme.dart'; // Sesuaikan dengan nama file dan path theme.dart Anda

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imgList = [
    'https://via.placeholder.com/600x200',
    'https://via.placeholder.com/600x200',
    'https://via.placeholder.com/600x200',
    'https://via.placeholder.com/600x200',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beranda'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
            items: imgList
                .map((item) => Container(
                      child: Center(
                        child: Image.network(
                          item,
                          fit: BoxFit.cover,
                          width: 1000.0,
                        ),
                      ),
                    ))
                .toList(),
          ),
          Container(
            height: 100.0,
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleContainer(
                  color: greenColor,
                  iconData: Icons.store_outlined,
                  title: 'Toko',
                ),
                CircleContainer(
                  color: darkBlueColor,
                  iconData: Icons.eco_outlined,
                  title: 'Produk',
                ),
                CircleContainer(
                  color: greenColor,
                  iconData: Icons.trending_up_rounded,
                  title: 'Populer',
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Section Title',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      'Sub Title',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle action when "Lihat Semua" button is pressed
                  },
                  child: Text('Lihat Semua'),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            height: 250.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return ProductCard(
                  imageUrl: 'https://via.placeholder.com/150',
                  productName: 'Sawi',
                  category: 'Sayuran',
                  rating: 4.5,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CircleContainer extends StatelessWidget {
  final Color color;
  final IconData iconData;
  final String title;

  const CircleContainer(
      {required this.color, required this.iconData, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 80.0,
        height: 80.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: whiteColor,
              size: 24,
            ),
            Text(
              title,
              style: whiteTS.copyWith(
                fontSize: 11,
              ),
            )
          ],
        ),
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
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 150.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(
                      imageUrl: imageUrl,
                      productName: productName,
                      storeName: 'Nama Toko',
                      rating: rating,
                    ),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  imageUrl,
                  width: 150.0,
                  height: 100.0,
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
                    productName,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    category,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[600],
                        size: 16.0,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        '$rating',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman detail produk
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(
                        imageUrl: imageUrl,
                        productName: productName,
                        storeName:
                            'Nama Toko', // Ganti dengan nama toko sesuai kebutuhan
                        rating: rating,
                      ),
                    ),
                  );
                },
                child: Text('Detail Produk'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
