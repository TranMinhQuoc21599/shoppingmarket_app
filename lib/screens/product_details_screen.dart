import 'dart:math';
import 'package:flutter/material.dart';
import '../constants/color.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int selectedColorIndex = 0;
  int selectedSizeIndex = 0;
  final List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL', 'XXXL'];
  final List<Color> colors = [
    AppColors.productBeige,
    AppColors.productLightBrown,
    AppColors.productMediumBrown,
    AppColors.productOrangeBrown,
    AppColors.productBlack,
  ];

  final List<String> screenImages = [
    'assets/images/screen/img1.png',
    'assets/images/screen/img2.png',
    'assets/images/screen/img3.png',
    'assets/images/screen/img4.png',
    'assets/images/screen/img5.png',
  ];

  String getRandomScreenImage() {
    final random = Random();
    return screenImages[random.nextInt(screenImages.length)];
  }

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
        title: Text('Product Details', style: TextStyle(color: AppColors.text)),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: AppColors.text),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImageCarousel(),
                _buildProductInfo(),
                _buildSizeSelector(),
                _buildColorSelector(),
                SizedBox(height: 100),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildPriceAndAddToCart(),
          ),
        ],
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
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.text,
            ),
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
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(sizes.length, (index) {
              return ChoiceChip(
                label: Text(sizes[index]),
                selected: selectedSizeIndex == index,
                onSelected: (selected) {
                  setState(() {
                    selectedSizeIndex = index;
                  });
                },
                selectedColor: AppColors.primary.withValues(alpha: .15),
                labelStyle: TextStyle(
                  color:
                      selectedSizeIndex == index
                          ? AppColors.primary
                          : AppColors.text,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color:
                        selectedSizeIndex == index
                            ? AppColors.primary
                            : Colors.grey.shade300,
                  ),
                ),
              );
            }),
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
          Text(
            'Select Color',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.text,
            ),
          ),
          SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(colors.length, (index) {
                final color = colors[index];
                final isSelected = selectedColorIndex == index;
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedColorIndex = index;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: color,
                      radius: 18,
                      foregroundColor:
                          isSelected && color == Colors.black
                              ? Colors.white
                              : null,
                      child:
                          isSelected
                              ? Icon(
                                Icons.check,
                                color:
                                    color == Colors.black
                                        ? Colors.white
                                        : AppColors.primary,
                                size: 18,
                              )
                              : null,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceAndAddToCart() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.background,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              "${sizes[selectedSizeIndex]} | \$83.97",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
            child: Row(
              children: [
                Icon(Icons.add_shopping_cart, color: AppColors.buttonText),
                SizedBox(width: 8),
                Text(
                  'Add to Cart',
                  style: TextStyle(
                    color: AppColors.buttonText,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
