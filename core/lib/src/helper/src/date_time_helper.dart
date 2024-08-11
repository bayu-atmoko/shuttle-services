// ignore_for_file: constant_identifier_names

import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const DEFAULT_DATE_FORMAT = "yyyy-MM-dd HH:mm";
const String dateYYYYMMDDHHMMDot = 'yyyy.MM.dd HH:mm';
const String dateYYYYMMDDHHMMSSStrip = 'yyyy-MM-dd HH:mm:ss';
const String dateYYYYMMDDStrip = 'yyyy-MM-dd';
const String dateYYYYMMDDDot = 'yyyy.MM.dd';
const String dateDDMMYYYYHHMMSSStrip = 'dd-MM-yyyy HH:mm:ss';
const String dateDDMMYYYYHHMMStrip = 'dd-MM-yyyy HH:mm';
const String dateDDMMYYYYStrip = 'dd-MM-yyyy';
const String dateDMMYYYYStrip = 'd-MM-yyyy';
const String dateDDMMYYYYSLASH = 'dd/MM/yyyy';
const String dateDDMMMYYYYStrip = 'dd-MMM-yy';
const String dateMMMYYYYSpace = 'MMM yyyy';
const String dateDDMMYYStrip = 'dd-MM-yy';
const String dateDDMMMMYYYYSpace = 'dd MMMM yyyy';
const String dateDDMMMYYSpace = 'dd MMM yy'; // 01 Jan 22
const String dateDDMMMYYYYSpace = 'dd MMM yyyy'; // 01 Jan 2022
const String dateDDMMMSpace = 'dd MMM'; // 01 Jan
const String dateDDMONTHYYYYText = 'dd-MONTH-yyyy'; // 1 January 2022
const String dateDDMONTHYYYYHHMMText =
    'dd-MONTH-yyyy HH:mm'; // 1 January 2022, 12:00
const String dateDDMONTHYYYYTextShort = 'dd-MONTH-yyyy-SHORT'; // 1 Jan 2022
const String dateDAYDDMONTHYYYYText =
    'DAY-dd-MONTH-yyyy'; // Monday, 1 January 2022
const String dateDOB = 'yyyy년 MM월 dd일';

const String dayString = 'DAY';
const String weekDayString = 'WEEKDAY';
const String monthString = 'MONTH';
const String yearString = 'YEAR';

abstract class DateTimeHelper {
  static String formatTime({
    String dateFormat = DEFAULT_DATE_FORMAT,
    DateTime? dateTime,
  }) {
    try {
      initializeDateFormatting();
      return DateFormat(dateFormat).format(dateTime!);
    } catch (e) {
      throw Exception('dateTime must not be nul');
    }
  }

  ///-------------------------- Range Date -----------------------------

