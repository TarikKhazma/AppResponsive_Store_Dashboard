import 'package:flutter/material.dart';
import '../../../core/constants/app_size.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/theme/app_text_style.dart';
import '../models/product_model.dart';
import 'product_image_widget.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onEdit;

  const ProductCard({super.key, required this.product, this.onEdit});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: AppSize.cardMaxWidth),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.surface,
          borderRadius: BorderRadius.circular(AppSize.radiusL),
          border: Border.all(color: AppColor.cardBorder),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: AppSize.s8,
              offset: const Offset(0, AppSize.s2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ProductImageWidget(imageUrl: product.imageUrl),
            Padding(
              padding: const EdgeInsets.all(AppSize.s12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: AppTextStyle.labelMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppSize.s4),
                  Text(product.category, style: AppTextStyle.bodySmall),
                  const SizedBox(height: AppSize.s10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: AppTextStyle.price,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      GestureDetector(
                        onTap: onEdit,
                        child: const Icon(
                          Icons.edit_outlined,
                          size: AppSize.iconS,
                          color: AppColor.iconMuted,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
