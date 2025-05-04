import 'package:flutter/material.dart';
import '../widgets/animated_arrow.dart';
import 'home_screen.dart';
import 'search_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final List<Map<String, dynamic>> _locations = [
    {
      "name": "1st Floor Entrance",
      "imagePath": "assets/images/1st_floor/forward_path/VIT_entrance.webp",
      "direction": 0,
    },
    {
      "name": "1st Floor Path",
      "imagePath": "assets/images/1st_floor/forward_path/m-Block.webp",
      "direction": 90,
    },
    {
      "name": "2nd Floor Entrance",
      "imagePath": "assets/images/2nd_floor/forward_path/2nd_floor_entrance.webp",
      "direction": 180,
    },
    {
      "name": "2nd Floor Room",
      "imagePath": "assets/images/2nd_floor/forward_path/2nd_floor_corridor.webp",
      "direction": 270,
    },
  ];

  int _currentIndex = 0;

  void _goToNextLocation() {
    if (_currentIndex < _locations.length - 1) {
      setState(() {
        _currentIndex++;
      });
    }
  }

  void _goToPreviousLocation() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text("Campus Navigation"),
        backgroundColor: const Color(0xFFB5EAEA),
        elevation: 0,
      ),
      drawer: _buildAppDrawer(context),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                InteractiveViewer(
                  minScale: 1.0,
                  maxScale: 4.0,
                  child: Image.asset(
                    _locations[_currentIndex]["imagePath"],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Text("Image not found!", style: TextStyle(color: Colors.red, fontSize: 18)),
                      );
                    },
                  ),
                ),
                Center(
                  child: AnimatedArrow(
                    direction: (_locations[_currentIndex]["direction"] as num).toDouble(),
                    size: 100,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.teal[300]!, width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    "Current Step: ${_locations[_currentIndex]['name']}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[900],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: _currentIndex == 0 ? null : _goToPreviousLocation,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFAC898),
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Previous",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _currentIndex == _locations.length - 1 ? null : _goToNextLocation,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFAC898),
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Next",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFFB5EAEA)),
            child: Text(
              'Campus Navigator',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text('Search'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
