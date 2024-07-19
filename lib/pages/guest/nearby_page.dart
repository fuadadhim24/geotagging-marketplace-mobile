import 'package:flutter/material.dart';
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
    Shop(name: 'Sumber Berkah', lat: -8.157880163129507, lng: 113.71551068969013), 
    Shop(name: 'Toko Bismillah', lat: -8.164902213736438, lng: 113.71903212063916), 
    Shop(name: 'Senyum Shop', lat: -8.151565264056527, lng: 113.71622518292615), 
  ];

  CameraPosition initialPosition = CameraPosition(
    target: LatLng(-8.155657330030706, 113.7208693889604), 
    zoom: 14.0,
  );

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
      // Highlight item dalam daftar
      setState(() {
        highlightedIndex = index;
      });
    }

    // Set camera position to the marker
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
      ),
      body: Column(
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
                  _prevMarkerId = null;
                }
              },
            ),
          ),
          _buildPanel(),
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
                    color: highlightedIndex == index ? Colors.blue : Colors.black,
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
}

class Shop {
  final String name;
  final double lat;
  final double lng;

  Shop({required this.name, required this.lat, required this.lng});
}
