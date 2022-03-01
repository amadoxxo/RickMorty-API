import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty/models/character_response.dart';
import 'package:rick_morty/services/character_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final characterProvider = Provider.of<CharacterServices>(context);

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text('Rick and Morty API'),
        ),
        body: CardsCharacter(
          character: characterProvider.onDisplayCharacter,
        ));
  }
}

class CardsCharacter extends StatelessWidget {
  final List<Character> character;

  const CardsCharacter({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (character.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return ListView.builder(
        itemCount: character.length,
        itemBuilder: (context, index) {
          final characters = character[index];
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: FadeInImage(
                    placeholder: const AssetImage('assets/no-image.jpg'),
                    image: NetworkImage(characters.image),
                    fit: BoxFit.cover,
                  ),
                ),
                ListTile(
                  title: Text(
                    characters.name,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(characters.species),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: const Text('Ver más...'),
                      onPressed: () => {
                        Navigator.pushNamed(context, 'items',
                            arguments: characters)
                      },
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
