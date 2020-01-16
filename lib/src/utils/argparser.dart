import 'package:args/args.dart';

ArgParser getArgParser() {
  var parser = ArgParser();
  parser.addOption('input-file', abbr: 'i', defaultsTo: null);
  parser.addOption('output-file', abbr: 'o', defaultsTo: null);
  return parser;
}