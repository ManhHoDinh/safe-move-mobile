import '../../../../presentation/ui/create_post_screen/blocs/create_post_state.dart';
import '../../category/category.dart';

abstract interface class PostManager {
  Future<String?> loadPost(CategoryType type);

  Future<void> removePost(CategoryType type);

  Future<void> savePost(
      CreatePostState post, CategoryType type, String postContent);
}
