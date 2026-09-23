// Reserved show ticket page.
import 'package:complexe_jammoussi/main.dart';
import 'package:flutter/material.dart';

class SpectaclesReservesPage extends StatelessWidget {
  final Spectacle spectacleReserve;

  SpectaclesReservesPage({required this.spectacleReserve});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Billet Réservé'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 58, 56, 49),
      ),
      body: buildReservationCard(spectacleReserve),
    );
  }

  Widget buildReservationCard(Spectacle spectacle) {
    return Card(
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Show artwork and summary.
            // Partie gauche avec l'image, le nom, l'horaire et le prix
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    spectacle.image,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          spectacle.nom,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text('Horaire: ${spectacle.horaire}'),
                        Text('Prix: ${spectacle.prix} \$'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Official stamp artwork.
            // Partie droite avec l'image de cachet
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/cachet.png',
                  height: 200, 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
