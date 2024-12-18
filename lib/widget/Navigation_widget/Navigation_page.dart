import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/Navigation_widget/P2P_PAGE/P2P_page.dart';
import 'package:flutter_svg/flutter_svg.dart';




class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: MyBottomNavigationWidget());
  }
}



final List<Widget> _navigationPages = [
  const P2pPage(),
  const Center(child: Text('Информация')),
  const Center(child: Text('Информация')),
  const Center(child: Text('Информация')),
];




class MyBottomNavigationWidget extends StatefulWidget {
  const MyBottomNavigationWidget({super.key});

  @override
  State<MyBottomNavigationWidget> createState() => _MyBottomNavigationWidget();
}

// панель навигации
class _MyBottomNavigationWidget extends State<MyBottomNavigationWidget> {
  int _itemSelected = 0;

  void _bottomBarNavigation(int index) {
    setState(() {
      _itemSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _navigationPages[_itemSelected],
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromARGB(255, 208, 208, 208), width: 1.5),
            borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15))), 
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0)), 
          child: BottomNavigationBar(
            selectedLabelStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
            unselectedLabelStyle:
                const TextStyle(fontSize: 13, fontWeight: FontWeight.w800),
            currentIndex: _itemSelected,
            onTap: _bottomBarNavigation,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            fixedColor: const Color.fromARGB(255, 38, 135, 254),
            items: [
              // 1 кнопка "P2P-торги"
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'images/iconbar1.svg',
                  color: const Color.fromARGB(255, 127, 140, 141),
                  width: 25,
                ),
                label: 'P2P-торги',
                activeIcon: SvgPicture.asset(
                  'images/iconbar1.svg',
                  colorFilter: const ColorFilter.mode(
                      Color.fromARGB(255, 52, 152, 219), BlendMode.srcIn),
                  width: 25,
                ),
              ),
              // 2 кнопка "Ордера"
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'images/iconbar2.svg',
                  color: const Color.fromARGB(255, 127, 140, 141),
                  width: 25,
                ),
                label: 'Ордера',
                activeIcon: SvgPicture.asset(
                  'images/iconbar2.svg',
                  colorFilter: const ColorFilter.mode(
                      Color.fromARGB(255, 52, 152, 219), BlendMode.srcIn),
                  width: 25,
                ),
              ),
              // 3 кнопка "Объявления"
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'images/iconbar3.svg',
                  color: const Color.fromARGB(255, 127, 140, 141),
                  width: 25,
                ),
                label: 'Объявления',
                activeIcon: SvgPicture.asset(
                  'images/iconbar3.svg',
                  colorFilter: const ColorFilter.mode(
                      Color.fromARGB(255, 52, 152, 219), BlendMode.srcIn),
                  width: 25,
                ),
              ),
              // 4 кнопка "Кабинет"
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'images/iconbar4.svg',
                  color: const Color.fromARGB(255, 127, 140, 141),
                  width: 25,
                ),
                label: 'Кабинет',
                activeIcon: SvgPicture.asset(
                  'images/iconbar4.svg',
                  colorFilter: const ColorFilter.mode(
                      Color.fromARGB(255, 52, 152, 219), BlendMode.srcIn),
                  width: 25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
