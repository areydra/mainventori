import 'package:intl/intl.dart';

class CurrentDate {
  late String date;
  late String month;
  late String year;

  CurrentDate({
    required this.date,
    required this.month,
    required this.year,
  });
}

CurrentDate getCurrentDate() {
  final currentDate = DateFormat("dd MMMM yyyy").format(DateTime.now());
  final currentDateSplitted = currentDate.split(' ');

  return CurrentDate(
    date: currentDateSplitted[0],
    month: currentDateSplitted[1],
    year: currentDateSplitted[2],
  );
}
