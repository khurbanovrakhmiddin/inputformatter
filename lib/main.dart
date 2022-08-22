import 'package:flutter/services.dart';

class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {

    final digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d]+'), '');
   final digitsOnlyEhar = digitsOnly.split('');

   final initialSpleshSimbolCount = newValue.selection.textBefore(newValue.text).replaceAll(RegExp(r'[\d]+'), '').length;

   var cursprPosition = newValue.selection.start - initialSpleshSimbolCount;
   var finalCursorPosition = cursprPosition;
    var newString =  <String>[];

    for(var i = 0; i < digitsOnlyEhar.length;i++){

      if(i == 3 || i == 6|| i == 8){
        newString.add(' ');
        if(i<= cursprPosition)finalCursorPosition += 1;
      }
      newString.add(digitsOnlyEhar[i]);
    }
    return TextEditingValue(
      text: digitsOnly,
      selection: TextSelection.collapsed(offset: finalCursorPosition),

    );


  }
}
