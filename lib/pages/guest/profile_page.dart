import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.0),
            ExpansionTile(
              title: Text(
                'Alur Pembelian Produk Tani:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                _buildStep('Cari produk tani yang Anda inginkan.', 1),
                _buildStep('Tambahkan produk ke keranjang belanja.', 2),
                _buildStep('Lanjutkan ke proses pembayaran.', 3),
                _buildStep(
                    'Selesaikan pembayaran dan tunggu produk dikirim.', 4),
              ],
            ),
            SizedBox(height: 20.0),
            ExpansionTile(
              title: Text(
                'Tentang Kami:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Text(
                  'Aplikasi ini membantu Anda menemukan produk tani dari penjual terdekat dengan mudah.',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text('Voucher gratis ongkir 100%'),
                    Text('Menunggu Kamu!'),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(String text, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30.0,
            height: 30.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: Center(
              child: Text(
                index.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}

void navigateToProfile(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ProfilePage(),
    ),
  );
}