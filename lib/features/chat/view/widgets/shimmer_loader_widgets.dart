import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoaderWidget extends StatelessWidget {
  const ShimmerLoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              SizedBox(height: 12),
              _rightShimmerBubble(),
              SizedBox(height: 12),
              _leftShimmerBubble(),
              SizedBox(height: 12),
              _rightShimmerBubble(),
              SizedBox(height: 12),
              _leftShimmerBubble(),
              SizedBox(height: 12),
              _rightShimmerBubble(),
              SizedBox(height: 12),
              _leftShimmerBubble(),
              SizedBox(height: 12),
              _rightShimmerBubble(),
              SizedBox(height: 12),
              _leftShimmerBubble(),
              SizedBox(height: 12),
              _rightShimmerBubble(),
              SizedBox(height: 12),


            ],
          ),
        ),
      ),
    );
  }

  // Left aligned (AI style) bubble.............
  Widget _leftShimmerBubble() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 230,
        height: 60,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  // Right aligned (User style) bubble.........
  Widget _rightShimmerBubble() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 200,
        height: 60,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
