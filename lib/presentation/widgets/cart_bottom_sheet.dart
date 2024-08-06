import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveler_provider/providers/cart_provider.dart';

import 'lottie_animation.dart';

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Select Items',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const LottieAnimation(assetPath: 'assets/animations/car.json', width: 200, height: 150,),
          if (cartProvider.items.isEmpty)
            const Text('No items!')
          else
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: cartProvider.items.length,
                itemBuilder: (context, index) {
                  final item = cartProvider.items[index];
                  return ListTile(
                    title: Text(item.title),
                    subtitle: Text('Quantity: ${item.quantity}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        cartProvider.removeItem(item.id);
                      },
                    ),
                  );
                },
              ),
            ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              cartProvider.clearCart();
              Navigator.pop(context);
            },
            child: const Text('Clear'),
          ),
        ],
      ),
    );
  }
}