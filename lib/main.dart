import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveler_provider/providers/cart_provider.dart';
import 'package:traveler_provider/providers/post_provider.dart';
import 'package:traveler_provider/router.dart';
import 'package:traveler_provider/services/api_service.dart';
import 'data/repositories_impl/post_repository_impl.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PostProvider(
            postRepository: PostRepositoryImpl(
              apiService: APIService(baseUrl: 'https://jsonplaceholder.typicode.com'),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
