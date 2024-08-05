import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:kimo/pages/bookmark_page/index.dart';
import 'package:kimo/pages/calendar_page/index.dart';
import 'package:kimo/pages/home_page/widgets/central_card.dart';
import 'package:kimo/pages/profil_page/index.dart';
import '../../helpers/constantes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    BookmarkPage(),
    CalendarPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            'Angèle, ATOLOU',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Trouver le meilleur endroit où rester pour vous.',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            GFSearchBar(
              searchList: [
                'Villa Luxieux',
                'House of Cocotomey',
                'Maison Moderne'
              ],
              searchBoxInputDecoration: InputDecoration(
                hintText: 'Rechercher une maison',
                filled: true,
                fillColor: kimoBlanche,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                suffixIcon: Icon(Icons.filter_list, color: kimoBlue),
              ),
              overlaySearchListItemBuilder: (String item) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    item,
                    style: const TextStyle(fontSize: 18),
                  ),
                );
              },
              searchQueryBuilder: (query, list) {
                return list
                    .where((item) =>
                        item.toLowerCase().contains(query.toLowerCase()))
                    .toList();
              },
              onItemSelected: (String item) {
                print('$item selected');
              },
            ),
            Row(
              children: [
                Text("Populaire"),
                TextButton.icon(onPressed: (){

                }, label: Text("Voir plus"),
                icon: Icon(Icons.chevron_right, color: kimoGrise,),
                )
              ],
            ),
            CentralCard(),
            // Ajout du card du bar avec chevron que je n'ai pas encore fait 
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kimoBlue,
        unselectedItemColor: kimoGrise,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
