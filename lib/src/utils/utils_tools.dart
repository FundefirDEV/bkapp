import "dart:math" as math;
import 'package:bkapp_flutter/environment_config.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'errorHandler/constans_error.dart';
import 'errorRequestHandler/error_request_handler.dart';

class UtilsTools {
  static double getRadiansFromDegree(double degree) => degree * math.pi / 180;

  static String required(dynamic value) {
    if (value == null ||
        value == false ||
        ((value is Iterable || value is String || value is Map) &&
            value.length == 0)) {
      return requiredValue;
    }
    return null;
  }

  static String minPhoneNumber(String number) {
    if (number.length < 6) return incompletePhone;
    return null;
  }

  static String removePhoneFormatter(String number) {
    return '$number'.replaceAll(new RegExp(r'[() -]'), '');
  }

  static String removeMoneyFormatter(String number) {
    return '$number'.replaceAll(new RegExp(r'[$ ,]'), '');
  }

  static String titleCase(String text) {
    try {
      if (text.length <= 1) return text.toUpperCase();
      text = text.toLowerCase();
      var words = text.split(' ');
      var capitalized = words.map((word) {
        var first = word.substring(0, 1).toUpperCase();
        var rest = word.substring(1);
        return '$first$rest';
      });
      return capitalized.join(' ');
    } catch (e) {
      // TODO:Fix the formatter
      return text;
    }
  }

  static String removeCurrencyFormatter(String number) {
    return '$number'.replaceAll(new RegExp(r'[, .]'), '');
  }

  static void showErrorDialog(BuildContext context, String error) {
    SizeConfig().init(context);
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return BottomModal(
              width: SizeConfig.blockSizeHorizontal * 100,
              height: SizeConfig.blockSizeVertical * 45,
              child: ImageBottomModal(
                  modalHeight: 45.0,
                  image: 'assets/images/sad_bot.svg',
                  title: errorRequestHandler(context, error),
                  isBold: true,
                  isBtnAccept: false,
                  titleCloseButton: I18n.of(context).actionTextClose,
                  onPressCancel: () => Navigator.pop(context),
                  technicalData: error));
        });
  }

  static dynamic formatConfig({decimalDigits = 0}) => NumberFormat.currency(
      locale: 'en_US', decimalDigits: decimalDigits, symbol: r'$');

  static dynamic formatTwoDecimals({decimalDigits = 2}) => NumberFormat.currency(
      locale: 'en_US', decimalDigits: decimalDigits, symbol: r'$');

  static String getMounthWithNumber(mount){
    switch (mount) {
      case 1:
        return "january";
        break;
      case 2:
        return "february";
        break;
      case 3:
        return "march";
        break;
      case 4:
        return "april";
        break;
      case 5:
        return "may";
        break;
      case 6:
        return "june";
        break;
      case 7:
        return "july";
        break;
      case 8:
        return "august";
        break;
      case 9:
        return "september";
        break;
      case 10:
        return "october";
        break;
      case 11:
        return "november";
        break;
      case 12:
        return "december";
        break;
    }
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (EnvironmentConfig.ENV == 'DEV') {
      // TODO: 🙏 Please add a ENV for Regressive Test
      return newValue;
    }
    if (newValue.selection.baseOffset == 0) {
      print(true);
      return newValue;
    }
    int value = int.parse(newValue.text);
    final formatter =
        NumberFormat.currency(locale: "en", decimalDigits: 0, symbol: '');
    String newText = formatter.format(value);
    return newValue.copyWith(
        text: newText,
        selection: new TextSelection.collapsed(offset: newText.length));
  }
}

class PhoneFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = StringBuffer();

    if (newTextLength >= 1) {
      newText.write('(');
      if (newValue.selection.end >= 1) selectionIndex++;
    }
    if (newTextLength >= 4) {
      newText.write(newValue.text.substring(0, usedSubstringIndex = 3) + ') ');
      if (newValue.selection.end >= 3) selectionIndex += 2;
    }
    if (newTextLength >= 7) {
      newText.write(newValue.text.substring(3, usedSubstringIndex = 6) + '-');
      if (newValue.selection.end >= 6) selectionIndex++;
    }
    if (newTextLength >= 11) {
      newText.write(newValue.text.substring(6, usedSubstringIndex = 10) + ' ');
      if (newValue.selection.end >= 10) selectionIndex++;
    }

    if (newTextLength >= usedSubstringIndex)
      newText.write(newValue.text.substring(usedSubstringIndex));
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
