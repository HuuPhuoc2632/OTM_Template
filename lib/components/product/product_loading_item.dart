import 'package:flutter/material.dart';
import 'package:otm_template/components/redacted/redacted_widget.dart';
import 'package:otm_template/utils/extension.dart';

class ProductLoadingItem extends StatelessWidget {
  const ProductLoadingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // margin: const EdgeInsets.only(right: 16),
        height: 180,
        width: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container().circular(
              height: 122,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "This is a place holder text to fill",
              // style: AppStyles.textTitle,
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ).labelTitle,
          ],
        )).redacted(
      context: context,
      redact: true,
    );
  }
}