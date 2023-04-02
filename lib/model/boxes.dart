import 'package:fx3/model/athletes.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<Athletes> getAthletes() => Hive.box<Athletes>("athletes");
}
