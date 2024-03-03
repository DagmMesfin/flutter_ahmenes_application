import 'package:intl/intl.dart';

String currentDate() {
  return DateFormat('yyyy-MM-dd').format(DateTime.now());
}
