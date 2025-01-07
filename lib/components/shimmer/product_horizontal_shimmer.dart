import 'package:flutter/material.dart';
import 'package:otm_template/components/redacted/redacted_widget.dart';
import 'package:otm_template/utils/extension.dart';

class ProductHorizontalShimmer extends StatelessWidget {
  const ProductHorizontalShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // margin: const EdgeInsets.only(right: 16),
        height: 140,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container().circular(
              height: 122,
              width: 138,
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container().circular(
                  height: 20,
                ),
                SizedBox(
                  height: 8,
                ),
                Container().circular(
                  height: 20,
                  width: 100,
                ),
                SizedBox(
                  height: 8,
                ),
                Container().circular(
                  height: 20,
                  width: 100,
                ),
              ],
            )
          ],
        )).redacted(
      context: context,
      redact: true,
    );
  }
}