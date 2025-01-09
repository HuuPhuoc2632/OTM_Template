import 'package:flutter/material.dart';

class OtmListView extends StatelessWidget {
  final List<Widget> children;
  final bool shrinkwrap;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final Axis scrollDirection;
  final Widget Function(BuildContext, int)? separatorBuilder;
  const OtmListView(
      {super.key,
      required this.children,
      this.shrinkwrap = false,
      this.physics,
      this.padding,
      this.scrollDirection = Axis.vertical,
      this.separatorBuilder});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: scrollDirection,
      padding: padding,
      physics: physics,
      shrinkWrap: shrinkwrap,
      itemCount: children.length,
      itemBuilder: (context, index) => children[index],
      separatorBuilder: separatorBuilder ??
          (context, index) => scrollDirection == Axis.vertical
              ? const SizedBox(height: 8)
              : const SizedBox(width: 8),
    );
  }
}
