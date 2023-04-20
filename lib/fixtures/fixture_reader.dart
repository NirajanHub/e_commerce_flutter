import 'dart:io';

String fixtures(String name) => File('lib/fixtures/$name').readAsStringSync();
