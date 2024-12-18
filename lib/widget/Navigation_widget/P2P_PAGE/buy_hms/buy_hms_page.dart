import 'package:flutter/material.dart';
import 'package:flutter_application_1/Product/card_product_buy.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class BuyHms extends StatelessWidget {
  const BuyHms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: SvgPicture.asset('images/back.svg', width: 10)),
        title: const Text(
          'Покупка HMS',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24,
              color: Color.fromARGB(255, 44, 62, 80)),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.separated(
        itemCount: context.watch<Store>().cart != null ? 1 : 0,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Stack(
                children: [
                  Container(
                      padding: const EdgeInsets.only(left: 50, right: 40),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 236, 240, 241)),
                      width: 350,
                      height: 75,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      'Этот ордер завершен, и активы больше не заброкированы на бирже.',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 127, 140, 141),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                ),
                                TextSpan(
                                  text:
                                      ' Не следует отправлять средства без подтверждения',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 44, 62, 80),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: SvgPicture.asset('images/!.svg',
                        height: 20, width: 20),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, top: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 236, 240, 241)),
                  width: 350,
                  height: 160,
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(context.watch<Store>().cart!.price.toString(),
                              style: const TextStyle(
                                  fontSize: 30,
                                  color: Color.fromARGB(255, 44, 62, 80),
                                  fontWeight: FontWeight.w500)),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, top: 10),
                            child: Text(context.watch<Store>().cart!.currency.toString(),
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 127, 140, 141),
                                    fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Кол-во:',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(
                                                255, 127, 140, 141),
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("${context.watch<Store>().cart!.countHMS} ${context.watch<Store>().cart!.MoneyHMS}",
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(
                                                255, 44, 62, 80),
                                            fontWeight: FontWeight.w500)),
                                    const SizedBox(width: 5),
                                  ],
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Лимиты:',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(
                                                255, 127, 140, 141),
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("${context.watch<Store>().cart!.LimitCards1} - ${context.watch<Store>().cart!.LimitCards2} ${context.watch<Store>().cart!.currency}",
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(
                                                255, 44, 62, 80),
                                            fontWeight: FontWeight.w500)),
                                    const SizedBox(width: 5),
                                  ],
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Способ оплаты:',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(
                                                255, 127, 140, 141),
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("${context.watch<Store>().cart!.Bank} ",
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(
                                                255, 44, 62, 80),
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Длительность оплаты:',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(
                                                255, 127, 140, 141),
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("${context.watch<Store>().cart!.time} ${context.watch<Store>().cart!.timename}ут",
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(
                                                255, 44, 62, 80),
                                            fontWeight: FontWeight.w500)),
                                    const SizedBox(width: 5),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              const SizedBox(height: 10),
              Container(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, top: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 236, 240, 241)),
                  width: 350,
                  height: 170,
                  child: Stack(
                    children: [
                      TextField(
                          style: const TextStyle(fontSize: 15),
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              labelStyle: const TextStyle(
                                  color: Color.fromARGB(255, 127, 140, 141),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                              label: const Stack(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [Text('Введите сумму')],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 25),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.end,
                                      children: [Text('RUB')],
                                    ),
                                  ),
                                ],
                              ),
                              contentPadding:
                                  const EdgeInsets.only(right: 20, left: 15),
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 0,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  borderRadius: BorderRadius.circular(10)))),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Я получу',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromARGB(
                                                255, 127, 140, 141)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        '--- HMS',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 44, 62, 80),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ])
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 90),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(320, 50),
                                shadowColor:
                                    const Color.fromARGB(255, 0, 0, 0),
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () => context.read<Store>().buy(),
                              child: const Text('Купить',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15)),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              const SizedBox(height: 10),
              Container(
                width: 350,
                height: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 236, 240, 241)),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: const EdgeInsets.only(
                                left: 20, right: 40, top: 15),
                            child: const Text(
                              'Комментарии',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 44, 62, 80)),
                            )),
                        Container(
                            padding: const EdgeInsets.only(
                                left: 20, right: 40, top: 10),
                            child: const Text(
                              '• Принимаю по СБП на Тинькофф',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 127, 140, 141)),
                            )),
                        Container(
                            padding:
                                const EdgeInsets.only(left: 20, right: 40),
                            child: const Text(
                              '• Принимаю на карту доверенного лица',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 127, 140, 141)),
                            )),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: 350,
                height: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 236, 240, 241)),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: const EdgeInsets.only(
                                left: 20, right: 40, top: 15),
                            child: const Text(
                              'Данные о продавце',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 44, 62, 80)),
                            )),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10),
                          child: Stack(
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Имя продавца:',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color.fromARGB(
                                              255, 127, 140, 141),
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(context.watch<Store>().cart!.name.toString(),
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color:
                                              Color.fromARGB(255, 44, 62, 80),
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                            padding:
                                const EdgeInsets.only(left: 20, right: 20),
                            child: Stack(
                              children: [
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Всего ордеров:',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(
                                                255, 127, 140, 141),
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(context.watch<Store>().cart!.transactions.toString(),
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(
                                                255, 44, 62, 80),
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ],
                            )),
                        Container(
                            padding:
                                const EdgeInsets.only(left: 20, right: 20),
                            child: Stack(
                              children: [
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('% успешных ордеров:',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(
                                                255, 127, 140, 141),
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(context.watch<Store>().cart!.percentage.toString(),
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(
                                                255, 44, 62, 80),
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ],
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            (const SizedBox(
          height: 10,
        )),
      ),
    );
  }
}
