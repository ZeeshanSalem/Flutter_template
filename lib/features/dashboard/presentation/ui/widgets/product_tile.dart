import 'package:flutter/material.dart';
import 'package:template/core/utils/assets_path.dart';
import 'package:template/core/utils/typography.dart';
import 'package:template/features/dashboard/data/model/response/product_list_data.dart';

class ProductTile extends StatelessWidget {
  final ProductListData? productListData;

  const ProductTile({
    super.key,
    this.productListData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: FadeInImage(
                placeholder: const AssetImage(ImagePath.placeHolder),
                image: NetworkImage(
                  '${productListData?.image}',
                ),
                height: 100,
                width: 100,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    productListData?.title ?? '-',
                    style: AppTypography.lightTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    '${productListData?.price ?? '-'}',
                    style: AppTypography.lightTheme.bodyLarge,
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
