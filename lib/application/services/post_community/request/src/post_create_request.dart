import 'package:dart_mappable/dart_mappable.dart';

import '../../../common/common.dart';
import '../../../user/request/request.dart';

part 'post_create_request.mapper.dart';

@MappableClass()
class PostRequest with PostRequestMappable {
  const PostRequest({
    required this.language,
    required this.title,
    required this.content,
    required this.contentPlainText,
    required this.categoryId,
    this.thumbnail,
    required this.isDraft
  });

  final PostLanguage language;
  final String title;
  final String content;
  final String contentPlainText;
  final int categoryId;
  final FileRequest? thumbnail;
  final bool isDraft;
}
