import 'package:intl/intl.dart';

formatPrice(double value) {
  var f = NumberFormat("#,##0", "en_US");
  return f.format(value);
}
