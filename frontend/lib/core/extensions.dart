import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';

extension StringExtention on String {
  T? toEnum<T>(Iterable<T> values) =>
      values.firstWhereOrNull((e) => startsWith('$e'));
}

extension EitherX<L, R> on Either<L, R> {
  R asRight() => (this as Right).value; //
  L asLeft() => (this as Left).value;
}
