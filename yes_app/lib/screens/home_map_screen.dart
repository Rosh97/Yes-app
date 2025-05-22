import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import '../core/widgets/animated_gradient_background.dart';

class HomeMapScreen extends StatefulWidget {
  const HomeMapScreen({super.key});

  @override
  State<HomeMapScreen> createState() => _HomeMapScreenState();
}

class _HomeMapScreenState extends State<HomeMapScreen> {
  late MapboxMapController mapController;
  final String _mapboxAccessToken =
      'pk.eyJ1Ijoicm9zaDk3IiwiYSI6ImNtMnM3emU5NTFtaGYycXE1N3BoNjhjMHgifQ.i_FBipIOO3I3jfk8jPt4eg';

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  bool isHomeSelected = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            MapboxMap(
              accessToken: _mapboxAccessToken,
              onMapCreated: _onMapCreated,
              initialCameraPosition: const CameraPosition(
                target: LatLng(37.7749, -122.4194),
                zoom: 12.0,
              ),
              myLocationEnabled: true,
              myLocationTrackingMode: MyLocationTrackingMode.Tracking,
              styleString: MapboxStyles.MAPBOX_STREETS,
            ),

            // Top Bar
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Profile Icon
                    GestureDetector(
                      onTap: () {
                        // TODO: Navigate to profile
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                    ),

                    // Toggle Switch
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: ToggleButtons(
                        isSelected: [isHomeSelected, !isHomeSelected],
                        onPressed: (index) {
                          setState(() => isHomeSelected = index == 0);
                          if (!isHomeSelected) {
                            Navigator.pushNamed(context, '/preferences');
                          }
                        },
                        borderRadius: BorderRadius.circular(20),
                        selectedColor: Colors.black,
                        color: Colors.grey,
                        fillColor: Colors.white,
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text('Home'),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text('Adventures'),
                          ),
                        ],
                      ),
                    ),

                    // Settings Icon
                    GestureDetector(
                      onTap: () {
                        // TODO: Open settings
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.settings, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Search Bar
            Positioned(
              left: 16,
              right: 16,
              bottom: 24,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  onChanged: (value) {
                    // TODO: Filter map events by keyword
                  },
                  decoration: const InputDecoration(
                    hintText: 'Search events...',
                    border: InputBorder.none,
                    icon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}