  /// define range date format
  /// 01 Jan 2022
  /// 01 - 31 Jan 2022
  /// 01 Jan - 01 Feb 2022
  /// 01 Jan 2022 - 01 Jan 2023
  static convert2DateToRange(
    DateTime? startDate,
    DateTime? endDate,
  ) {
    if (startDate != null && endDate != null) {
      /// startDate and endDate are the same day
      if (startDate.year == endDate.year &&
          startDate.month == endDate.month &&
          startDate.day == endDate.day) {
        String? startDateFix = DateTimeHelper.convertDateTimeToString(
          date: startDate,
          formatOutput: dateDDMMMYYYYSpace,
        );

        return startDateFix;

        /// startDate and endDate in the same month
      } else if (startDate.year == endDate.year &&
          startDate.month == endDate.month) {
        String startDateFix = DateTimeHelper.getAddZeroInFront(startDate.day);
        String? endDateFix = DateTimeHelper.convertDateTimeToString(
          date: endDate,
          formatOutput: dateDDMMMYYYYSpace,
        );

        return '$startDateFix - $endDateFix';

        /// startDate and endDate in the same year
      } else if (startDate.year == endDate.year) {
        String? startDateFix = DateTimeHelper.convertDateTimeToString(
          date: startDate,
          formatOutput: dateDDMMMSpace,
        );
        String? endDateFix = DateTimeHelper.convertDateTimeToString(
          date: endDate,
          formatOutput: dateDDMMMYYYYSpace,
        );
        return ('${startDateFix.isNotNullOrEmpty ? ('$startDateFix -') : ''} ${endDateFix.isNotNullOrEmpty ? endDateFix : ''}')
            .trim();

        /// startDate and endDate are different years
      } else {
        String? startDateFix = DateTimeHelper.convertDateTimeToString(
          date: startDate,
          formatOutput: dateDDMMMYYSpace,
        );
        String? endDateFix = DateTimeHelper.convertDateTimeToString(
          date: endDate,
          formatOutput: dateDDMMMYYSpace,
        );
        return ('${startDateFix.isNotNullOrEmpty ? ('$startDateFix -') : ''} ${endDateFix.isNotNullOrEmpty ? endDateFix : ''}')
            .trim();
      }

      /// there is only startDate
    } else if (startDate != null) {
      String? startDateFix = DateTimeHelper.convertDateTimeToString(
        date: startDate,
        formatOutput: dateDDMMMYYYYSpace,
      );

      return startDateFix;

      /// there is only endDate
    } else if (endDate != null) {
      String? endDateFix = DateTimeHelper.convertDateTimeToString(
        date: endDate,
        formatOutput: dateDDMMMYYYYSpace,
      );
      return endDateFix;
    }

    return '';
  }

  ///-------------------------- String to DateTime  -----------------------------

  /// default output yyyy-MM-dd HH:mm:ss && input yyyy-MM-dd
  static DateTime? convertStringToDateTime({
    required String date,
    String? formatInput = dateYYYYMMDDStrip,
  }) {
    try {
      DateTime stringToDate;
      if (formatInput == dateDDMONTHYYYYText) {
        List<String> dateString = date.trim().split(' ');
        int year = int.parse(dateString[2]);
        int month = monthEnglish.indexOf(dateString[1]) + 1;
        int day = int.parse(dateString[0]);
        stringToDate = DateTime(year, month, day);
      } else if (formatInput == dateDAYDDMONTHYYYYText) {
        List<String> dateString = date.trim().split(' ');
        int year = int.parse(dateString[3]);
        int month = monthEnglish.indexOf(dateString[2]) + 1;
        int day = int.parse(dateString[1]);
        stringToDate = DateTime(year, month, day);
      } else {
        stringToDate = DateFormat(formatInput).parse(date);
      }
      return stringToDate;
    } catch (e) {
      if (kDebugMode) print(e.toString());
      return null;
    }
  }

  ///-------------------------- Convert String to String  -----------------------

  /// default output dd-MM-yyyy && input yyyy-MM-dd
  static String convertDateStringToString({
    required String date,
    String? formatInput = dateYYYYMMDDStrip,
    String? formatOutput = dateDDMMYYYYStrip,
  }) {
    try {
      /// input
      DateTime? stringToDate = DateTimeHelper.convertStringToDateTime(
        date: date,
        formatInput: formatInput,
      );

      /// output
      if (stringToDate != null) {
        if (formatOutput == dateDDMONTHYYYYText ||
            formatOutput == dateDDMONTHYYYYTextShort ||
            formatOutput == dateDDMONTHYYYYHHMMText) {
          String result =
              "${stringToDate.day} ${(monthEnglish[stringToDate.month - 1]).substring(0, (formatOutput == dateDDMONTHYYYYTextShort ? 3 : null))} ${stringToDate.year}";

          /// output date and time
          if (formatOutput == dateDDMONTHYYYYHHMMText &&
              (formatInput == dateYYYYMMDDHHMMSSStrip ||
                  formatInput == dateDDMMYYYYHHMMSSStrip)) {
            String time = dateToJustTime(
              data: date,
              formatInput: formatInput,
            );
            return result + (time != '' ? (', $time') : time);

            /// output just a date
          } else {
            return result;
          }
        } else if (formatOutput == dateDAYDDMONTHYYYYText) {
          return "${dayEnglish[stringToDate.weekday - 1]}, ${stringToDate.day} ${monthEnglish[stringToDate.month - 1]} ${stringToDate.year}";
        } else {
          String convertDate = DateFormat(formatOutput).format(stringToDate);
          return convertDate;
        }
      } else {
        return date;
      }
    } catch (e) {
      return date;
    }
  }

