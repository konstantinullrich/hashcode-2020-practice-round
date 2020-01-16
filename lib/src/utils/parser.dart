import 'package:hashcode_slice/hashcode_slice.dart';

SliceDataset getInputParser(String inputString) {
  var input = inputString.split('\n');
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
