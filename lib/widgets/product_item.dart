import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shop/utils/svg_icon.dart';
import 'package:furniture_shop/utils/theme.dart';

class ProductItem extends StatelessWidget {
  final String name;
  final String image;
  final String created;
  final String price;
  final String description;
  final bool isFavourite;
  const ProductItem({
    super.key,
    required this.name,
    required this.image,
    required this.created,
    required this.price,
    required this.description,
    this.isFavourite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 20, top: 8, right: 20, bottom: 8),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.0),
        color: whiteColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: greyColor,
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: CachedNetworkImage(
                    height: 160,
                    width: 120,
                    imageUrl: image,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: Padding(
                        padding: EdgeInsets.all(32.0),
                        child: CupertinoActivityIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.image_not_supported),
                  ),
                ),
                Positioned(
                  right: 8,
                  child: Container(
                    width: 30,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: whiteColor,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgIcon(
                        'Heart',
                        color: isFavourite ? redColor : Colors.grey,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: blackTextStyle.copyWith(
                      fontWeight: extraBold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    created,
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    description,
                    maxLines: 2,
                    style: blackTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: blackTextStyle.copyWith(
                            fontWeight: extraBold, fontSize: 18),
                      ),
                      FilledButton(
                        onPressed: () {},
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(blackColor),
                          fixedSize: MaterialStatePropertyAll(Size(75, 16)),
                        ),
                        child: Text(
                          "Buy",
                          style: whiteTextStyle.copyWith(
                            fontWeight: bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
