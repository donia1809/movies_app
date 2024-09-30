import 'package:intl/intl.dart';

extension DateFormatting on String{
 String formatDate(){
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(this);
    var outputFormat = DateFormat('yyyy');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }
}