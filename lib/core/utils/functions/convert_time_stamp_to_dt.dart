import 'package:intl/intl.dart';

DateTime convertTimeStampToDT(int? timeStamp) {
  return DateTime.fromMillisecondsSinceEpoch((timeStamp ?? 0) * 1000,
          isUtc: true)
      .toLocal();
}

String dateInFomattedTime(int? timeStamp) {
  DateTime dt = convertTimeStampToDT(timeStamp);

  return DateFormat.yMMMMd('en_US').format(dt);
}

String getDateTimeInAmPm(int? timeStamp) {
  DateTime dt = convertTimeStampToDT(timeStamp);
  return DateFormat.jm().format(dt);
}

String dateInString(int? timeStamp) {
  DateTime dt = convertTimeStampToDT(timeStamp);

  DateTime currentDate = DateTime.now();

  int differenceInDays = dt.day - currentDate.day;

  String result;

  if (differenceInDays == 0) {
    result = 'Today';
  } else if (differenceInDays == 1) {
    result = 'Tomorrow';
  } else {
    result = DateFormat.yMMMMd('en_US').format(dt);
  }
  return result;
}
