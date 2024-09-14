import 'package:dart_mappable/dart_mappable.dart';

import '../../../../../utilities/constants/constants.dart';

part 'notification_type.mapper.dart';

@MappableEnum(caseStyle: enumCaseStyle)
enum NotificationType { commentMyPost, reactMyPost, followingUploadPost }
