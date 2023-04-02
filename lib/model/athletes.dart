import 'dart:ffi';
import 'package:hive/hive.dart';

part 'athletes.g.dart';

@HiveType(typeId: 0)
class Athletes {
  @HiveField(0)
  late int id;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late String phoneNumber;

  @HiveField(3)
  late DateTime paymentDate;

  @HiveField(4)
  late int paid;

  @HiveField(5)
  late String withCoach;
}
