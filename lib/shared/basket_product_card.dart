import 'package:flutter/material.dart';

class BasketProductCard extends StatefulWidget {
  final int index;
  bool isSelected;
  bool isSelecting;
  final Function(int) selectProduct;

  BasketProductCard({
    super.key,
    required this.index,
    required this.isSelected,
    required this.selectProduct,
    required this.isSelecting,
  });

  @override
  _BasketProductCardState createState() => _BasketProductCardState();
}

class _BasketProductCardState extends State<BasketProductCard> {
  // Access the state variables directly from the widget
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF33343D),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(
                  width: 100,
                  height: 133,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/example3x4.jpg'),
                      fit: BoxFit.cover, // Ensure image fits properly
                    ),
                  ),
                ),
                if (widget.isSelecting)
                  Padding(
                    padding: EdgeInsets.zero,
                    child: Positioned(
                      top: 0,
                      left: 0,
                      child: Padding(
                        padding: EdgeInsets.zero,
                        child: Checkbox(
                          value: widget.isSelected,
                          onChanged: (value) {
                            setState(() {
                              widget.isSelected =
                                  value ?? false; // Toggle selection
                            });
                            widget.selectProduct(
                                widget.index); // Call the parent function
                          },
                        ),
                      ),
                    ),
                  )
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '\$3000',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Sellername - Shoes for sport running and making life easier',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Color: white, Size: XL',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  const Text(
                    'From: Bishkek, Dordoi Market',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    '\$40 for return to seller upon refusal',
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    '4 pieces in stock',
                    style: TextStyle(color: Colors.orange, fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove, size: 18),
                            onPressed: () {
                              // Handle decrement logic
                            },
                          ),
                          const Text('1'),
                          IconButton(
                            icon: const Icon(Icons.add, size: 18),
                            onPressed: () {
                              // Handle increment logic
                            },
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Add your button's onPressed logic here
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 36), // Adjust padding as needed
                          backgroundColor: const Color(0xFF7868D8),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(8), // Rounded corners
                          ),
                        ),
                        child: const Text(
                          'Buy',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors
                                .white, // Ensure text color contrasts with button color
                          ),
                        ),
                      ),
                    ],
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
