import 'package:flutter/material.dart';
import 'package:pokidex_19660/provider/pokemon_provider.dart';
import 'package:pokidex_19660/screens/information_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: non_constant_identifier_names
  Map<String, Color> ColorMap = {
    "Fire": Colors.red.shade400,
    "Grass": Colors.teal.shade300,
    "Poison": Colors.green.shade800,
    "Bug": Colors.green.shade400,
    "Psychic": Colors.purple.shade900,
    "Water": Colors.blue.shade700,
    "Electric": Colors.yellow.shade300,
    "Ice": Colors.lightBlue.shade200,
    "Ground": Colors.brown.shade400,
    "Normal": Colors.teal.shade100,
    "Flying": Colors.blueGrey.shade100,
    "Fighting": Colors.grey.shade400,
    "Rock": Colors.grey.shade700,
    "Ghost": Colors.purple.shade200,
    "Dragon": Colors.orange.shade400
  };

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      Provider.of<PokemonProvider>(context, listen: false).getAllTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Pokidex')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<PokemonProvider>(builder: (context, value, child) {
            if (value.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              final pokemon = value.pokemon;
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 250,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: pokemon.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => InformationPage(poki: pokemon[index],)));
                    },
                    child: Card(
                      color: ColorMap[pokemon[index].type[0]],
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 8.0),
                        child: Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Spacer(),
                                Image.network(pokemon[index].imageURI,
                                    fit: BoxFit.fill, loadingBuilder:
                                        (context, child, loadingProgress) {
                                  if (loadingProgress != null) {
                                    return CircularProgressIndicator(
                                        value: loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress
                                                .expectedTotalBytes!);
                                  }
                                  return child;
                                })
                              ],
                            ), Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    pokemon[index].name,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 16.0,
                                        fontFamily: "Exo"),
                                        
                                  ),
                                  Theme(
                                        data: ThemeData(
                                          canvasColor:
                                              const Color.fromARGB(128, 0, 0, 0),
                                        ),
                                        child: Chip(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          side: BorderSide.none,
                                          label: Text(pokemon[index].type[0],
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.0,
                                              )),
                                          backgroundColor: Colors.transparent,
                                          surfaceTintColor: Colors.transparent,
                                        ),
                                      ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          }),
        ));
  }
}
