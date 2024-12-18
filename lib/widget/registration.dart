import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Image.asset('images/login.png', height: 20),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios,
                color: Color.fromARGB(255, 55, 111, 242), size: 20,),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            const Positioned(
              left: 125,
              child: Text(
                'Введите номер',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            const Positioned.fill(
              top: 30,
              left: 30,
              right: 50,
              child: Text(
                  'Ваш номер телефона будет использоваться для входа в аккаунт',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Form(
                child: Column(
                  children: [
                    const SizedBox(height: 85.0),
                    SizedBox(
                      height: 40,
                      child: TextField(
                        keyboardType: TextInputType.number,
                          inputFormatters: [RuPhoneInputFormatter()],
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(left: 15, top: 8),
                              child: Text('+7', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                            ),
                              fillColor: const Color.fromARGB(31, 163, 163, 163),
                              filled: true,
                              contentPadding:
                                  const EdgeInsets.only(left: 50, right: 40),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 69, 117, 230)),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(width: 0, color: Color.fromARGB(255, 146, 146, 146)),
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Номер телефона',
                            hintStyle: const TextStyle(
                              fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 167, 156, 156)))),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 23.0, right: 24, bottom: 45.0),
                child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: const Color.fromARGB(255, 0, 0, 0),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: (){_showSimpleDialog;},
                  child: const Text('Продолжить',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                )),
              ),
            ),
          ],
        ));
  }
}

void _showSimpleDialog(dynamic context) {
    
    showDialog(
        context: context,
        builder: (context) {
          return const SimpleDialog(
            title: Text('Chosse an Option'),
          );
        });
  }

///класс форматирования вводимых телефонов с учетом массы российских номеров. Позволяет вводить телефоны с 7,9,8
///
///the formatting class of the entered phones, taking into account the masses of Russian numbers. Allows you to enter phones with 7,9,8
class RuPhoneInputFormatter extends TextInputFormatter {
  String _formattedPhone = "";
  bool _isRu = false;

  RuPhoneInputFormatter({
    String? initialText,
  }) {
    if (initialText != null) {
      formatEditUpdate(
          TextEditingValue.empty, TextEditingValue(text: initialText));
    }
  }

  ///Задает номер телефона в маске
  ///
  /// Specifies the phone number in the mask
  void setPhone(String phone) {
    formatEditUpdate(TextEditingValue.empty, TextEditingValue(text: phone));
  }

  ///Возвращает телефон в маске
  ///
  ///Returns the phone in with a mask
  String getMaskedPhone() {
    return _formattedPhone;
  }

  ///Возвращает телефон без маски и +. Для российских телефонов номер начинается с 9
  ///
  ///Returns phone without mask and +. For Russian phones, the number starts with 9
  String getClearPhone() {
    if (_formattedPhone.isEmpty) {
      return '';
    }
    if (!_isRu) {
      return _formattedPhone.replaceAll(RegExp(r'\D'), '');
    }
    return _formattedPhone.replaceAll(RegExp(r'\D'), '').substring(
        1,
        (_formattedPhone.replaceAll(RegExp(r'\D'), '').length >= 11)
            ? 11
            : _formattedPhone.replaceAll(RegExp(r'\D'), '').length);
  }

  ///Проверяет, заполнен ли телефон. Для нерусских телефонов всегда актуально
  ///
  ///Checks if the phone is full. For non-Russian phones always true
  bool isDone() {
    if (!_isRu) {
      return true;
    }
    return (_formattedPhone.replaceAll(RegExp(r'\D'), '').length > 10);
  }

  ///Проверяет, является ли номер русским
  ///checks if the number is Russian
  bool get isRussian => _isRu;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text.replaceAll(RegExp(r'\D'), '');
    int selectionStart = oldValue.selection.end;

    if (oldValue.text == '${newValue.text} ') {
      _formattedPhone = '';
      return TextEditingValue(
          text: _formattedPhone,
          selection: TextSelection(
              baseOffset: _formattedPhone.length,
              extentOffset: _formattedPhone.length,
              affinity: newValue.selection.affinity,
              isDirectional: newValue.selection.isDirectional));
    }

    if (selectionStart != _formattedPhone.length) {
      _formattedPhone = _formattingPhone(text);

      return TextEditingValue(
          text: _formattedPhone,
          selection: TextSelection(
              baseOffset: newValue.selection.baseOffset,
              extentOffset: newValue.selection.extentOffset,
              affinity: newValue.selection.affinity,
              isDirectional: newValue.selection.isDirectional));
    }

    _formattedPhone = _formattingPhone(text);

    return TextEditingValue(
        text: _formattedPhone,
        selection: TextSelection(
            baseOffset: _formattedPhone.length,
            extentOffset: _formattedPhone.length,
            affinity: newValue.selection.affinity,
            isDirectional: newValue.selection.isDirectional));
  }

  String _formattingPhone(String text) {
    text = text.replaceAll(RegExp(r'\D'), '');
    if (text.isNotEmpty) {
      String phone = '';
      if (['7', '8', '9'].contains(text[0])) {
        _isRu = true;
        if (text[0] == '9') {
          text = '7$text';
        }
        String firstSymbols = (text[0] == '8') ? '8' : '';
        phone = '$firstSymbols ';
        if (text.length > 1) {
          phone += '(${text.substring(1, (text.length < 4) ? text.length : 4)}';
        }
        if (text.length >= 5) {
          phone +=
              ') ${text.substring(4, (text.length < 7) ? text.length : 7)}';
        }
        if (text.length >= 8) {
          phone += '-${text.substring(7, (text.length < 9) ? text.length : 9)}';
        }
        if (text.length >= 10) {
          phone +=
              '-${text.substring(9, (text.length < 11) ? text.length : 11)}';
        }
        return phone;
      } else {
        _isRu = false;
        return '+$text';
      }
    }
    return '';
  }
}