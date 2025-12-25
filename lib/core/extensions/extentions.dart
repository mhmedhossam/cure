import 'package:dartz/dartz.dart';

extension EitherX<L, R> on Either<L, R> {
  R getRight() => fold((l) => throw Exception('No Right'), (r) => r);
  L getLeft() => fold((l) => l, (r) => throw Exception('No Left'));
}
