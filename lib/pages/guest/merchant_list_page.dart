import 'package:flutter/material.dart';
import 'package:geotagging_marketplace_mobile/pages/guest/detail_merchant_page.dart';

class MerchantListPage extends StatefulWidget {
  @override
  _MerchantListPageState createState() => _MerchantListPageState();
}

class _MerchantListPageState extends State<MerchantListPage> {
  // List merchant dalam format List<Map<String, dynamic>>
  final List<Map<String, dynamic>> merchants = [
    {
      'name': 'Tani Sejahtera',
      'description': 'Menyediakan sayur organik segar',
      'imageUrl': 'assets/img/mplc1.jpeg',
      'products': [
        {
          'imageAsset': 'assets/img/sayur4.jpeg',
          'productName': 'Sawi',
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
      ],
    },
    {
      'name': 'Bumi Tani',
      'description': 'Pusat buah-buahan lokal',
      'imageUrl': 'assets/img/mplc2.jpeg',
      'products': [
        {
          'imageAsset': 'assets/img/sayur5.jpeg',
          'productName': 'Bayam',
          'category': 'Sayur',
          'rating': 4.3,
          'price': '10.000',
        },
      ],
    },
    // Add more merchants as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Merchant'),
      ),
      body: ListView.builder(
        itemCount: merchants.length,
        itemBuilder: (context, index) {
          return _buildMerchantCard(context, merchants[index]);
        },
      ),
    );
  }

  Widget _buildMerchantCard(
      BuildContext context, Map<String, dynamic> merchant) {
    return Card(
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          // Navigate to merchant details page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailMerchantPage(merchant: merchant),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                merchant['imageUrl'],
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    merchant['name'],
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 5),
                  Text(
                    merchant['description'],
                    style: Theme.of(context).textTheme.subtitle1,
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
