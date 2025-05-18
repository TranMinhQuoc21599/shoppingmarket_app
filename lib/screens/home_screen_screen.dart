import 'package:flutter/material.dart';
import 'product_details_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      bottomNavigationBar: _buildBottomNavBar(),
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
              Icon(Icons.location_on, color: Colors.brown, size: 16),
              Text('New York, USA', style: TextStyle(color: Colors.black)),
              Icon(Icons.keyboard_arrow_down, color: Colors.black),
            ],
          ),
        ],
      ),
      actions: [
        CircleAvatar(
          backgroundColor: Colors.brown[100],
          child: Icon(Icons.person, color: Colors.brown),
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
          suffixIcon: Icon(Icons.tune, color: Colors.brown),
          filled: true,
          fillColor: Colors.brown[50],
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
                color: Colors.brown[100],
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
                              backgroundColor: Colors.brown,
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
                    style: TextStyle(color: Colors.brown, fontSize: 16),
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
                          color: Colors.brown[100],
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.brown.withOpacity(0.2),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Icon(
                          category['icon'] as IconData,
                          color: Colors.brown,
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
      child: DefaultTabController(
        length: 3,
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
                  Text('Ends in:', style: TextStyle(color: Colors.grey)),
                  Row(
                    children: [
                      _buildCountdownBox('01'),
                      Text(':'),
                      _buildCountdownBox('23'),
                      Text(':'),
                      _buildCountdownBox('45'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                child: TabBar(
                  tabs: [
                    Tab(text: 'All'),
                    Tab(text: 'Clothing'),
                    Tab(text: 'Electronics'),
                  ],
                  labelColor: Colors.brown,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.brown,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCountdownBox(String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.brown[100],
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
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(),
          ),
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
                        Text('\$83.97', style: TextStyle(color: Colors.brown)),
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

  Widget _buildBottomNavBar() {
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
          _buildNavItem(Icons.home_filled, true),
          _buildNavItem(Icons.shopping_bag_outlined, false),
          _buildNavItem(Icons.favorite_border, false),
          _buildNavItem(Icons.chat_bubble_outline, false),
          _buildNavItem(Icons.person_outline, false),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, bool isSelected) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: isSelected ? Colors.black : Colors.grey,
        size: 24,
      ),
    );
  }
}
