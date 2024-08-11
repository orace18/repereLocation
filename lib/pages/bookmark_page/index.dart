import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kimo/helpers/constantes.dart';


class BookmarkPage extends StatelessWidget {

  String img1 =
      "https://imgs.search.brave.com/a1YqwbHniy02l766Yv1dUPYsxC0HP6h8v3jQRyS5Fnw/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9iZW5p/bi1pbW1vLmNvbS93/cC1jb250ZW50L3Vw/bG9hZHMvMjAyNC8w/Ni9WaWxsYS1kdXBs/ZXgtYS12ZW5kcmUt/YS1Db3Rvbm91LUFr/cGFrcGEtNTI1eDMy/OC5qcGc";
 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stack pour superposer l'icône de retour et la Card sur l'image
            Stack(
              children: [
                // Image de la villa
                Container(
                  height: 300.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(img1),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Icône de retour
                Positioned(
                  top: 40, // pour positionner sous la barre de statut
                  left: 16,
                  child: IconButton(
                    icon: Icon(Icons.chevron_left, color: Colors.white, size: 30),
                    onPressed: () {
                      // Action pour retourner en arrière
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                // Card contenant le nom, emplacement, étoile, et bookmark
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: -0.5, // Positionner la carte légèrement en dehors de l'image
                  child: Card(
                    color: kimoGrise,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Villa Luxieux',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 20),
                              SizedBox(width: 4),
                              Text('7.3'),
                              SizedBox(width: 10),
                              Icon(Icons.bookmark_border, color: kimoBlue),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40), // Pour compenser l'espace pris par la Card en dehors de l'image
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Nos annonces', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: List.generate(2, (index) => _buildRequestCard(img1)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: List.generate(1, (index) => _buildRequestCard(img1)),
              ),
            ),
          ],
        ),
      ),
      
    );
  }

  Widget _buildRequestCard(String img) {
    return Card(
      margin: EdgeInsets.only(bottom: 15),
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Villa Luxieux', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text('Cotonou, Littoral', style: TextStyle(color: Colors.grey)),
                  ],
                ),
                Text('15000F/mois', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.bookmark, color: kimoBlue, size: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

