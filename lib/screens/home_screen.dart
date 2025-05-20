import 'package:flutter/material.dart';
import 'product_details_screen.dart';
import '../constants/color.dart';
import 'wishlist_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(),
            _buildBanner(),
            _buildCategorySection(),
            _buildFlashSaleSection(),
            _buildProductGrid(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Location', style: TextStyle(fontSize: 12, color: Colors.grey)),
          Row(
            children: [
              Icon(Icons.location_on, color: AppColors.primary, size: 16),
              Text('New York, USA', style: TextStyle(color: AppColors.text)),
              Icon(Icons.keyboard_arrow_down, color: AppColors.text),
            ],
          ),
        ],
      ),
      actions: [
        CircleAvatar(
          backgroundColor: AppColors.primary.withValues(alpha: 0.1),
          child: Icon(Icons.person, color: AppColors.primary),
        ),
        SizedBox(width: 16),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          suffixIcon: Icon(Icons.tune, color: AppColors.primary),
          filled: true,
          fillColor: AppColors.primary.withValues(alpha: 0.05),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildBanner() {
    final banners = [
      {
        'title': 'New Collection',
        'description': 'Discount 50% for the first transaction',
        'image': 'assets/images/banner.png',
      },
      {
        'title': 'Summer Sale',
        'description': 'Get up to 70% off on summer items',
        'image': 'assets/images/banner.png',
      },
      {
        'title': 'Flash Deal',
        'description': 'Limited time offers on selected items',
        'image': 'assets/images/banner.png',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        height: 200,
        child: PageView.builder(
          itemCount: banners.length,
          itemBuilder: (context, index) {
            final banner = banners[index];
            return Container(
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            banner['title']!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(banner['description']!),
                          SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text('Shop Now'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    child: Image.asset(banner['image']!, fit: BoxFit.cover),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCategorySection() {
    final categories = [
      {'icon': Icons.emoji_people, 'label': 'T-Shirt'},
      {'icon': Icons.checkroom, 'label': 'Pant'},
      {'icon': Icons.checkroom, 'label': 'Dress'},
      {'icon': Icons.checkroom, 'label': 'Jacket'},
    ];
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Category',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See All',
                    style: TextStyle(color: AppColors.primary, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: categories.length,
              separatorBuilder: (context, index) => SizedBox(width: 20),
              itemBuilder: (context, index) {
                final category = categories[index];
                return InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withValues(alpha: 0.2),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Icon(
                          category['icon'] as IconData,
                          color: AppColors.primary,
                          size: 28,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        category['label'] as String,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFlashSaleSection() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Flash Sale', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Filter:', style: TextStyle(color: Colors.grey)),
                Row(
                  children: [
                    _buildCountdownBox('02'),
                    Text(':'),
                    _buildCountdownBox('12'),
                    Text(':'),
                    _buildCountdownBox('56'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            // Filter buttons row
            SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildFilterButton('All', false),
                    SizedBox(width: 8),
                    _buildFilterButton('Newest', true),
                    SizedBox(width: 8),
                    _buildFilterButton('Popular', false),
                    SizedBox(width: 8),
                    _buildFilterButton('Man', false),
                    SizedBox(width: 8),
                    _buildFilterButton('Woman', false),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.primary),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : AppColors.primary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildCountdownBox(String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildProductGrid() {
    // Add your product grid here
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          return _buildProductCard(context);
        },
      ),
    );
  }

  Widget _buildProductCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductDetailsScreen()),
        );
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 200, maxHeight: 300),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.brown[50],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Expanded(child: Image.asset('assets/images/product.png')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Brown Jacket',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$83.97',
                          style: TextStyle(color: AppColors.primary),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            Text('4.9'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(32),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home_filled, true, 0, context),
          _buildNavItem(Icons.shopping_bag_outlined, false, 1, context),
          _buildNavItem(Icons.favorite_border, false, 2, context),
          _buildNavItem(Icons.chat_bubble_outline, false, 3, context),
          _buildNavItem(Icons.person_outline, false, 4, context),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    bool isSelected,
    int index,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () {
        if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WishlistScreen()),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isSelected ? AppColors.text : Colors.grey,
          size: 24,
        ),
      ),
    );
  }
}
