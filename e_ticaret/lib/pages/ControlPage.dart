import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret/pages/settings/Pages/Settings.dart';
import 'package:e_ticaret/service/Function.dart';
import 'package:e_ticaret/style/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'Favorites.dart';
import 'basket/Basket.dart';

class ControlPage extends StatefulWidget {
  User? user;
  ControlPage(this.user, {super.key});

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  int _currentIndex = 0;
  late PageController _pageController;
  String? _kullaniciAdi;

  firebaseData(
    User? user,
  ) async {
    var collection = FirebaseFirestore.instance.collection('Kullanıcılar');
    var querySnapshot = await collection.get();
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      var email = data['email'];
      var kullaniciadi = data['Kullanıcı Adı'];

      if (email == user?.email) {
        _kullaniciAdi = kullaniciadi;
        break;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    setState(() {
      firebaseData(widget.user);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [MenuHeader(_kullaniciAdi ?? ""), MenuItems(widget.user)],
          ),
        ),
      ),
      body: SizedBox(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            const HomePage(),
            const Favorites(),
            const Basket(),
            settings(widget.user)
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Appcolor,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              activeColor: EnabledColor,
              inactiveColor: TextColor,
              title: const Text('Ana Ekran'),
              icon: const Icon(
                Icons.home,
              )),
          BottomNavyBarItem(
              activeColor: EnabledColor,
              inactiveColor: TextColor,
              title: const Text('Favoriler'),
              icon: const Icon(Icons.favorite)),
          BottomNavyBarItem(
              activeColor: EnabledColor,
              inactiveColor: TextColor,
              title: const Text('Sepet'),
              icon: const Icon(Icons.shopping_basket)),
          BottomNavyBarItem(
              activeColor: EnabledColor,
              inactiveColor: TextColor,
              title: const Text('Ayarlar'),
              icon: const Icon(Icons.settings)),
        ],
      ),
    );
  }
}

class MenuHeader extends StatelessWidget {
  String kullanici;
  MenuHeader(this.kullanici, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Appcolor2,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/login.jpg"),
              radius: 40,
            ),
            const SizedBox(
              height: 12,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Hoşgeldiniz",
                style: TextStyle(color: TextColor, fontSize: 19),
              ),
            ),
            Text(
              kullanici,
              style: const TextStyle(color: TextColor, fontSize: 20),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItems extends StatelessWidget {
  User? user;
  MenuItems(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16,
        children: [
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              /*Navigator.push(context,
                  MaterialPageRoute(builder: ((context) =>  HomePage()))); */
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text("Favoriler"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const Favorites())));
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_basket),
            title: const Text("Sepet"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const Basket())));
            },
          ),
          const Divider(
            color: Colors.black54,
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Ayarlar"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => settings(user))));
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text("Hata Bildirimi"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Çıkış Yap"),
            onTap: () {
              signOut(context);
            },
          )
        ],
      ),
    );
  }
}
