import 'package:flutter/material.dart';
import 'package:otm_template/components/redacted/redacted_widget.dart';

class DoubleCardShimmer extends StatelessWidget {
  const DoubleCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  height: 140,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                ),
              ],
            ).redacted(context: context, redact: true),
          );
  }
}