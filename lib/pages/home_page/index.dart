import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:kimo/helpers/constantes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {
  String img1 =
      "https://imgs.search.brave.com/a1YqwbHniy02l766Yv1dUPYsxC0HP6h8v3jQRyS5Fnw/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9iZW5p/bi1pbW1vLmNvbS93/cC1jb250ZW50L3Vw/bG9hZHMvMjAyNC8w/Ni9WaWxsYS1kdXBs/ZXgtYS12ZW5kcmUt/YS1Db3Rvbm91LUFr/cGFrcGEtNTI1eDMy/OC5qcGc";

     String pp =  'https://imgs.search.brave.com/qS0RrHlG-ewdmT8mdhwcG6D4lFDAuQxS5NxbYqRogCA/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9nYWJy/aWVsZ29yZ2kuY29t/L3dwLWNvbnRlbnQv/dXBsb2Fkcy8yMDE5/LzA5L0p1bGllLVIt/MjIzODctRWRpdC0x/MDI0eDY4My5qcGc';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Angèle, ATOLOU',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(pp),
                radius: 20,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trouver le meilleur endroit où rester pour vous.',
                style: TextStyle(
                  fontSize: 18,
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
                  fillColor: Colors.grey[200],
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
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "À proximité",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    label: Text("Voir tout"),
                    icon: Icon(
                      Icons.chevron_right,
                      color: kimoBlue,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 300, // Hauteur des cartes
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildNearbyCard(img1),
                    SizedBox(width: 15),
                    _buildNearbyCard(img1),
                    SizedBox(width: 15),
                    _buildNearbyCard(img1),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommandé",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 10),
              _buildRecommendedCard(img1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNearbyCard(String img) {
    return Container(
      width: 300, // Largeur des cartes
      child: Card(
        color: kimoBlanche,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                img,
                height: 300,
                width: 300,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: kimoGrise,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Villa Luxieux',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 16, color: kimoBlue),
                        SizedBox(width: 4),
                        Text(
                          'Cotonou, Littoral',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.bathtub_outlined, color: Colors.grey, size: 16),
                            SizedBox(width: 4),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.visibility, color: Colors.grey, size: 16),
                            SizedBox(width: 4),
                            Text('7.3'),
                          ],
                        ),
                        Icon(Icons.bookmark, color: kimoBlue, size: 16),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendedCard(String img) {
    return Card(
      color: kimoBlanche,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                img,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('House of Cocotomey',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 16, color: kimoBlue),
                    SizedBox(width: 4),
                    Text(
                      'Cotonou, Littoral',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
