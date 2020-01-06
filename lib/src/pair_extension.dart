class KTPair<T, U> {
  KTPair(this.left, this.right);
  final T left;
  final U right;
  @override
  String toString() => 'Pair[$left, $right]';
  List<T> toList() => U is T ? [left, right as T] : null;
}

class KTTriple<A, B, C> {
  KTTriple(this.first, this.second, this.third);
  final A first;
  final B second;
  final C third;
  @override
  String toString() => 'Triple[$first, $second, $third]';
  List<A> toList() =>
      (B is A && C is A) ? [first, second as A, third as A] : null;
}
