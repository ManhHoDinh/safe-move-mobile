import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../application/services/app/post_history/post_manager.dart';
import '../../../application/services/category/dto/src/category_type.dart';
import '../../../presentation/ui/create_post_screen/blocs/create_post_state.dart';

class PostManagerImpl implements PostManager {
  const PostManagerImpl({
    required this.prefs,
  });

  final SharedPreferences prefs;

  static const _communityPostKey = 'SM-communityPost';
  static const _curatorPostKey = 'SM-curatorPost';
  static const _sgmNewsPostKey = 'SM-sgmNewsPost';
  static const _storeKey = 'SM-store';

  @override
  Future<String?> loadPost(CategoryType type) async {
    switch (type) {
      case CategoryType.community:
        return prefs.getString(_communityPostKey);
      case CategoryType.curator:
        return prefs.getString(_curatorPostKey);
      case CategoryType.sgmNews:
        return prefs.getString(_sgmNewsPostKey);
      case CategoryType.store:
        return prefs.getString(_storeKey);
    }
  }

  @override
  Future<void> removePost(CategoryType type) {
    switch (type) {
      case CategoryType.community:
        return prefs.remove(_communityPostKey);
      case CategoryType.curator:
        return prefs.remove(_curatorPostKey);
      case CategoryType.sgmNews:
        return prefs.remove(_sgmNewsPostKey);
      case CategoryType.store:
        return prefs.remove(_storeKey);
    }
  }

  @override
  Future<void> savePost(
      CreatePostState post, CategoryType type, String postContent) {
    final Map<String, dynamic> postMap = {
      'title': post.createPostNameField.value,
      'postContent': postContent,
      'parentCategory': post.parentCategory?.id,
      'childCategory': post.childCategory?.id,
      'language': post.language?.language.toString(),
      'thumbnail': post.localThumbnail?.path,
    };
    switch (type) {
      case CategoryType.community:
        return prefs.setString(_communityPostKey, jsonEncode(postMap));
      case CategoryType.curator:
        return prefs.setString(_curatorPostKey, jsonEncode(postMap));
      case CategoryType.sgmNews:
        return prefs.setString(_sgmNewsPostKey, jsonEncode(postMap));
      case CategoryType.store:
        return prefs.setString(_storeKey, jsonEncode(postMap));
    }
  }
}
