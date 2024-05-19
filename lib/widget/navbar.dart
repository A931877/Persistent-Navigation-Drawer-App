import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:navigation_drawer/views/cartview.dart';
import 'package:navigation_drawer/views/homeview.dart';
import 'package:navigation_drawer/views/orderview.dart';
import 'package:navigation_drawer/views/profilview.dart';
import 'package:navigation_drawer/views/settingsview.dart';
import 'package:navigation_drawer/widget/infosbottom.dart';

enum NavItem { HomeView, ProfilView, OrderView, CartView }

class NavigItem {
  final NavItem item;
  final String title;
  final IconData icon;

  NavigItem(this.item, this.title, this.icon);
}

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final List<NavigItem> listitem = [
    NavigItem(NavItem.HomeView, "Home", IconlyBold.home),
    NavigItem(NavItem.ProfilView, "Profil", IconlyBold.profile),
    NavigItem(NavItem.OrderView, "Orders", IconlyBold.category),
    NavigItem(NavItem.CartView, "Cart", IconlyBold.bag_2),
  ];
  int _selectedIndex = 0;
  String _getTitle() {
    return listitem[_selectedIndex].title;
  }

  void _navigateTo(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView.builder(
          itemCount: listitem.length + 1,
          itemBuilder: ((context, index) {
            if (index == 0) {
              return const UserAccountsDrawerHeader(
                accountName: Text(
                  'John Doe',
                  style: TextStyle(
                    color: Color.fromARGB(211, 255, 255, 255),
                  ),
                ),
                accountEmail: Text(
                  'john.doe@example.com',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/i3.jpg'),
                        fit: BoxFit.cover)),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/i1.jpg'),
                ),
              );
            } else {
              final item = listitem[index - 1];
              return ListTile(
                  leading: Icon(item.icon),
                  title: Text(item.title),
                  selected: index - 1 == _selectedIndex,
                  onTap: () {
                    setState(() {
                      _navigateTo(index - 1);
                      _selectedIndex = index - 1;
                    });
                    // Ferme le drawer
                    Navigator.pop(context);
                  });
            }
          }),
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 112, 119, 249),
        title: Text(
          _getTitle(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              CupertinoPageRoute(builder: (_) => const SettingsView()));
        },
        child: const Icon(IconlyBold.setting),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeView(onItemSelected: _navigateTo),
          ProfilView(),
          OrderView(onItemSelected: _navigateTo),
          CartView(onItemSelected: _navigateTo),
        ],
      ),
      bottomNavigationBar: const InfoBottom(),
    );
  }
}
