import 'package:flutter/material.dart';
import '../../../core/constants/app_string.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/theme/app_text_style.dart';

class HeaderWidget extends StatelessWidget {
  final bool isWide;
  final VoidCallback? onMenuTap;
  final VoidCallback? onAddProduct;

  const HeaderWidget({
    super.key,
    required this.isWide,
    this.onMenuTap,
    this.onAddProduct,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isWide) ...[
              IconButton(
                icon: const Icon(Icons.menu, color: AppColor.textPrimary),
                onPressed: onMenuTap,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const SizedBox(width: 12),
            ],

            // -----------Title + subtitle---------
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.productInventory,
                    style: AppTextStyle.headlineLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppString.manageCatalog,
                    style: AppTextStyle.bodyMedium.copyWith(
                      color: AppColor.unselectedNavText,
                    ),
                  ),
                ],
              ),
            ),

            // Add New Product button 
            if (isWide) ...[
              const SizedBox(width: 16),
              ElevatedButton.icon(
                onPressed: onAddProduct,
                icon: const Icon(Icons.add, size: 18),
                label: const Text(AppString.addNewProduct),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
