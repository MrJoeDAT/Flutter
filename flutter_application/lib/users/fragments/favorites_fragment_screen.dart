import 'package:flutter/material.dart';

class FavoriteFragmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> imagePaths = [
      'images/sale_banner.jpg',
      'images/register.jpeg',
      'images/sale_banner.jpg',
      'images/register.jpeg',
      // Add more image paths here
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Header
            Text(
              'Your Favorites',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),

            // Favorite Items List
            Expanded(
              child: ListView.builder(
                itemCount: imagePaths.length,
                itemBuilder: (context, index) {
                  return _buildFavoriteItem(
                      'Product ${index + 1}', imagePaths[index]);
                },
              ),
            ),

            // Decorative Element
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              height: 1.0,
              color: Colors.grey,
            ),

            // Action Button
            ElevatedButton(
              onPressed: () {
                // Add your custom action here
              },
              child: Text('Clear All Favorites'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteItem(String itemName, String imagePath) {
    return Card(
      elevation: 3.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Image.asset(imagePath),
        title: Text(itemName),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            // Add your delete action here
          },
        ),
      ),
    );
  }
}


/*
import 'package:flutter/material.dart';

class FavoriteFragmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Favorites'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset('images/sale_banner.jpg'),
            title: Text('Product Title'),
            subtitle: Text('Product Description'),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite),
              color: const Color.fromARGB(255, 54, 20, 17),
            ),
          );
        },
      ),
    );
  }
}




import 'package:flutter/material.dart';

class FavoriteFragmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        backgroundColor: Colors.blue, // Change the color as needed
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Header
            Text(
              'Your Favorites',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),

            // Favorite Items List
            Expanded(
              child: ListView(
                children: [
                  _buildFavoriteItem('Product 1'),
                  _buildFavoriteItem('Product 2'),
                  _buildFavoriteItem('Product 3'),
                  // Add more favorite items as needed
                ],
              ),
            ),

            // Decorative Element
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              height: 1.0,
              color: Colors.grey,
            ),

            // Action Button
            ElevatedButton(
              onPressed: () {
                // Add your custom action here
              },
              child: Text('Clear All Favorites'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteItem(String itemName) {
    return Card(
      elevation: 3.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(Icons.favorite, color: Colors.red),
        title: Text(itemName),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            // Add your delete action here
          },
        ),
      ),
    );
  }
}
*/