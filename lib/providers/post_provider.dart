import 'package:flutter/material.dart';
import 'package:traveler_provider/data/models/post.dart';
import 'package:traveler_provider/domain/repositories/post_repository.dart';

class PostProvider with ChangeNotifier {
  final PostRepository postRepository;

  PostProvider({required this.postRepository});

  List<Post> _posts = [];
  List<Post> get posts => _posts;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchPosts() async {
    _isLoading = true;
    notifyListeners();
    try {
      _posts = await postRepository.getPosts();
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
