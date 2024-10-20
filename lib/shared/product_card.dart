import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final int index;
  const ProductCard({super.key, required this.index});

  @override
  _ProductCardState createState() => _ProductCardState(index: index);
}

class _ProductCardState extends State<ProductCard> {
  final int index;

  _ProductCardState({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 3 / 4,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF7868D8),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '\$100.00',
                      style: TextStyle(color: Color(0xFFFFABC7)),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '\$120.00',
                      style: TextStyle(
                        color: Color(0xFF33343D),
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Product Title',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xFF33343D)),
                ),
                SizedBox(height: 4),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.orange,
                    ),
                    SizedBox(width: 4),
                    Text(
                      '5.0 | 2300 feedbacks',
                      style: TextStyle(
                        color: Color(0xFF33343D),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
