import 'package:flutter/material.dart';
import 'package:otm_template/components/product/product_loading_item.dart';
import 'package:otm_template/themes/app_colors.dart';
import 'package:loadmore_listview/loadmore_listview.dart';

class ShimmerListProduct extends StatelessWidget {
  final bool isHorizontal;
  const ShimmerListProduct({super.key, required this.isHorizontal});

  @override
  Widget build(BuildContext context) {
    return isHorizontal
        ? LoadMoreListView.separated(
            scrollDirection: Axis.horizontal,
            hasMoreItem: false,
            refreshColor: AppColors.primaryColor,
            refreshBackgroundColor: Colors.white,
            itemCount: 10,
            itemBuilder: (context, index) {
              return ProductLoadingItem();
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              width: 8,
            ),
          )
        : LoadMoreListView.customScrollView(
            slivers: [
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 200,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ProductLoadingItem();
                  },
                  childCount: 6,
                ),
              ),
            ],
            scrollDirection: Axis.vertical,
            hasMoreItem: false,
            refreshColor: AppColors.primaryColor,
            refreshBackgroundColor: Colors.white,
          );
  }
}
