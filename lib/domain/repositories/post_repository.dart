import 'package:traveler_provider/data/models/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts();
}