import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kimo/helpers/constantes.dart';
import 'package:kimo/pages/profil_page/widgets/graphe.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kimoBlanche,
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: kimoGrise, size: 30),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text('Profil'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Section de profil
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                      'https://imgs.search.brave.com/qS0RrHlG-ewdmT8mdhwcG6D4lFDAuQxS5NxbYqRogCA/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9nYWJy/aWVsZ29yZ2kuY29t/L3dwLWNvbnRlbnQv/dXBsb2Fkcy8yMDE5/LzA5L0p1bGllLVIt/MjIzODctRWRpdC0x/MDI0eDY4My5qcGc'),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nom Prénoms',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.phone, color: Colors.grey),
                          SizedBox(width: 4),
                          Text('Téléphone'),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.email, color: Colors.grey),
                          SizedBox(width: 4),
                          Text('Email'),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Action d'édition
                    },
                    child: Text('Éditer', style: TextStyle(color:kimoBlanche),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kimoBlue, 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Cartes statistiques
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _buildStatCard('Annonces', '30', Icons.edit),
                _buildStatCard('Demandes', '30', Icons.list),
                _buildStatCard('Notifications', '30', Icons.notifications),
                _buildStatCard('Annonces défilantes', '30', Icons.campaign),
              ],
            ),
            SizedBox(height: 20),

            // Section Audiences (Graphique)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Audiences',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 200,
                    child: PieChartComposant()
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildLegend('Annonces', kimoBlue),
                      _buildLegend('Demandes', Colors.orange),
                      _buildLegend('Notifications', Colors.green),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      
    );
  }

  Widget _buildStatCard(String title, String count, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: kimoBlue),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            count,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: kimoBlue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegend(String title, Color color) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          color: color,
        ),
        SizedBox(width: 8),
        Text(title),
      ],
    );
  }
}
