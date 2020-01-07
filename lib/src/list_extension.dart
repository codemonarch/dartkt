import 'package:dartkt/src/pair_extension.dart';

extension KTListExtension<T> on List<T> {
  // kotlin
  T find(bool Function(T) block) {
    for (var e in this) {
      if (block(e)) {
        return e;
      }
    }
    return null;
  }

  T findLast(bool Function(T) block) {
    for (var i = length - 1; i >= 0; i--) {
      if (block(this[i])) {
        return this[i];
      }
    }
    return null;
  }

  int indexOfFirst(bool Function(T) block) {
    var idx = -1;
    for (var i = 0; i < length; i++) {
      if (block(this[i])) {
        idx = i;
        break;
      }
    }
    return idx;
  }

  int indexOfLast(bool Function(T) block) {
    var idx = -1;
    for (var i = length - 1; i >= 0; i--) {
      if (block(this[i])) {
        idx = i;
        break;
      }
    }
    return idx;
  }

  List<T> drop(int n) {
    var ret = <T>[];
    for (var i = n; i < length; i++) {
      ret.add(this[i]);
    }
    return ret;
  }

  List<T> dropLast(int n) {
    var ret = <T>[];
    for (var i = 0; i < length - n; i++) {
      ret.add(this[i]);
    }
    return ret;
  }

  List<T> filter(bool Function(T) block) {
    var ret = <T>[];
    for (var i = 0; i < length; i++) {
      if (block(this[i])) ret.add(this[i]);
    }
    return ret;
  }

  List<T> filterIndexed(bool Function(int idx, T item) block) {
    var ret = <T>[];
    for (var i = 0; i < length; i++) {
      if (block(i, this[i])) ret.add(this[i]);
    }
    return ret;
  }

  List<T> filterNot(bool Function(T) block) {
    var ret = <T>[];
    for (var i = 0; i < length; i++) {
      if (!block(this[i])) ret.add(this[i]);
    }
    return ret;
  }

  List<T> slice(int startIdx, int endIdx) => sublist(startIdx, endIdx);
  List<T> sortBy(int Function(T first, T second) block) {
    var tmp = this;
    tmp.sort(block);
    return tmp;
  }

  List<T> sortByDescending(int Function(T first, T second) block) {
    var tmp = this;
    tmp.sort(block);
    return tmp.reversed;
  }

  List<R> map2<R>(R Function(T) block) {
    var ret = <R>[];
    for (var i = 0; i < length; i++) {
      ret.add(block(this[i]));
    }
    return ret;
  }

  List<R> map2Indexed<R>(R Function(int idx, T item) block) {
    var ret = <R>[];
    for (var i = 0; i < length; i++) {
      ret.add(block(i, this[i]));
    }
    return ret;
  }

  List<T> distinct() {
    var ret = <T>[];
    for (var item in this) {
      if (!ret.contains(item)) {
        ret.add(item);
      }
    }
    return ret;
  }

  List<T> distinctBy<R>(R Function(T) block) {
    var set = <R>{};
    var list = <T>[];
    for (var e in this) {
      var key = block(e);
      if (set.add(key)) {
        list.add(e);
      }
    }
    return list;
  }

  bool all(bool Function(T) block) {
    if (isEmpty) return false;
    for (var item in this) {
      if (!block(item)) {
        return false;
      }
    }
    return true;
  }

  bool any(bool Function(T) block) {
    if (isEmpty) return false;
    for (var item in this) {
      if (block(item)) {
        return true;
      }
    }
    return false;
  }

  int count(bool Function(T) block) {
    var ret = 0;
    for (var item in this) {
      if (block(item)) {
        ret++;
      }
    }
    return ret;
  }

  void forEachIndexed(void Function(int idx, T item) block) {
    for (var i = 0; i < length; i++) {
      block(i, this[i]);
    }
  }

  bool none(bool Function(T) block) {
    if (isEmpty) return true;
    for (var item in this) {
      if (block(item)) {
        return false;
      }
    }
    return true;
  }

  T reduceIndexed(T Function(int idx, T acc, T item) block) {
    var accumulator = this[0];
    for (var i = 1; i < length; i++) {
      accumulator = block(i, accumulator, this[i]);
    }
    return accumulator;
  }

  void minus(List<T> list) => removeWhere((it) => list.contains(it));

  String joinToString([String sep = ',', String Function(T) block]) {
    var str = '';
    forEach((it) {
      if (block == null) {
        str += '$it$sep';
      } else {
        str += '${block(it)}$sep';
      }
    });
    if (str.endsWith(sep)) {
      str = str.substring(0, str.length - sep.length);
    }
    return str;
  }

  List<String> toStringList() => map((it) => '$it');

  Map<K, V> toMap<K, V>() {
    var ret = <K, V>{};
    if (this is List<KTPair<K, V>>) {
      for (var item in this) {
        var m = item as KTPair<K, V>;
        ret[m.left] = m.right;
      }
    }
    return ret;
  }

  C mapTo<R, C extends List<R>>(C dest, R Function(T) block) {
    for (var item in this) {
      dest.add(block(item));
    }
    return dest;
  }

  C mapIndexedTo<R, C extends List<R>>(
      C dest, R Function(int idx, T item) block) {
    for (var i = 0; i < length; i++) {
      dest.add(block(i, this[i]));
    }
    return dest;
  }

  C filterTo<C extends List<T>>(C dest, bool Function(T) block) {
    for (var item in this) {
      if (block(item)) {
        dest.add(item);
      }
    }
    return dest;
  }

  C filterIndexedTo<C extends List<T>>(
      C dest, bool Function(int idx, T item) block) {
    for (var i = 0; i < length; i++) {
      if (block(i, this[i])) {
        dest.add(this[i]);
      }
    }
    return dest;
  }

  C filterNotTo<C extends List<T>>(C dest, bool Function(T) block) {
    for (var item in this) {
      if (!block(item)) {
        dest.add(item);
      }
    }
    return dest;
  }

  // rarnu
  List<List<T>> toGridData([int column = 1]) {
    var ret = <List<T>>[];
    var count = 0;
    var sub = <T>[];
    for (var item in this) {
      if (count == column) {
        ret.add(sub);
        sub = <T>[];
        sub.add(item);
        count = 1;
        continue;
      }
      sub.add(item);
      count++;
    }
    if (sub.isNotEmpty) {
      ret.add(sub);
    }
    return ret;
  }
}

extension KTListListExtension<T> on List<List<T>> {
  List<T> toListData() {
    var ret = <T>[];
    forEach((l) => l.forEach((i) => ret.add(i)));
    return ret;
  }
}

extension KTStringListExtension on List<String> {
  List<String> skipEmptyLine() => filterNot((it) => it.trim() == '');
}
