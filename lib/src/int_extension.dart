extension KTIntExtension on int {
  List<List<int>> toGridData([int column = 1]) {
    var ret = <List<int>>[];
    var count = 0;
    var sub = <int>[];
    for (var i = 0; i < this; i++) {
      if (count == column) {
        ret.add(sub);
        sub = <int>[];
        sub.add(i);
        count = 1;
        continue;
      }
      sub.add(i);
      count++;
    }
    ret.add(sub);
    return ret;
  }
}
