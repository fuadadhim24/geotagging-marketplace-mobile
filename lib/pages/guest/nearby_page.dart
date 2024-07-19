import 'package:flutter/material.dart';
import 'package:geotagging_marketplace_mobile/shared/theme.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NearbyPage extends StatefulWidget {
  @override
  _NearbyPageState createState() => _NearbyPageState();
}

class _NearbyPageState extends State<NearbyPage> {
  late GoogleMapController mapController;
  late ScrollController listScrollController;
  MarkerId? _prevMarkerId;

  final List<Shop> nearbyShops = [
    Shop(name: 'Toko Bu Sri', lat: -8.16154812072812, lng: 113.72336297342689),
    Shop(name: 'Endang Shop', lat: -8.153939677807593, lng: 113.72530945407004),
    Shop(name: 'Tani Jaya', lat: -8.163868500436212, lng: 113.72403625594559),
    Shop(
        name: 'Sumber Berkah',
        lat: -8.157880163129507,
        lng: 113.71551068969013),
    Shop(
        name: 'Toko Bismillah',
        lat: -8.164902213736438,
        lng: 113.71903212063916),
    Shop(name: 'Senyum Shop', lat: -8.151565264056527, lng: 113.71622518292615),
  ];

  CameraPosition initialPosition = CameraPosition(
    target: LatLng(-8.155657330030706, 113.7208693889604),
    zoom: 14.0,
  );

  int? selectedShopIndex;
  int highlightedIndex = -1;

  void _onMarkerTapped(Shop shop) {
    if (_prevMarkerId != null) {
      mapController.hideMarkerInfoWindow(_prevMarkerId!);
    }
    mapController.showMarkerInfoWindow(MarkerId(shop.name));
    _prevMarkerId = MarkerId(shop.name);

    // Cari indeks toko yang bersangkutan
    int index = nearbyShops.indexWhere((s) => s.name == shop.name);
    if (index != -1) {
      // Auto scroll daftar toko
      _scrollToIndex(index);
      // Set state untuk mengatur selectedShopIndex
      setState(() {
        selectedShopIndex = index;
        highlightedIndex = index;
      });
    }

    // Set camera position ke marker yang dipilih
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(shop.lat, shop.lng),
          zoom: 15.0,
        ),
      ),
    );
  }

  void _scrollToIndex(int index) {
    // Calculate scroll position
    double scrollPosition = index * 72.0; // Height of each ListTile

    // Scroll the ListView
    listScrollController.animateTo(
      scrollPosition,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    listScrollController = ScrollController();
  }

  @override
  void dispose() {
    listScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disekitar'),
        actions: [
          if (selectedShopIndex != null)
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                setState(() {
                  selectedShopIndex = null;
                });
              },
            ),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: GoogleMap(
                    initialCameraPosition: initialPosition,
                    onMapCreated: (GoogleMapController controller) {
                      mapController = controller;
                    },
                    markers: _buildMarkers(),
                    onTap: (LatLng latLng) {
                      if (_prevMarkerId != null) {
                        mapController.hideMarkerInfoWindow(_prevMarkerId!);
                        setState(() {
                          selectedShopIndex = null;
                        });
                        _prevMarkerId = null;
                      }
                    },
                  ),
                ),
                _buildPanel(),
              ],
            ),
          ),
          if (selectedShopIndex != null) _buildSelectedShopInfo(),
        ],
      ),
    );
  }

  Set<Marker> _buildMarkers() {
    return nearbyShops
        .map(
          (shop) => Marker(
            markerId: MarkerId(shop.name),
            position: LatLng(shop.lat, shop.lng),
            infoWindow: InfoWindow(
              title: shop.name,
            ),
            onTap: () => _onMarkerTapped(shop),
          ),
        )
        .toSet();
  }

  Widget _buildPanel() {
    return Expanded(
      child: ListView.builder(
        controller: listScrollController,
        itemCount: nearbyShops.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text(
                  nearbyShops[index].name,
                  style: TextStyle(
                    color:
                        highlightedIndex == index ? Colors.blue : Colors.black,
                  ),
                ),
                onTap: () {
                  _onMarkerTapped(nearbyShops[index]);
                },
              ),
              Divider(
                height: 1.0,
                color: Colors.grey,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSelectedShopInfo() {
    Shop selectedShop = nearbyShops[selectedShopIndex!];

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  selectedShop.name,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Review: Memiliki komitmen dalam memberikan pelayanan dan kualitas produk tani yang segar dan berkualitas.',
                  style: TextStyle(fontSize: 14.0),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    print('View products button pressed');
                  },
                  child: Text('Daftar Produk'),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          _buildProductContainer(
            title: 'Produk Populer',
            products: ['Sawi', 'Wortel', 'PakCoy'],
            img: ['assets/img/sayur5.jpeg', 'assets/img/sayur2.jpeg', 'assets/img/sayur8.jpeg'],
          ),
          SizedBox(height: 16.0),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.chat_outlined, color: greenColor),
                  SizedBox(width: 8.0),
                  Text(
                    'Hubungi WA',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }

  Widget _buildProductContainer(
      {required String title, required List<String> products, required List<String> img}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.0),
        Container(
          height: 100.0,
          margin: EdgeInsets.symmetric(horizontal: 18),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(right: 10),
                child: Column(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.all(8.0),
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(img[index]),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5)),
                      ),
                      child: Column(
                        children: [
                          Text(products[index]),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class Shop {
  final String name;
  final double lat;
  final double lng;

  Shop({required this.name, required this.lat, required this.lng});
}

void navigateToNearby(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => NearbyPage(),
    ),
  );
}
