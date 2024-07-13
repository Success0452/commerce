import 'package:intl/intl.dart';

String filterString(String jsonString) {
  RegExp regExp = RegExp(r'https?:\/\/[^" \]]+');
  Iterable<Match> matches = regExp.allMatches(jsonString);
  if (matches.isNotEmpty) {
    return matches.first.group(0)!;
  } else {
    return '';
  }
}

String formatDate(String isoDateString) {
  DateTime dateTime = DateTime.parse(isoDateString);

  DateFormat formatter = DateFormat('d MMMM yyyy');
  String formattedDate = formatter.format(dateTime);

  return formattedDate;
}
