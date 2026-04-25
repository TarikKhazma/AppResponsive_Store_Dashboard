import 'package:flutter/material.dart';
import '../../../core/constants/app_size.dart';
import '../../../core/theme/app_color.dart';

class ProductImageWidget extends StatelessWidget {
  final String imageUrl;

  const ProductImageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(AppSize.radiusL)),
      child: AspectRatio(
        aspectRatio: AppSize.imageRatio,
        child: Image.asset(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => Container(
            color: AppColor.background,
            child: const Center(
              child: Icon(
                Icons.image_not_supported_outlined,
                color: AppColor.iconMuted,
                size: AppSize.iconL,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
