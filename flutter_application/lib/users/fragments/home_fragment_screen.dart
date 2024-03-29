import 'package:flutter/material.dart';

class HomeFragmentScreen extends StatelessWidget {
  const HomeFragmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Image.asset(
          'images/Joe.jpg', // Replace with the path to your background image
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),

        // Content
        SingleChildScrollView(
          child: Column(
            children: [
              // Banner image
              Image.asset(
                'images/joe.png',
                fit: BoxFit.cover,
              ),

              // Sale categories
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCategoryItem('images/sale_banner.jpg', 'Category 1'),
                    _buildCategoryItem('images/sale_banner.jpg', 'Category 2'),
                    _buildCategoryItem('images/sale_banner.jpg', 'Category 3'),
                  ],
                ),
              ),

              // Featured products
              const SizedBox(height: 16.0),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Featured Products',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(
                            255, 2, 255, 179), // Change the text color to white
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    _buildProductItem(
                        'images/sale_banner.jpg', 'Product 1', '\$10.00'),
                    _buildProductItem(
                        'images/sale_banner.jpg', 'Product 2', '\$15.00'),
                    _buildProductItem(
                        'images/sale_banner.jpg', 'Product 3', '\$20.00'),
                  ],
                ),
              ),

              // Flash sale
              const SizedBox(height: 16.0),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Flash Sale',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(
                            255, 0, 255, 191), // Change the text color to white
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    _buildFlashSaleItem('images/sale_banner.jpg', 'Product 1',
                        '\$10.00', '\$5.00'),
                    _buildFlashSaleItem('images/sale_banner.jpg', 'Product 2',
                        '\$15.00', '\$7.50'),
                    _buildFlashSaleItem('images/sale_banner.jpg', 'Product 3',
                        '\$20.00', '\$10.00'),
                  ],
                ),
              ),

              // Newsletter subscription
              const SizedBox(height: 16.0),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Subscribe to our Newsletter',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(
                            255, 255, 0, 179), // Change the text color to white
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your email address',
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 116, 171,
                                223)), // Change the color of the hint text to white
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Subscribe'),
                    ),
                  ],
                ),
              ),

              // Social media links
              const SizedBox(height: 16.0),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset('images/sale_banner.jpg'),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset('images/sale_banner.jpg'),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset('images/sale_banner.jpg'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryItem(String imageUrl, String title) {
    return Column(
      children: [
        Image.asset(
          imageUrl,
          width: 150.0, // Increase the width
          height: 150.0, // Increase the height
        ),
        const SizedBox(height: 8.0),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18.0, // Increase the font size
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(
                255, 238, 134, 224), // Change the text color to white
          ),
        ),
      ],
    );
  }

  Widget _buildProductItem(String imageUrl, String title, String price) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Image.asset(
            imageUrl,
            width: 150.0, // Increase the width
            height: 150.0, // Increase the height
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18.0, // Increase the font size
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(
                        255, 4, 255, 255), // Change the text color to white
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 16.0, // Increase the font size
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Change the text color to white
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFlashSaleItem(
      String imageUrl, String title, String originalPrice, String salePrice) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Image.asset(
            imageUrl,
            width: 150.0, // Increase the width
            height: 150.0, // Increase the height
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18.0, // Increase the font size
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(
                        255, 0, 255, 221), // Change the text color to white
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    Text(
                      originalPrice,
                      style: const TextStyle(
                        fontSize: 16.0, // Increase the font size
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.white, // Change the text color to white
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      salePrice,
                      style: const TextStyle(
                        fontSize: 18.0, // Increase the font size
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Change the text color to white
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
}
