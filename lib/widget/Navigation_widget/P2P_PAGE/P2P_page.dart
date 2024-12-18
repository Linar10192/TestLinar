import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Product/card_product_buy.dart';
import 'package:flutter_application_1/Product/card_product_sell.dart';
import 'package:flutter_application_1/widget/Navigation_widget/P2P_PAGE/buy_hms/buy_hms_page.dart';
import 'package:flutter_application_1/widget/Navigation_widget/P2P_PAGE/sell_hms/sell_hms_page.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class P2pPage extends StatelessWidget {
  const P2pPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Padding(
              padding: EdgeInsets.only(top: 20, left: 2),
              child: Text(
                'P2P трейдинг',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Color.fromARGB(255, 44, 62, 80)),
              ),
            ),
            bottom: const TabBar(
              unselectedLabelColor: Color.fromARGB(255, 44, 62, 80),
              padding: EdgeInsets.only(left: 15),
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 3, color: Colors.blue)),
              dividerColor: Color.fromARGB(255, 231, 231, 231),
              dividerHeight: 3,
              isScrollable: true,
              indicatorPadding: EdgeInsets.only(top: 1),
              tabAlignment: TabAlignment.start,
              labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              indicatorColor: Colors.blue,
              labelPadding: EdgeInsets.all(4),
              labelColor: Colors.blue,
              tabs: [
                Tab(text: 'Покупка'),
                Tab(text: 'Продажа'),
              ],
            ),
          ),
          body: SmartRefresher(
            controller: _refreshController,
            child: TabBarView(children: [
              // Вкладка "Покупка"
              ListView.separated(
                itemCount: context.watch<Store>().products.length,
                padding: const EdgeInsets.only(
                    left: 15, top: 15, right: 15, bottom: 70),
                itemBuilder: (BuildContext context, int index) {
                  final product = context.watch<Store>().products[index];
                  return Card(
                    semanticContainer: true,
                    color: product.ProductIndexl
                        ? const Color.fromARGB(255, 44, 62, 80)
                        : const Color.fromARGB(255, 236, 240, 241),
                    elevation: 0,
                    margin: const EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Stack(
                      children: [
                        // Аватар карточки
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 13),
                              child: CircleAvatar(
                                radius: 20,
                                child: ClipOval(
                                  child: Image.asset(
                                    fit: BoxFit.cover,
                                    product.image.toString(),
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 65, top: 13),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Наименование и время карточки
                              Text(
                                product.name.toString(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: product.ProductIndexl
                                      ? Colors.white
                                      : const Color.fromARGB(255, 44, 62, 80),
                                ),
                              ),
                              Container(
                                width: 45,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 127, 140, 141),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    "${product.time} ${product.timename}",
                                    style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 65, bottom: 15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    product.price.toString(),
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                      color: product.ProductIndexl
                                          ? Colors.white
                                          : const Color.fromARGB(
                                              255, 44, 62, 80),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Text(
                                      product.currency.toString(),
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          color: Color.fromARGB(
                                              255, 127, 140, 141)),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const Text(
                                    'Кол-во:',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color:
                                            Color.fromARGB(255, 127, 140, 141)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      '${product.countHMS} ${product.MoneyHMS}',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: product.ProductIndexl
                                            ? Colors.white
                                            : const Color.fromARGB(
                                                255, 44, 62, 80),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Лимиты:',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color:
                                            Color.fromARGB(255, 127, 140, 141)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      '${product.LimitCards1} - ${product.LimitCards2} ${product.currency}',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: product.ProductIndexl
                                            ? Colors.white
                                            : const Color.fromARGB(
                                                255, 44, 62, 80),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Image.asset(
                                    product.BankColor.toString(),
                                    // ignore: deprecated_member_use
                                    width: 10,
                                    height: 10,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    product.Bank.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: product.ProductIndexl
                                          ? Colors.white
                                          : const Color.fromARGB(
                                              255, 44, 62, 80),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, right: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '${product.transactions} сделок  | ${product.percentage}',
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromARGB(255, 127, 140, 141)),
                              ),
                            ],
                          ),
                        ), // Количество сделок карточки
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 270, top: 135, bottom: 10),
                          child: TextButton(
                            style: TextButton.styleFrom(
                                minimumSize: const Size(70, 30),
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                backgroundColor:
                                    const Color.fromARGB(255, 52, 152, 219)),
                            onPressed: () async {
                              context.read<Store>().addToCart(product);

                              await Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => const BuyHms(),
                                ),
                              );
                              context.read<Store>().removeFromCart(product);
                            },
                            child: const Text('Купить',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12)),
                          ),
                        ), // кнопка
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    (const SizedBox(
                  height: 10,
                )),
              ),
              // Вкладка "Продажа"
              ListView.separated(
                itemCount: context.watch<StoreSell>().products.length,
                padding: const EdgeInsets.only(
                    left: 15, top: 15, right: 15, bottom: 70),
                itemBuilder: (BuildContext context, int index) {
                  final product = context.watch<StoreSell>().products[index];
                  return Card(
                    semanticContainer: true,
                    color: product.ProductIndexl
                        ? Colors.white
                        : const Color.fromARGB(255, 236, 240, 241),
                    elevation: 0,
                    margin: const EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Stack(
                      children: [
                        // Аватар карточки
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 13),
                              child: CircleAvatar(
                                radius: 20,
                                child: ClipOval(
                                  child: Image.asset(
                                    fit: BoxFit.cover,
                                    product.image.toString(),
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 65, top: 13),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Наименование и время карточки
                              Text(
                                product.name.toString(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: product.ProductIndexl
                                      ? Colors.white
                                      : const Color.fromARGB(255, 44, 62, 80),
                                ),
                              ),
                              Container(
                                width: 45,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 127, 140, 141),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    "${product.time} ${product.timename}",
                                    style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 65, bottom: 15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    product.price.toString(),
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                      color: product.ProductIndexl
                                          ? Colors.white
                                          : const Color.fromARGB(
                                              255, 44, 62, 80),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Text(
                                      product.currency.toString(),
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          color: Color.fromARGB(
                                              255, 127, 140, 141)),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const Text(
                                    'Кол-во:',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color:
                                            Color.fromARGB(255, 127, 140, 141)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      '${product.countHMS} ${product.MoneyHMS}',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: product.ProductIndexl
                                            ? Colors.white
                                            : const Color.fromARGB(
                                                255, 44, 62, 80),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Лимиты:',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color:
                                            Color.fromARGB(255, 127, 140, 141)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      '${product.LimitCards1} - ${product.LimitCards2} ${product.currency}',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: product.ProductIndexl
                                            ? Colors.white
                                            : const Color.fromARGB(
                                                255, 44, 62, 80),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Image.asset(
                                    product.BankColor.toString(),
                                    // ignore: deprecated_member_use
                                    width: 10,
                                    height: 10,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    product.Bank.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: product.ProductIndexl
                                          ? Colors.white
                                          : const Color.fromARGB(
                                              255, 44, 62, 80),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, right: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '${product.transactions} сделок  | ${product.percentage}',
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromARGB(255, 127, 140, 141)),
                              ),
                            ],
                          ),
                        ), // Количество сделок карточки
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 270, top: 135, bottom: 10),
                          child: TextButton(
                            style: TextButton.styleFrom(
                                minimumSize: const Size(70, 30),
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                backgroundColor:
                                    const Color.fromARGB(255, 52, 152, 219)),
                            onPressed: () async {
                              context.read<StoreSell>().addToCart(product);

                              await Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => const SellHMSPage(),
                                ),
                              );
                              context.read<StoreSell>().removeFromCart(product);
                            },
                            child: const Text('Продать',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12)),
                          ),
                        ), // кнопка
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    (const SizedBox(
                  height: 10,
                )),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

RefreshController _refreshController = RefreshController(initialRefresh: false);
