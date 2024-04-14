import 'package:flutter/material.dart';
import 'package:pokidex_19660/model/Pokemon_model.dart';

// ignore: must_be_immutable
class InformationPage extends StatelessWidget {
  Pokemon poki;

  InformationPage({Key? key, required this.poki}) : super(key: key);

  Pokemon getPoki() {
    return poki;
  }

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
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorMap[poki.type[0]] ,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          color: ColorMap[poki.type[0]],
          child: Padding(
            padding: const EdgeInsets.all(8.00),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      poki.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 24.0,
                          fontFamily: "Exo"),
                    ),
                    Text(
                      "#${poki.number}",
                      style: const TextStyle(
                          color: Colors.white, fontSize: 16.0, fontFamily: "Exo"),
                    ),
                  ],
                ),
              ),
              Row(
                children: poki.type.map(
                  (text) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Theme(
                      data: ThemeData(
                        canvasColor: const Color.fromARGB(128, 0, 0, 0),
                      ),
                      child: Chip(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        side: BorderSide.none,
                        label: Text(text,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            )),
                        backgroundColor: Colors.transparent,
                        surfaceTintColor: Colors.transparent,
                      ),
                    ),
                  )
                ).toList(),
              ),
              Image.network(poki.imageURI, scale: 0.5,),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0)
                ),

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [ const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Height", style: TextStyle(fontSize: 16.0),),
                          Text("Weight", style: TextStyle(fontSize: 16.0)),
                          Text("Spawn Time", style: TextStyle(fontSize: 16.0)),
                          Text("Weakness", style: TextStyle(fontSize: 16.0)),
                          Text("Next Evolution", style: TextStyle(fontSize: 16.0)),
                          Text("Previous Evolution", style: TextStyle(fontSize: 16.0)),
                        ],
                      ),
                    ), Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(poki.height, style: const TextStyle(fontSize: 16.0),),
                        Text(poki.weight, style: const TextStyle(fontSize: 16.0)),
                        Text(poki.spawntime, style: const TextStyle(fontSize: 16.0)),
                        Text(poki.weaknesses, style: const TextStyle(fontSize: 16.0)),
                        Text(poki.next_evolution, style: const TextStyle(fontSize: 16.0)),
                        Text(poki.prev_evolution, style: const TextStyle(fontSize: 16.0)),
                      ],
                    )],
                  ),
                ),
              )
            ]),
          ),
        ));
  }
}