  ///-------------------------- DateTime to String -----------------------------

  /// default output dd-MM-yyyy && input yyyy-MM-dd
  static String convertDateTimeToString({
    required DateTime date,
    String? formatOutput = dateDDMMYYYYStrip,
    bool? isConvertToLocaleTime = false,
  }) {
    try {
      final dateFormat = DateFormat(formatOutput);
      final dataDate = (isConvertToLocaleTime == true)
          ? dateFormat.format(date.toLocal())
          : dateFormat.format(date);
      return dataDate;
    } catch (e) {
      return '';
    }
  }

  ///-------------------------- DateTime to Just  ------------------------------

  /// HH:mm && input yyyy-MM-dd hh:mm:ss
  static String dateToJustTime({
    required String data,
    String? formatInput = dateYYYYMMDDHHMMSSStrip,
  }) {
    try {
      DateFormat dateFormat = DateFormat(formatInput);
      DateTime dataDate = dateFormat.parse(data);
      return '${getAddZeroInFront(dataDate.hour)}:${getAddZeroInFront(dataDate.minute)}';
    } catch (e) {
      return '';
    }
  }

  /// dd/MM/yyyy && input dd-MM-yyyy
  static String dateToJustDate(String data) {
    try {
      DateFormat dateFormat = DateFormat('dd-MM-yyyy');
      DateTime dataDate = dateFormat.parse(data);
      String convertDate = DateFormat('dd/MM/yyyy').format(dataDate);
      return convertDate;
    } catch (e) {
      return '';
    }
  }

  ///-------------------------- Date Now ---------------------------------------

  static String getMonthByNumber({
    required String data,
  }) {
    try {
      int numberMonth = int.parse(data);
      return monthEnglish[numberMonth - 1];
    } catch (e) {
      return '-';
    }
  }

  static String getStringDateNow() {
    DateTime data = DateTime.now();
    final dateFormat = DateFormat('dd-MMM-yyyy');
    final dataDate = dateFormat.format(data);
    return '$dataDate ${data.hour}:${data.minute}:${data.second}.${data.millisecond}';
  }

  static String getStringDateYearsAgo(int yearsAgo) {
    DateTime data = DateTime.now();
    DateTime past = DateTime(
      data.year - yearsAgo,
      data.month,
      data.day,
    );
    return DateTimeHelper.convertDateTimeToString(
      date: past,
      formatOutput: dateYYYYMMDDStrip,
    );
  }

  static String getStringDateMonthAgo({
    required DateTime data,
    required int monthAgo,
    String? formatOutput = dateYYYYMMDDStrip,
  }) {
    DateTime dateTime = DateTime(
      data.year,
      data.month - monthAgo,
      data.day,
    );
    return DateTimeHelper.convertDateTimeToString(
      date: dateTime,
      formatOutput: formatOutput,
    );
  }

  static String getStringDateMonthAhead({
    required DateTime data,
    required int monthAhead,
    String? formatOutput = dateYYYYMMDDStrip,
  }) {
    DateTime dateTime = DateTime(
      data.year,
      data.month + monthAhead,
      data.day,
    );
    return DateTimeHelper.convertDateTimeToString(
      date: dateTime,
      formatOutput: formatOutput,
    );
  }

