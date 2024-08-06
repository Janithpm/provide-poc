import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:traveler_provider/presentation/widgets/lottie_animation.dart';
import 'package:traveler_provider/providers/cart_provider.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Another Page'),
        actions: [
          IconButton(
            iconSize: 30,
            icon: const Icon(Icons.navigate_before),
            onPressed: () {
              context.go('/');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const LottieAnimation(assetPath: 'assets/animations/cat.json'),
            const Text('Selected items'),
            const SizedBox(height: 20,),
            cartProvider.items.isEmpty
            ? const Text("List is empty")
            : ListView.builder(
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
            )
          ],
        )),
    );
  }
}
