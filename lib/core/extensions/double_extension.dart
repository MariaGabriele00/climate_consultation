import '../constants/constants.dart';

extension DoubleExtension on double {
  String tempRound() {
    return toStringAsFixed(Constants.tempDecimals);
  }
}
