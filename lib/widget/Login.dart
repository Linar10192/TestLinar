import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/registration.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String? errorText;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'admin' && password == 'admin') {
      errorText = null;
      Navigator.of(context).pushReplacementNamed('/Main_menu');
    } else {
      errorText = 'Аккаунт не найден';
    }
    setState(() {});
  }

  void _resetPassword() {
    print('Resset password');
  }

  @override
  Widget build(BuildContext context) {
    final errorText = this.errorText;
    const image = AssetImage('images/login.png');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50, width: 50, child: Image(image: image)),
              const Text('demo',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      height: 2,
                      fontSize: 17,
                      fontWeight: FontWeight.w500)),
                      const SizedBox(height: 15),
              Center(
                child: SizedBox(
                  height: 40,
                  width: 360,
                  child: TextField(
                    style: const TextStyle(fontSize: 15),
                      controller: _loginTextController,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          fillColor: const Color.fromARGB(31, 255, 255, 255),
                          filled: true,
                          contentPadding:
                              const EdgeInsets.only(right: 20, left: 15),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.blue),
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 0, color: Color.fromARGB(255, 146, 146, 146)),
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Телефон или почта',
                          hintStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 167, 156, 156)))),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: SizedBox(
                  height: 40,
                  width: 360,
                  child: TextField(
                  style: const TextStyle(fontSize: 15),
                      controller: _passwordTextController,
                      obscureText: true,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.only(right: 20, left: 15),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color:Colors.blue),
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 0, color: Color.fromARGB(255, 146, 146, 146)),
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Пароль',
                          hintStyle: const TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Color.fromARGB(255, 119, 119, 119)))),
                ),
              ),
              
              const SizedBox(height: 10),

              // Если вводим не верный пароль.
              if (errorText != null) ...[
                SizedBox(
                    width: 370,
                    height: 20,
                    child: Text(errorText,
                        style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.red,
                            fontSize: 12)))
              ],

              const SizedBox(height: 10),

              SizedBox(
                width: 360,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: const Color.fromARGB(255, 0, 0, 0),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: _auth,
                  child: const Text('Войти',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 120),
              SizedBox(
                width: 360,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: const Color.fromARGB(255, 0, 0, 0),
                    backgroundColor: const Color.fromARGB(255, 46, 165, 58),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push( context, CupertinoPageRoute(builder: (context) => const Registration()));
                  },
                  child: const Text('Зарегистрироваться',
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 15)),
                ),
              ),
              const SizedBox(height: 5),
            ],
          ),
    );
  }
}
