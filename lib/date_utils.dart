import 'package:intl/intl.dart';

extension DateFormatting on String{
 String formatDate(){
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(this);
    var outpuFormat = DateFormat('yyyy');
    var outputDate = outpuFormat.format(inputDate);
    return outputDate;
  }
}