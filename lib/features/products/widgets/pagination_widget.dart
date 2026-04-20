import 'package:flutter/material.dart';
import '../../../core/theme/app_text_style.dart';
import 'page_btn_widget.dart';

class PaginationWidget extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final ValueChanged<int>? onPageChanged;

  const PaginationWidget({
    super.key,
    required this.currentPage,
    required this.totalPages,
    this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            PageBtnWidget(
              enabled: currentPage > 1,
              onTap: () => onPageChanged?.call(currentPage - 1),
              child: const Icon(Icons.chevron_left, size: 18),
            ),
            const SizedBox(width: 4),
            for (final page in [1, 2, 3]) ...[
              PageBtnWidget(
                label: '$page',
                isSelected: currentPage == page,
                onTap: () => onPageChanged?.call(page),
              ),
              const SizedBox(width: 4),
            ],
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text('...', style: AppTextStyle.bodyMedium),
            ),
            const SizedBox(width: 4),
            PageBtnWidget(
              label: '$totalPages',
              isSelected: currentPage == totalPages,
              onTap: () => onPageChanged?.call(totalPages),
            ),
            const SizedBox(width: 4),
            PageBtnWidget(
              enabled: currentPage < totalPages,
              onTap: () => onPageChanged?.call(currentPage + 1),
              child: const Icon(Icons.chevron_right, size: 18),
            ),
          ],
        ),
      ),
    );
  }
}