  static String getStringDateYearAhead({
    required DateTime data,
    required int yearAhead,
    String? formatOutput = dateYYYYMMDDStrip,
  }) {
    DateTime dateTime = DateTime(
      data.year + yearAhead,
      data.month,
      data.day,
    );
    return DateTimeHelper.convertDateTimeToString(
      date: dateTime,
      formatOutput: formatOutput,
    );
  }

  static int getIntDateNowSecond() {
    try {
      DateTime data = DateTime.now();
      return int.parse(getAddZeroInFront(data.hour) +
          getAddZeroInFront(data.minute) +
          getAddZeroInFront(data.second));
    } catch (e) {
      return 0;
    }
  }

  static int? getIntDate({
    DateTime? date,
  }) {
    try {
      DateTime data = date ?? DateTime.now();
      return int.parse(getAddZeroInFront(data.hour) +
          getAddZeroInFront(data.minute) +
          getAddZeroInFront(data.second) +
          getAddZeroInFront(data.millisecond));
    } catch (e) {
      return null;
    }
  }

  static int getIntWeekDayNow() {
    DateTime data = DateTime.now();
    return data.weekday;
  }

  /// monday is int 1 etc.
  static int getStringToIntWeekDay(String data) {
    for (int i = 0; i < dayEnglish.length; i++) {
      if (data.trim().toLowerCase().contains(dayEnglish[i].toLowerCase()) ||
          data.trim().toLowerCase().contains(dayEnglish[i].toLowerCase())) {
        return i + 1;
      }
    }
    return -1;
  }

  static bool checkIsDateNow(DateTime dataDate) {
    try {
      DateFormat dateFormat = DateFormat('dd-MM-yyyy');
      DateTime dateNow = DateTime.now();
      String now = dateFormat.format(dateNow);
      String date = dateFormat.format(dataDate);
      return now == date;
    } catch (e) {
      return false;
    }
  }

  static bool checkIsDateYesterday(String data) {
    try {
      DateFormat dateFormat = DateFormat('dd-MM-yyyy');
      DateTime dataDate = dateFormat.parse(data);
      DateTime dateNow = DateTime.now();
      DateTime datePast = DateTime(
        dateNow.year,
        dateNow.month,
        dateNow.day - 1,
      );
      String past = dateFormat.format(datePast);
      String date = dateFormat.format(dataDate);

      return past == date;
    } catch (e) {
      return false;
    }
  }

