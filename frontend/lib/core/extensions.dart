import 'package:collection/collection.dart';

extension StringExtention on String {
  T? toEnum<T>(Iterable<T> values) =>
      values.firstWhereOrNull((e) => startsWith('$e'));
}
