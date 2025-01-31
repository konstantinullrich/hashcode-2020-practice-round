import 'dart:io';

import 'package:hashcode_slice/hashcode_slice.dart';

void main(List<String> args) {
  var arguments = getArgParser().parse(args);

  if (arguments['help']) {
    print('HashCode Slicer Help\n\$ hashcode <inputfile-path>\n\nOptions:');
    print(getArgParser().usage);
    exit(1);
  }

  if (arguments.rest.isEmpty) {
    print('You need to specify a input file');
    exit(1);
  }

  var inputFile = File(arguments.rest[0]);
  var outputFile = File(inputFile.path.replaceAll('.in', '.out'));

  if (arguments['output-file'] != null) {
    outputFile = File(arguments['output-file']);
  }

  var sliceDataset = getInputParser(inputFile.readAsStringSync());
  var slicer = Slicer(sliceDataset, progress: arguments['progress']);

  var result = slicer.slice(sliceDataset.indexRange);
  print('Max Score: ${sliceDataset.slicesMax}');
  print('Score: ${slicer.sliceCalc(result)}');
  outputFile.createSync();
  outputFile.writeAsString(getOutputParser(result));
}
