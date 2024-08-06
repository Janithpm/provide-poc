
import 'package:custom_card/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:traveler_provider/data/models/cart_item.dart';
import 'package:traveler_provider/presentation/widgets/cart_bottom_sheet.dart';
import 'package:traveler_provider/providers/cart_provider.dart';
import 'package:traveler_provider/providers/post_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Items'),
        actions: [
          IconButton(
            icon: const Icon(Icons.cake_outlined),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const CartBottomSheet();
                },
              );
            },
          )
        ],
      ),
      body: Column(
            children: [
              CustomCard(
                  title: 'Custom Card',
                  subtitle: 'This is from custom pub',
                  buttonText: 'Go to second page',
                  onPressed: () {
                    context.go('/second');
                  },
              ),
              postProvider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Expanded(
                child: ListView.builder(
                  itemCount: postProvider.posts.length,
                  itemBuilder: (context, index) {
                    final post = postProvider.posts[index];
                    return ListTile(
                      title: Text(post.title),
                      trailing: IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          cartProvider.addItem(CartItem(
                            id: post.id,
                            title: post.title,
                            quantity: 1,
                          ));
                        },
                      ),
                    );
                  },
                ),
              )
            ],
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          postProvider.fetchPosts();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}