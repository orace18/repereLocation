import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:kimo/pages/home_page/widgets/central_card.dart';
import '../../helpers/constantes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              Text(
                'Angèle, ATOLOU',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
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
                fontSize: 15,
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
                fillColor: kimoGrise,
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
            SizedBox(
              height: 10,
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
               SizedBox(
              height: 10,
            ),
            //CentralCard(),
            // Ajout du card du bar avec chevron que je n'ai pas encore fait 
          ],
        ),
        //CentralCard(),
      ),
    );
  }
}
