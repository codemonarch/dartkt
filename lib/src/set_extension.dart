import 'package:dartkt/src/object_extension.dart';
import 'package:dartkt/src/pair_extension.dart';

extension KTSetExtension<T> on Set<T> {
  T find(bool Function(T) block) {
    for (var element in this) {
      if (block(element)) {
        return element;
      }
    }
    return null;
  }

  T findLast(bool Function(T) block) {
    for (var i = length - 1; i >= 0; i--) {
      if (block(elementAt(i))) {
        return elementAt(i);
      }
    }
    return null;
  }

  int indexOfFirst(bool Function(T) block) {
    var idx = -1;
    for (var i = 0; i < length; i++) {
      if (block(elementAt(i))) {
        idx = i;
        break;
      }
    }
    return idx;
  }

  int indexOfLast(bool Function(T) block) {
    var idx = -1;
    for (var i = length - 1; i >= 0; i--) {
      if (block(elementAt(i))) {
        idx = i;
        break;
      }
    }
    return idx;
  }

  Set<T> drop(int n) {
    var ret = <T>{};
    for (var i = n; i < length; i++) {
      ret.add(elementAt(i));
    }
    return ret;
  }

  Set<T> dropLast(int n) {
    var ret = <T>{};
    for (var i = 0; i < length - n; i++) {
      ret.add(elementAt(i));
    }
    return ret;
  }

  Set<T> filter(bool Function(T) block) {
    var ret = <T>{};
    for (var i = 0; i < length; i++) {
      if (block(elementAt(i))) ret.add(elementAt(i));
    }
    return ret;
  }

  Set<T> filterIndexed(bool Function(int idx, T item) block) {
    var ret = <T>{};
    for (var i = 0; i < length; i++) {
      if (block(i, elementAt(i))) ret.add(elementAt(i));
    }
    return ret;
  }

  Set<T> filterNot(bool Function(T) block) {
    var ret = <T>{};
    for (var i = 0; i < length; i++) {
      if (!block(elementAt(i))) ret.add(elementAt(i));
    }
    return ret;
  }

  Set<T> slice(int startIdx, int endIdx) {
    var ret = <T>{};
    for (var i = startIdx; i < endIdx; i++) {
      ret.add(elementAt(i));
    }
    return ret;
  }

  Set<T> sortBy(int Function(T first, T second) block) => let((it) {
        it.toList().sort(block);
        return it;
      });

  Set<T> sortByDescending(int Function(T first, T second) block) => let((it) {
        it.toList().sort(block);
        return it.toList().reversed;
      });

  Set<R> map2<R>(R Function(T) block) {
    var ret = <R>{};
    for (var i = 0; i < length; i++) {
      ret.add(block(elementAt(i)));
    }
    return ret;
  }

  Set<R> map2Indexed<R>(R Function(int idx, T item) block) {
    var ret = <R>{};
    for (var i = 0; i < length; i++) {
      ret.add(block(i, elementAt(i)));
    }
    return ret;
  }

  Set<T> distinct() {
    var ret = <T>{};
    for (var item in this) {
      if (!ret.contains(item)) {
        ret.add(item);
      }
    }
    return ret;
  }

  Set<T> distinctBy<R>(R Function(T) block) {
    var s = <R>{};
    var list = <T>{};
    for (var e in this) {
      var key = block(e);
      if (s.add(key)) {
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
      block(i, elementAt(i));
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

  T reduceIndexed(T Function(int idx, T acc, T s) block) {
    var accumulator = elementAt(0);
    for (var i = 1; i < length; i++) {
      accumulator = block(i, accumulator, elementAt(i));
    }
    return accumulator;
  }

  void minus(Set<T> s) => removeWhere((it) => s.contains(it));

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

  Set<String> toStringList() {
    var ret = <String>{};
    for (var item in this) {
      ret.add('$item');
    }
    return ret;
  }

  Map<K, V> toMap<K, V>() {
    var ret = <K, V>{};
    if (this is Set<KTPair<K, V>>) {
      for (var item in this) {
        var m = item as KTPair<K, V>;
        ret[m.left] = m.right;
      }
    }
    return ret;
  }

  C mapTo<R, C extends Set<R>>(C dest, R Function(T) block) {
    for (var item in this) {
      dest.add(block(item));
    }
    return dest;
  }

  C mapIndexedTo<R, C extends Set<R>>(
      C dest, R Function(int idx, T item) block) {
    for (var i = 0; i < length; i++) {
      dest.add(block(i, elementAt(i)));
    }
    return dest;
  }

  C filterTo<C extends Set<T>>(C dest, bool Function(T) block) {
    for (var item in this) {
      if (block(item)) {
        dest.add(item);
      }
    }
    return dest;
  }

  C filterIndexedTo<C extends Set<T>>(
      C dest, bool Function(int idx, T item) block) {
    for (var i = 0; i < length; i++) {
      if (block(i, elementAt(i))) {
        dest.add(elementAt(i));
      }
    }
    return dest;
  }

  C filterNotTo<C extends Set<T>>(C dest, bool Function(T) block) {
    for (var item in this) {
      if (!block(item)) {
        dest.add(item);
      }
    }
    return dest;
  }
}
