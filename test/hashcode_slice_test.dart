import 'package:hashcode_slice/hashcode_slice.dart';
import 'package:test/test.dart';

void main() {
  group('A group Parser Tests', () {
    test('Input Parser Test', () {
      var sliceDataset = getInputParser('17 4\n2 5 6 8');
      expect(sliceDataset.slicesMax, 17);
      expect(sliceDataset.differentTypes, 4);
      expect(sliceDataset.pizzas, [2, 5, 6, 8]);
    });

    test('Output Parser Test', () {
      var indices = <int>[0, 2, 3];
      var output = getOutputParser(indices);
      expect(output, '${indices.length}\n${indices.join(' ')}');
    });
  });

  group('A group of SliceDataset Tests', () {
    SliceDataset sliceDataset;

    setUp(() {
      sliceDataset = SliceDataset(17, 4, [2, 5, 6, 8]);
    });

    test('Map Test', () {
      expect(sliceDataset.toMap(), {
        'slicesMax': 17,
        'differentTypes': 4,
        'pizzas': [2, 5, 6, 8]
      });
    });

    test('Indices Test', () {
      expect(sliceDataset.indexRange, [0, 1, 2, 3]);
    });
  });

  group('A group of Slicer Tests', () {
    Slicer slicer;

    setUp(() {
      var sliceDataset = SliceDataset(17, 4, [2, 5, 6, 8]);
      slicer = Slicer(sliceDataset);
    });

    test('Slice Calc Test', () {
      expect(slicer.sliceCalc([0, 1, 2, 3]), 21);
      expect(slicer.sliceCalc([0]), 2);
      expect(slicer.sliceCalc([0, 2, 3]), 16);
    });

    test('Slice Test', () {
      expect(slicer.slice([0, 1, 2, 3]), [0, 2, 3]);
    });
  });
}
