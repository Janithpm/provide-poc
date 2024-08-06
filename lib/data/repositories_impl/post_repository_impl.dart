import 'package:traveler_provider/data/models/post.dart';
import 'package:traveler_provider/domain/repositories/post_repository.dart';
import 'package:traveler_provider/services/api_service.dart';

class PostRepositoryImpl implements PostRepository {
  final APIService apiService;

  PostRepositoryImpl({required this.apiService});

  @override
  Future<List<Post>> getPosts() async {
    return await apiService.get<List<Post>>(
      '/posts',
          (data) => (data as List).map((item) => Post.fromJson(item)).toList(),
    );
  }
}