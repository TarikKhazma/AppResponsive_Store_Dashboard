import 'package:flutter/material.dart';
import '../../../core/constants/app_size.dart';
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
        padding: const EdgeInsets.fromLTRB(
          AppSize.s24,
          AppSize.s28,
          AppSize.s24,
          AppSize.s20,
        ),
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
              const SizedBox(width: AppSize.s12),
            ],

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.productInventory,
                    style: AppTextStyle.headlineLarge,
                  ),
                  const SizedBox(height: AppSize.s4),
                  Text(
                    AppString.manageCatalog,
                    style: AppTextStyle.bodyMedium.copyWith(
                      color: AppColor.unselectedNavText,
                    ),
                  ),
                ],
              ),
            ),

            if (isWide) ...[
              const SizedBox(width: AppSize.s16),
              ElevatedButton.icon(
                onPressed: onAddProduct,
                icon: const Icon(Icons.add, size: AppSize.iconS),
                label: const Text(AppString.addNewProduct),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
