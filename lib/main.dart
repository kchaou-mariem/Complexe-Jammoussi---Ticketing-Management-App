import 'package:complexe_jammoussi/LoginPage.dart';
import 'package:complexe_jammoussi/calendrier_Page.dart';
import 'package:flutter/material.dart';
import 'SpectaclesReservesPage.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class Spectacle {
  final String nom;
  final String horaire;
  final double prix;
  final String image;
  final String description;
  final int duree; // en heures
  final DateTime date;

  Spectacle({
    required this.nom,
    required this.horaire,
    required this.prix,
    required this.image,
    required this.description,
    required this.duree,
    required this.date,
  });
}

class MyApp extends StatelessWidget {
  final List<Spectacle> spectacles = [
    Spectacle(
      nom: '60 ans chanson',
      horaire: '18:00',
      prix: 20.0,
      image: 'assets/images/60ansChanson.jpg',
      description:
          'Edith Piaf, Dalida, Charles Aznavour, Michael Jackson, Queen, Cheb Khaled, Toto Cutugno et bien d autres vous donnent rendez-vous le 17 Novembre 2023 à 15H au complexe culturel Mohamed Jammousi à Sfax. Nous vous invitons à voir et à revoir 60 ans en chansons le temps d une soirée, des chansons que vous avez tant fredonnées revisitées par le Carthage Symphony Orchestra, choeur et orchestre.',
      duree: 2,
      date: DateTime(2023, 5, 20),
    ),
    Spectacle(
      nom: 'أطياف',
      horaire: '20:00',
      prix: 25.0,
      image: 'assets/images/atyef.webp',
      description:
          'Edith Piaf, Dalida, Charles Aznavour, Michael Jackson, Queen, Cheb Khaled, Toto Cutugno et bien d autres vous donnent rendez-vous le 17 Novembre 2023 à 15H au complexe culturel Mohamed Jammousi à Sfax. Nous vous invitons à voir et à revoir 60 ans en chansons le temps d une soirée, des chansons que vous avez tant fredonnées revisitées par le Carthage Symphony Orchestra, choeur et orchestre.',
      duree: 1,
      date: DateTime(2023, 6, 15),
    ),
    Spectacle(
      nom: 'seven skies',
      horaire: '15:00',
      prix: 15.0,
      image: 'assets/images/sevenSkies.jpg',
      description:
          'Edith Piaf, Dalida, Charles Aznavour, Michael Jackson, Queen, Cheb Khaled, Toto Cutugno et bien d autres vous donnent rendez-vous le 17 Novembre 2023 à 15H au complexe culturel Mohamed Jammousi à Sfax. Nous vous invitons à voir et à revoir 60 ans en chansons le temps d une soirée, des chansons que vous avez tant fredonnées revisitées par le Carthage Symphony Orchestra, choeur et orchestre.',
      duree: 3,
      date: DateTime(2023, 7, 10),
    ),
    Spectacle(
      nom: 'USKANA',
      horaire: '22:00',
      prix: 30.0,
      image: 'assets/images/uskana.jpg',
      description:
          'Edith Piaf, Dalida, Charles Aznavour, Michael Jackson, Queen, Cheb Khaled, Toto Cutugno et bien d autres vous donnent rendez-vous le 17 Novembre 2023 à 15H au complexe culturel Mohamed Jammousi à Sfax. Nous vous invitons à voir et à revoir 60 ans en chansons le temps d une soirée, des chansons que vous avez tant fredonnées revisitées par le Carthage Symphony Orchestra, choeur et orchestre.',
      duree: 2,
      date: DateTime(2023, 8, 5),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Complexe Mohamed Jamoussi'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 58, 56, 49),
        ),
        body: Column(
          children: [
            const Align(
              alignment: Alignment.topCenter,
              child: Image(
                image: AssetImage('assets/images/logo.png'),
                height: 200,
                width: double.infinity,
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            const SizedBox(height: 10),
            const Text(
              'Spectacles Disponibles',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: spectacles.length,
                itemBuilder: (context, index) {
                  return index % 2 == 0
                      ? Row(
                          children: [
                            buildClickableSpectacleCard(
                                context, spectacles[index]),
                            buildClickableSpectacleCard(
                                context, spectacles[index + 1]),
                          ],
                        )
                      : SizedBox.shrink(); // Keeps the two-column layout aligned
                },
                    // Ajoutez la logique pour réserver les tickets
                    print('Réserver');
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  // Return to the home page.
                  Navigator.pop(context);
                },
              ),
              IconButton(
                icon: Icon(Icons.login),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.calendar_today),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => calendrier_Page(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildClickableSpectacleCard(
      BuildContext context, Spectacle spectacle) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SpectacleDetailsPage(spectacle: spectacle),
            ),
          );
        },
        child: Card(
          margin: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
      ),
    );
  }
}

class SpectacleDetailsPage extends StatelessWidget {
  final Spectacle spectacle;

  SpectacleDetailsPage({required this.spectacle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(spectacle.nom),
        backgroundColor: Color.fromARGB(255, 58, 56, 49),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              spectacle.image,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              spectacle.nom,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              spectacle.description,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildDetailIcon(
                    Icons.access_time, 'Durée', '${spectacle.duree} heures'),
                buildDetailIcon(
                    Icons.attach_money, 'Prix', '\$${spectacle.prix}'),
                buildDetailIcon(Icons.calendar_today, 'Date',
                    '${spectacle.date.day}/${spectacle.date.month}/${spectacle.date.year}'),
                buildDetailIcon(Icons.alarm, 'Début', spectacle.horaire),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Nombre de tickets à réserver',
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  width: 80,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SpectaclesReservesPage(
                      spectacleReserve: spectacle,
                    ),
                  ),
                );
                print('Réserver');
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(
                    255, 58, 56, 49), // Couleur de fond du bouton
                onPrimary: Colors.white, // Couleur du texte du bouton
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Bordures arrondies
                ),
              ),
              child: const Text('Réserver'),
            ),
            const SizedBox(height: 10),
            const Divider(color: Colors.black),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                // Return to the home page.
                Navigator.pop(context);
              },
            ),
            IconButton(
              icon: const Icon(Icons.calendar_today),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => calendrier_Page(),
                  ),
                );
              },
            ),
            Image.asset(
              'assets/images/logo.png',
              height: 50,
              width: 50,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDetailIcon(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, size: 30),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 12)),
        Text(value, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
