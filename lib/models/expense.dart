import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, travel , work , leisure} 

class Expense {

  Expense({
    required this.date,
    required this.amount,
    required this.title,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}