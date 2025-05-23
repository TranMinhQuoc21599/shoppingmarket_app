import 'package:flutter/material.dart';
import '../constants/color.dart';
import '../widgets/app_bottom_nav_bar.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final List<Map<String, dynamic>> wishlistItems = [
    {
      'image': 'assets/images/screen/img1.png',
      'title': 'Brown Jacket',
      'price': ' 24.9',
      'rating': 4.9,
      'category': 'Jacket',
      'isFavorite': true,
    },
    {
      'image': 'assets/images/screen/img2.png',
      'title': 'Brown Suite',
      'price': ' 120.00',
      'rating': 5.0,
      'category': 'Jacket',
      'isFavorite': true,
    },
    {
      'image': 'assets/images/screen/img3.png',
      'title': 'Brown Jacket',
      'price': ' 24.9',
      'rating': 4.9,
      'category': 'Jacket',
      'isFavorite': true,
    },
    {
      'image': 'assets/images/screen/img4.png',
      'title': 'Yellow Shirt',
      'price': ' 120.00',
      'rating': 5.0,
      'category': 'Shirt',
      'isFavorite': true,
    },
    {
      'image': 'assets/images/screen/img5.png',
      'title': 'Brown Shirt',
      'price': ' 24.9',
      'rating': 4.9,
      'category': 'Shirt',
      'isFavorite': true,
    },
    {
      'image': 'assets/images/screen/img1.png',
      'title': 'Brown Hoodie',
      'price': ' 120.00',
      'rating': 5.0,
      'category': 'T-Shirt',
      'isFavorite': true,
    },
  ];

  final List<String> filters = ['All', 'Jacket', 'Shirt', 'Pant', 'T-Shirt'];
  int selectedFilter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.text),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('My Wishlist', style: TextStyle(color: AppColors.text)),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: List.generate(filters.length, (index) {
                final isSelected = selectedFilter == index;
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color:
                            isSelected ? AppColors.primary : Colors.transparent,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: AppColors.primary),
                      ),
                      child: Text(
                        filters[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                itemCount: wishlistItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final item = wishlistItems[index];
                  if (selectedFilter != 0 &&
                      item['category'] != filters[selectedFilter]) {
                    return SizedBox.shrink();
                  }
                  return Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                item['image'],
                                height: 120,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['title'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Text(
                                        item['price'],
                                        style: TextStyle(
                                          color: AppColors.primary,
                                        ),
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 16,
                                      ),
                                      Text(item['rating'].toString()),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.favorite, color: AppColors.primary),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: AppBottomNavBar(selectedIndex: 2),
    );
  }
}
