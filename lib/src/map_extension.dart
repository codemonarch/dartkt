import 'package:dartkt/src/pair_extension.dart';

extension KTMapExtension<K, V> on Map<K, V> {
  // kotlin
  List<KTPair<K, V>> toList() {
    var ret = <KTPair<K, V>>[];
    forEach((k, v) => ret.add(KTPair(k, v)));
    return ret;
  }

  List<R> mapToList<R>(R Function(MapEntry<K, V> e) block) {
    var ret = <R>[];
    forEach((k, v) => ret.add(block(MapEntry(k, v))));
    return ret;
  }

  void forEachEntry(void Function(MapEntry<K, V> e) block) =>
      forEach((k, v) => block(MapEntry(k, v)));

  bool all(bool Function(MapEntry<K, V> e) block) {
    if (isEmpty) return false;
    var ret = true;
    forEachEntry((it) {
      if (!block(it)) ret = false;
    });
    return ret;
  }

  bool any(bool Function(MapEntry<K, V> e) block) {
    if (isEmpty) return false;
    var ret = false;
    forEachEntry((it) {
      if (block(it)) ret = true;
    });
    return ret;
  }

  int count(bool Function(MapEntry<K, V> e) block) {
    var ret = 0;
    forEachEntry((it) {
      if (block(it)) ret++;
    });
    return ret;
  }

  bool none(bool Function(MapEntry<K, V> e) block) {
    if (isEmpty) return true;
    var ret = true;
    forEachEntry((it) {
      if (block(it)) ret = false;
    });
    return ret;
  }

  Map<K, V> filterKeys(bool Function(K) block) {
    var ret = <K, V>{};
    forEachEntry((it) {
      if (block(it.key)) ret[it.key] = it.value;
    });
    return ret;
  }

  Map<K, V> filterValues(bool Function(V) block) {
    var ret = <K, V>{};
    forEachEntry((it) {
      if (block(it.value)) ret[it.key] = it.value;
    });
    return ret;
  }

  Map<K, V> filter(bool Function(MapEntry<K, V> e) block) {
    var ret = <K, V>{};
    forEachEntry((it) {
      if (block(it)) ret[it.key] = it.value;
    });
    return ret;
  }

  Map<K, V> filterNot(bool Function(MapEntry<K, V> e) block) {
    var ret = <K, V>{};
    forEachEntry((it) {
      if (!block(it)) ret[it.key] = it.value;
    });
    return ret;
  }

  void add(Map<K, V> map) => map.forEach((k, v) => this[k] = v);
  void minus(Map<K, V> map) => removeWhere((k, v) => map[k] == v);

  Map<K, V> filterTo<M extends Map<K, V>>(
      M dest, bool Function(MapEntry<K, V> e) block) {
    forEachEntry((it) {
      if (block(it)) {
        dest[it.key] = it.value;
      }
    });
    return dest;
  }

  Map<K, V> filterNotTo<M extends Map<K, V>>(
      M dest, bool Function(MapEntry<K, V> e) block) {
    forEachEntry((it) {
      if (!block(it)) {
        dest[it.key] = it.value;
      }
    });
    return dest;
  }

  Map<K, V> filterValuesTo<M extends Map<K, V>>(
      M dest, bool Function(V) block) {
    forEachEntry((it) {
      if (block(it.value)) {
        dest[it.key] = it.value;
      }
    });
    return dest;
  }

  Map<K2, V2> mapTo<K2, V2, C extends Map<K2, V2>>(
      C dest, MapEntry<K2, V2> Function(MapEntry<K, V> e) block) {
    forEachEntry((it) {
      var item = block(it);
      dest[item.key] = item.value;
    });
    return dest;
  }

  List<R> mapToListTo<R, C extends List<R>>(
      C dest, R Function(MapEntry<K, V> e) block) {
    forEachEntry((it) {
      dest.add(block(it));
    });
    return dest;
  }

  Map<K2, V2> mapKeysTo<K2, V2, C extends Map<K2, V2>>(
      C dest, MapEntry<K2, V2> Function(K) block) {
    forEachEntry((it) {
      var item = block(it.key);
      dest[item.key] = item.value;
    });
    return dest;
  }

  List<R> mapKeysToListTo<R, C extends List<R>>(C dest, R Function(K) block) {
    forEach((k, v) {
      dest.add(block(k));
    });
    return dest;
  }

  Map<K2, V2> mapValuesTo<K2, V2, C extends Map<K2, V2>>(
      C dest, MapEntry<K2, V2> Function(V) block) {
    forEachEntry((it) {
      var item = block(it.value);
      dest[item.key] = item.value;
    });
    return dest;
  }

  List<R> mapValuesToListTo<R, C extends List<R>>(C dest, R Function(V) block) {
    forEach((k, v) {
      dest.add(block(v));
    });
    return dest;
  }

  String toCookieString() =>
      mapToList((it) => '${it.key}=${it.value}').join(';');
}
