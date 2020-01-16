import 'package:hashcode_slice/src/slice_dataset.dart';

class Slicer {
  final SliceDataset sliceDataset;

  Slicer(this.sliceDataset);

  int sliceCalc(List<int> indices) {
    var result = 0;
    indices.forEach((index) => result += sliceDataset.pizzas[index]);
    return result;
  }

  List<int> slice(List<int> indices) {
    var results = <List<int>>[];
    for (var i = 0; i < indices.length; i++) {
      print('${(i * 100) / indices.length}%');
      var order = _sliceStageTwo(indices.sublist(0, indices.length - i));
      if (order != null) {
        results.add(order);
      }
    }

    results.sort((var a, var b) {
      var valA = sliceCalc(a);
      var valB = sliceCalc(b);
      if (valA > valB) {
        return 1;
      } else if (valA == valB) {
        return 0;
      }
      return -1;
    });

    return results.last;
  }

  List<int> _sliceStageTwo(List<int> indices) {
    indices = indices.reversed.toList();
    var isReversed = false;
    var i = 0;
    var calcList = <int>[];

    while (i < indices.length) {
      var clacListBranch = <int>[];
      clacListBranch.addAll(calcList);

      clacListBranch.add(indices[i]);
      if (sliceCalc(clacListBranch) > sliceDataset.slicesMax) {
        if (isReversed) {
          calcList.sort();
          if (calcList.length > sliceDataset.differentTypes) {
            return null;
          }
          return calcList;
        } else {
          isReversed = true;
          i = 0;
          indices.sort();
        }
      } else {
        calcList = clacListBranch;
        i++;
      }
    }
    return null;
  }
}