  static bool checkIsDatePast({
    required String data,
    String? dateValidation,
    String? formatInput = dateYYYYMMDDStrip,
  }) {
    try {
      DateTime? dataDate = convertStringToDateTime(
        date: data,
        formatInput: formatInput,
      );
      DateTime? validationDate = dateValidation != null
          ? convertStringToDateTime(
              date: dateValidation,
              formatInput: formatInput,
            )
          : DateTime.now();

      /// is this date more than validation date
      if (dataDate != null && validationDate != null) {
        return dataDate.isBefore(validationDate);
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static bool checkIsDateSame({
    required String data,
    String? dateValidation,
    String? formatInput = dateYYYYMMDDStrip,
  }) {
    try {
      DateTime? dataDate = convertStringToDateTime(
        date: data,
        formatInput: formatInput,
      );
      DateTime? validationDate = dateValidation != null
          ? convertStringToDateTime(
              date: dateValidation,
              formatInput: formatInput,
            )
          : DateTime.now();

      /// is this date more than validation date
      if (dataDate != null && validationDate != null) {
        DateTime resultData = DateTime(
          dataDate.year,
          dataDate.month,
          dataDate.day,
        );
        DateTime resultValidation = DateTime(
          validationDate.year,
          validationDate.month,
          validationDate.day,
        );
        return resultData == resultValidation;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static bool checkIsDateFuture({
    required String data,
    String? dateValidation,
    String? formatInput = dateYYYYMMDDStrip,
  }) {
    try {
      DateTime? dataDate = convertStringToDateTime(
        date: data,
        formatInput: formatInput,
      );
      DateTime? validationDate = dateValidation != null
          ? convertStringToDateTime(
              date: dateValidation,
              formatInput: formatInput,
            )
          : DateTime.now();

      /// is this date more than validation date
      if (dataDate != null && validationDate != null) {
        return dataDate.isAfter(validationDate);
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  ///------------------------------- General  ----------------------------------

  static List<String> monthEnglish = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  static List<String> dayEnglish = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  static String getAddZeroInFront(int data) {
    if (data < 10) {
      return '0$data';
    } else {
      return data.toString();
    }
  }

  static String getAddZeroInFrontYear(int data) {
    if (data < 10) {
      return '000$data';
    } else if (data < 100) {
      return '00$data';
    } else if (data < 1000) {
      return '0$data';
    } else {
      return data.toString();
    }
  }

  ///---------------------------------- Age  ------------------------------------

  /// default input yyyy-MM-dd HH:mm:ss
  /// example 12 years old, 6 months old, 20 days old
  String? getAgeByBirthDateString(
    BuildContext context, {
    required String birthString,
    String? formatInput = dateYYYYMMDDStrip,
  }) {
    try {
      DateFormat dateFormat = DateFormat(formatInput);
      DateTime birth = dateFormat.parse(birthString);
      DateTime today = DateTime.now();

      /// calculate the number of years
      int age = today.year - birth.year;
      if (today.month == birth.month) {
        if (today.day < birth.day) {
          age = age - 1;
        }
      } else if (today.month < birth.month) {
        age = age - 1;
      }

      /// if the user is more than equal to one year old
      if (age > 0) {
        return '$age ${context.s.yearsOld}';

        /// if the user is less than one year old
      } else {
        /// year of birth is still the same year as now
        if (today.year == birth.year) {
          if (today.month == birth.month) {
            if (!(today.day <= birth.day)) {
              /// if the user is a few days old
              return '${today.day - birth.day} ${context.s.daysOld}';
            }
          } else if (today.month > birth.month) {
            int month = today.month - birth.month;
            if (today.day < birth.day) {
              month = month - 1;
            }

            /// if the user is a few months old
            return '$month ${context.s.monthsOld}';
          }

          /// year of birth is not still the same year as now
          /// his birthday was last year
        } else if (today.year == birth.year + 1) {
          if (today.month == birth.month) {
            if (today.day < birth.day) {
              /// if the user is 11 months old
              return '11 ${context.s.monthsOld}';
            }
          } else if (today.month < birth.month) {
            int month = today.month - (12 - birth.month);
            if (today.day < birth.day) {
              month = month - 1;
            }

            /// if the user is a few months old
            return '$month ${context.s.monthsOld}';
          }
        }
      }

      return null;
    } on Exception catch (_) {
      return null;
    }
  }

  /// default input yyyy-MM-dd
  int getAgeByBirthDateJustYear(
    String stringDate, {
    String? formatInput = dateYYYYMMDDStrip,
  }) {
    DateTime date;
    DateFormat dateFormat = DateFormat(formatInput);
    try {
      date = dateFormat.parse(stringDate);
      DateTime today = DateTime.now();

      int year = date.year;
      int month = date.month;
      int day = date.day;
      int age = today.year - year;

      if (today.month == month) {
        if (today.day < day) {
          age = age - 1;
        }
      } else if (today.month < month) {
        age = age - 1;
      }
      return age;
    } on Exception catch (_) {
      return 0;
    }
  }

  /// number of days between two dates
  static int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inDays).round();
  }
}

class DoubleDate {
  DoubleDate({
    required this.dateFrom,
    required this.dateTo,
    required this.range,
  });

  DateTime dateFrom;
  DateTime dateTo;
  String range;
}
