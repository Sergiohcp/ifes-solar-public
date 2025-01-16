import 'package:intl/intl.dart';

dateNow() {
  final now = new DateTime.now();
  final formatter = new DateFormat('dd/MM/yyyy');
  return formatter.format(now);
}

formatDate(String date) {
  final inputFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');
  final outputFormatDate = DateFormat('dd/MM/yy HH:mm');
  return outputFormatDate.format(inputFormat.parse(date));
}
