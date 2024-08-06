import 'package:provider/provider.dart';
import 'package:traveler_provider/providers/cart_provider.dart';
import 'package:traveler_provider/providers/post_provider.dart';
import 'package:traveler_provider/services/api_service.dart';
import 'package:traveler_provider/data/repositories_impl/post_repository_impl.dart';

List<ChangeNotifierProvider> providers = [
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
];