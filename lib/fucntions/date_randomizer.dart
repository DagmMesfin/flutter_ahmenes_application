import 'dart:math';

String getRandomDate() {
  Random random = Random();

  int minYear = 2000;
  int maxYear = 2023;

  int year = minYear + random.nextInt(maxYear - minYear + 1);

  int month = 1 + random.nextInt(12);

  int maxDay = DateTime(year, month + 1, 0).day;
  int day = 1 + random.nextInt(maxDay);
  print(
      '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}');

  return '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
}
