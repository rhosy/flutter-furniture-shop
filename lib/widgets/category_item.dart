import 'package:flutter/material.dart';
import 'package:furniture_shop/utils/theme.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final bool isSelected;

  const CategoryItem({
    super.key,
    required this.name,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8, bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: isSelected ? blackColor : greyColor),
      child: Text(
        name,
        style: blackTextStyle.copyWith(
          fontWeight: bold,
          color: isSelected ? whiteColor : blackColor,
        ),
      ),
    );
  }
}
