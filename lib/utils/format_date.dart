import 'package:jiffy/jiffy.dart';

String formatDateWithSuffix(DateTime date) {
  return Jiffy.parseFromDateTime(date).format(pattern: "MMM do, yyyy");
}