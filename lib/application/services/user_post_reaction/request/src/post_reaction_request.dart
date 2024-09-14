import 'package:dart_mappable/dart_mappable.dart';

part 'post_reaction_request.mapper.dart';

@MappableClass()
class PostReactionRequest with PostReactionRequestMappable {
  const PostReactionRequest({
    required this.isReact,
  });

  final bool isReact;
}
