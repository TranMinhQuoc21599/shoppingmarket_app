import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Product Details', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageCarousel(),
            _buildProductInfo(),
            _buildSizeSelector(),
            _buildColorSelector(),
            _buildPriceAndAddToCart(),
          ],
        ),
      ),
    );
  }

  Widget _buildImageCarousel() {
    return SizedBox(
      height: 300,
      child: PageView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Image.asset('assets/images/product.png', fit: BoxFit.cover);
        },
      ),
    );
  }

  Widget _buildProductInfo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Light Brown Jacket',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 16),
              SizedBox(width: 4),
              Text('4.5', style: TextStyle(color: Colors.grey)),
            ],
          ),
          SizedBox(height: 8),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildSizeSelector() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Select Size', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Row(
            children:
                ['S', 'M', 'L', 'XL', 'XXL', 'XXXL'].map((size) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      label: Text(size),
                      selected: false,
                      onSelected: (selected) {},
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildColorSelector() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Select Color', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Row(
            children:
                [
                  Colors.brown,
                  Colors.black,
                  Colors.grey,
                  Colors.orange,
                  Colors.white,
                ].map((color) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CircleAvatar(backgroundColor: color, radius: 16),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceAndAddToCart() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            " \$83.97",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.brown,
            ),
            // style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.brown,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
