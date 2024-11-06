import 'package:first_app/features/address/address_select.dart';
import 'package:first_app/shared/basket_product_card.dart';
import 'package:flutter/material.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  _BasketScreenState createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  bool isSelecting = false;
  int selectedProducts = 0;
  final int _totalProducts = 4;
  final List<bool> selected = List.filled(4, false);

  void _toggleSelectMode() {
    setState(() {
      isSelecting = !isSelecting;
      selectedProducts = 0;
    });
  }

  void selectProduct(int index) {
    setState(() {
      selected[index] = !selected[index];
      selectedProducts += selected[index] ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF231921),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 14),
          child: Column(
            children: [
              _buildHeader(),
              _buildProductList(),
              _buildCheckoutSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        const AddressSelectFeature(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  isSelecting ? 'Selected: $selectedProducts' : 'Basket',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                if (!isSelecting) ...[
                  const SizedBox(width: 4),
                  Opacity(
                    opacity: 0.7,
                    child: Text(
                      '($_totalProducts)',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ],
            ),
            TextButton(
              onPressed: _toggleSelectMode,
              child: Text(
                isSelecting ? 'Cancel' : 'Select',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8), // Add a small space if necessary
      ],
    );
  }

  Widget _buildProductList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _totalProducts,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0), // Reduced space
          child: BasketProductCard(
            index: index,
            isSelected: selected[index],
            isSelecting: isSelecting,
            selectProduct: selectProduct,
          ),
        );
      },
    );
  }

  Widget _buildCheckoutSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 8.0), // Maintain consistent vertical padding
      child: Card(
        color: const Color(0xFF33343D),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Your basket',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${selectedProducts > 0 ? selectedProducts : _totalProducts} product(s)',
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  _buildProductPriceRow('Shoes', '\$3000'),
                  const SizedBox(height: 8),
                  _buildProductPriceRow('Discount', '-\$200', isDiscount: true),
                  const Divider(),
                  _buildProductPriceRow('Total cost', '\$2800', isTotal: true),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor:
                        const Color(0xFF7868D8), // Button background color
                  ),
                  child: const Text(
                    'Proceed to checkout',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white, // Ensure the text color is visible
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Delivery to Bishkek, arrives in 1-2 days.',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductPriceRow(String title, String price,
      {bool isDiscount = false, bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isTotal ? 18 : 16,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isDiscount ? const Color(0xFF7868D8) : Colors.white,
          ),
        ),
        Text(
          price,
          style: TextStyle(
            fontSize: isTotal ? 18 : 16,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
