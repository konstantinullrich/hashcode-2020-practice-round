import 'package:args/args.dart';

ArgParser getArgParser() {
  var parser = ArgParser();
  parser.addOption('output-file',
      abbr: 'o',
      defaultsTo: null,
      valueHelp: 'path',
      help: 'Specify a output File');
  parser.addFlag('progress',
      abbr: 'p', defaultsTo: false, help: 'Show the progress of the action');
  parser.addFlag('help', abbr: 'h', defaultsTo: false);
  return parser;
}
