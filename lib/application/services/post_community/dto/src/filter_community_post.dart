import 'package:dart_mappable/dart_mappable.dart';

import '../../../../../utilities/constants/constants.dart';

part 'filter_community_post.mapper.dart';

@MappableEnum(caseStyle: enumCaseStyle)
enum FilterCommunityPost { ALL, FAVORITE, POPULAR, LATEST }
