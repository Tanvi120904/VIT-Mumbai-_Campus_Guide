import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'navigation_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
        backgroundColor: const Color(0xFFB5EAEA),
      ),
      drawer: _buildAppDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: "Enter location name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFAC898),
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                final query = _searchController.text.trim();
                // TODO: Implement actual search logic
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Searching for: $query"),
                  ),
                );
              },
              child: const Text(
                "Search",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
              ),
            ),
          ],
        ),
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
            leading: const Icon(Icons.map),
            title: const Text('Navigation'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NavigationScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
