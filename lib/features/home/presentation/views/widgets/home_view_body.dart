import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9FAFB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const CustomHomeAppBar(),
              const SizedBox(height: 16),
              const SearchBarWidget(),
              const SizedBox(height: 16),
              const BannerWidget(),
              const SizedBox(height: 16),
              SectionHeader(
                title: "Popular Product",
                onViewAll: () {},
              ),
              const SizedBox(height: 8),
              const PopularProductsList(),
              const SizedBox(height: 16),
              SectionHeader(
                title: "Category",
                onViewAll: () {},
              ),
              const SizedBox(height: 8),
              const CategoriesGrid(),
              const SizedBox(height: 16),
              SectionHeader(
                title: "Best For You",
                onViewAll: () {},
              ),
              const SizedBox(height: 8),
              const BestForYouList(),
              const SizedBox(height: 16),
              SectionHeader(
                title: "Brands",
                onViewAll: () {},
              ),
              const SizedBox(height: 8),
              const BrandsList(),
              const SizedBox(height: 16),
              SectionHeader(
                title: "Buy Again",
                onViewAll: () {},
              ),
              const SizedBox(height: 8),
              const BuyAgainList(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////
/// APP BAR
//////////////////////////////////////////////////////////
class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("assets/images/profile.jpg"),
            ),
            const SizedBox(width: 10),
            Text(
              "Hi Yousef!",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),

          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_outlined),
        )
      ],
    );
  }
}

//////////////////////////////////////////////////////////
/// SEARCH BAR
//////////////////////////////////////////////////////////
class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "What are you looking for?",
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////
/// BANNER
//////////////////////////////////////////////////////////
class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: AssetImage("assets/images/banner.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////
/// SECTION HEADER
//////////////////////////////////////////////////////////
class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onViewAll;

  const SectionHeader({
    super.key,
    required this.title,
    required this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold)),
        TextButton(
          onPressed: onViewAll,
          child: const Text("View all"),
        ),
      ],
    );
  }
}

//////////////////////////////////////////////////////////
/// POPULAR PRODUCTS
//////////////////////////////////////////////////////////
class PopularProductsList extends StatelessWidget {
  const PopularProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {"name": "Smart Watch", "price": "499 LE", "image": "assets/images/watch.png"},
      {"name": "iPhone 11 Pro", "price": "18999 LE", "image": "assets/images/iphone.png"},
    ];

    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final product = products[index];
          return Container(
            width: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 4))
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(product["image"]!, height: 120, fit: BoxFit.cover),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(product["name"]!,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(product["price"]!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

//////////////////////////////////////////////////////////
/// CATEGORIES GRID
//////////////////////////////////////////////////////////
class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> categories = [
      {"name": "Pampers", "image": "assets/images/pampers.png"},
      {"name": "Electronics", "image": "assets/images/electronics.png"},
      {"name": "Plants", "image": "assets/images/plants.png"},
      {"name": "Phones", "image": "assets/images/phone.png"},
      {"name": "Food", "image": "assets/images/food.png"},
      {"name": "Fashion", "image": "assets/images/fashion.png"},
    ];

    return GridView.builder(
      itemCount: categories.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.85,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        final category = categories[index];
        return Column(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.blue.withOpacity(0.1),
              ),
              child: Image.asset(category["image"]!),
            ),
            const SizedBox(height: 6),
            Text(category["name"]!,
                style: const TextStyle(fontWeight: FontWeight.w500)),
          ],
        );
      },
    );
  }
}

//////////////////////////////////////////////////////////
/// BEST FOR YOU LIST
//////////////////////////////////////////////////////////
class BestForYouList extends StatelessWidget {
  const BestForYouList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> bestForYou = [
      {"name": "Black JBL Airpods", "price": "799 LE", "image": "assets/images/airpods.png"},
      {"name": "Sony Smart TV 55 Inch", "price": "13999 LE", "image": "assets/images/tv.png"},
    ];

    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: bestForYou.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final product = bestForYou[index];
          return Container(
            width: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 4))
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(product["image"]!, height: 120, fit: BoxFit.cover),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(product["name"]!,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(product["price"]!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

//////////////////////////////////////////////////////////
/// BRANDS LIST
//////////////////////////////////////////////////////////
class BrandsList extends StatelessWidget {
  const BrandsList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> brands = [
      "assets/images/townteam.png",
      "assets/images/jbl.png",
      "assets/images/sony.png",
    ];

    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: brands.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return Container(
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 4))
              ],
            ),
            child: Image.asset(brands[index], fit: BoxFit.contain),
          );
        },
      ),
    );
  }
}

//////////////////////////////////////////////////////////
/// BUY AGAIN LIST
//////////////////////////////////////////////////////////
class BuyAgainList extends StatelessWidget {
  const BuyAgainList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> buyAgain = [
      {"name": "Black Sony Headphone", "price": "399 LE", "image": "assets/images/headphone.png"},
      {"name": "HP Chromebook Laptop", "price": "14999 LE", "image": "assets/images/laptop.png"},
    ];

    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: buyAgain.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final product = buyAgain[index];
          return Container(
            width: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 4))
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(product["image"]!, height: 120, fit: BoxFit.cover),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(product["name"]!,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(product["price"]!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

