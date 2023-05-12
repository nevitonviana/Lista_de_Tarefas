import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class Formatter {
  data(String? data) {
    if (data.toString() != "null" && data != "") {
      initializeDateFormatting("pt_BR");
      var formatDate = DateFormat.MEd('pt_BR');
      DateTime convertDate = DateTime.parse(data!);
      return formatDate.format(convertDate);
    } else {
      return '';
    }
  }
}
//yMEd("pt_BR")
//('dd-MM  kk:mm:a')
//MEd
// Md
