import 'dart:io';

import 'package:hashcode_slice/src/slice_dataset.dart';

SliceDataset getInputParser(File inputFile) {
  var input = inputFile.readAsStringSync().split('\n');
  var party = input[0].split(' ');
  var pizzaRaw = input[1].split(' ');

  var pizzas = <int>[];
  for (var pizza in pizzaRaw) {
    pizzas.add(int.parse(pizza));
  }

  var sliceDataset =
      SliceDataset(int.parse(party[0]), int.parse(party[1]), pizzas);

  return sliceDataset;
}

String getOutputParser(List<int> indices) {
  return '${indices.length.toString()}\n${indices.join(' ')}';
}
