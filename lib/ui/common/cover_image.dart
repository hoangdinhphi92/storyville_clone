import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:storyville_clone/gen/assets.gen.dart';

class CoverImage extends StatelessWidget {
  final String coverUrl;

  const CoverImage({
    super.key,
    required this.coverUrl,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: coverUrl,
      fit: BoxFit.cover,
      errorWidget: (context, url, error) {
        return const CoverPlaceholder();
      },
      placeholder: (context, url) {
        return const CoverPlaceholder();
      },
    );
  }
}

class CoverPlaceholder extends StatelessWidget {
  const CoverPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Assets.images.coverPlaceholder.image(fit: BoxFit.cover),
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
            child: Container(
              color: Colors.white.withOpacity(0.2),
            ),
          ),
        ),
      ],
    );
  }
}
