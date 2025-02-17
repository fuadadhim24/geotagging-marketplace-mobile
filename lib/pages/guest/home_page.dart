import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:geotagging_marketplace_mobile/pages/guest/product_detail_page.dart';
import 'package:geotagging_marketplace_mobile/shared/theme.dart';
import 'package:get/get.dart'; // Sesuaikan dengan nama file dan path theme.dart Anda

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imgList = [
    'assets/img/banner1.jpeg',
    'assets/img/banner2.jpeg',
    'assets/img/banner3.jpeg',
    'assets/img/banner4.jpeg',
  ];
  List<Map<String, dynamic>> productList = [
    {
      'imageAsset': 'assets/img/sayur4.jpeg',
      'productName': 'Sawi ',
      'category': 'Sayur',
      'rating': 4.5,
      'price': '12.000',
    },
    {
      'imageAsset': 'assets/img/sayur2.jpeg',
      'productName': 'Selada',
      'category': 'Sayur',
      'rating': 4.2,
      'price': '15.000',
    },
    {
      'imageAsset': 'assets/img/sayur5.jpeg',
      'productName': 'Bayam',
      'category': 'Sayur',
      'rating': 4.3,
      'price': '10.000',
    },
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
                        child: Image.asset(
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
            padding: EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Temukan Produk Segar',
                      textAlign: TextAlign.left,
                      style: blackTS.copyWith(),
                    ),
                    Text(
                      'di sekitar anda',
                      style: darkBlueTS.copyWith(
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                SizedBox(
                  width: 25,
                ),
                CircleContainer(
                  color: darkBlueColor,
                  iconData: Icons.store_outlined,
                  title: 'Toko',
                  routeName: '/merchant-page',
                ),
                SizedBox(
                  width: 10,
                ),
                CircleContainer(
                  color: greenColor,
                  iconData: Icons.trending_up_rounded,
                  title: 'Produk',
                  routeName: '/popular-page',
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
                      'Daftar Produk',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      'Segar dan Lokal',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
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
          )
        ],
      ),
    );
  }
}

class CircleContainer extends StatelessWidget {
  final Color color;
  final IconData iconData;
  final String title;
  final String routeName; // Parameter untuk menampung nama rute navigasi

  const CircleContainer({
    required this.color,
    required this.iconData,
    required this.title,
    required this.routeName, // Tambahkan parameter routeName
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(routeName);
      },
      child: Container(
        width: 70.0,
        height: 70.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: Colors.white,
              size: 24,
            ),
            SizedBox(height: 4.0),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
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
                      imageAsset: imageAsset,
                      productName: productName,
                      storeName: 'Nama Toko',
                      rating: rating,
                    ),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  imageAsset,
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
                  SizedBox(height: 4.0),
                  Text(
                    '\Rp. $price',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0),
            Align(
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
