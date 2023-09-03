import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furniture_shop/utils/svg_icon.dart';
import 'package:furniture_shop/utils/theme.dart';
import 'package:furniture_shop/widgets/category_item.dart';
import 'package:furniture_shop/widgets/product_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List products = [];
  @override
  void initState() {
    fetchProducts();
    super.initState();
  }

  Future<void> fetchProducts() async {
    final String response =
        await rootBundle.loadString('assets/json/products.json');
    final data = await jsonDecode(response);
    setState(() {
      products = data['products'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          buildHeader(context),
          buildSearch(context),
          buildCategories(context),
          buildProducts(context, products),
        ],
      ),
    );
  }
}

Widget buildHeader(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Best Furniture",
          style: blackTextStyle.copyWith(
            fontWeight: extraBold,
            fontSize: 30,
          ),
        ),
        Text(
          "Perfect Choice!",
          style: blackTextStyle.copyWith(
            fontWeight: medium,
            fontSize: 18,
          ),
        ),
      ],
    ),
  );
}

Widget buildSearch(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Flexible(
          child: Container(
            padding: const EdgeInsets.only(
              left: 16,
              top: 4,
              bottom: 4,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: whiteColor,
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                  hintText: "Search...",
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  suffixIcon: Icon(Icons.search)),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: whiteColor,
          ),
          child: IconButton(onPressed: () {}, icon: const SvgIcon('Filter')),
        )
      ],
    ),
  );
}

Widget buildCategories(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.only(left: 20),
    child: Row(
      children: [
        CategoryItem(
          name: "All",
          isSelected: true,
        ),
        CategoryItem(
          name: "Chair",
          isSelected: false,
        ),
        CategoryItem(
          name: "Table",
          isSelected: false,
        ),
        CategoryItem(
          name: "Lamp",
          isSelected: false,
        ),
        CategoryItem(
          name: "Floor",
          isSelected: false,
        ),
      ],
    ),
  );
}

Widget buildProducts(BuildContext context, List products) {
  return Column(
    children: products
        .map((e) => ProductItem(
              name: e["name"],
              image: e["image"],
              created: e["created_by"],
              price: e["price"],
              description: e["description"],
              isFavourite: e['isFavourite'],
            ))
        .toList(),
  );
}
