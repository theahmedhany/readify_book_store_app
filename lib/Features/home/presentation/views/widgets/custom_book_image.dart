import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:readify_book_store_app/Features/home/presentation/views/widgets/no_book_cover.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: imageUrl.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: imageUrl,
                errorWidget: (context, url, error) => const NoBookCover(),
                fit: BoxFit.fill,
              )
            : const NoBookCover(),
      ),
    );
  }
}
