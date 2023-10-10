import 'package:flutter/material.dart';
import 'package:soar_quest/soar_quest.dart';

import 'spoonacular_api.dart';

void main() async {
  await SQApp.init('PrepPal');

  final recipe = LocalCollection(
    id: 'recipe',
    fields: [
      SQStringField('Recipe name'),
      SQStringField('Recipe instructions')..editable = false,
      SQImageLinkField('Delicious!!')..editable = false,
    ],
  )..onDocSaveCallback = (doc) async {
      final (title, instructions, image) =
          await fetchRecipe(doc.getValue('Recipe name'));
      doc.setValue('Delicious!!', image);
      doc.setValue('Recipe name', title);
      doc.setValue('Recipe instructions', instructions);
    };

  final randomRecipe = LocalCollection(
    id: 'random',
    fields: [
      SQStringField('Recipe title')..editable = false,
      SQStringField('Recipe instructions')..editable = false,
      SQImageLinkField('Recipe Image')..editable = false,
    ],
    actions: [
      SetFieldsAction('Fetch recipe', getFields: (doc) async {
        final (title, instructions, image) = await fetchRecipe();
        return {
          'Recipe Image': image,
          'Recipe title': title,
          'Recipe instructions': instructions,
        };
      })
    ],
  )..onDocSaveCallback = (doc) async {
      final (title, instructions, image) = await fetchRecipe();
      doc.setValue('Recipe Image', image);
      doc.setValue('Recipe title', title);
      doc.setValue('Recipe instructions', instructions);
    };

  SQApp.run([
    RokGalleryScreen(collection: recipe)..icon = Icons.soup_kitchen,
    RokGalleryScreen(collection: randomRecipe)..icon = Icons.casino,
    FavouritesScreen(favouritesFeature: FavouritesFeature(collection: recipe)),
  ],
      themeData: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(244, 216, 143, 100),
              background: const Color.fromARGB(244, 216, 143, 100))));
}

class RokGalleryScreen extends GalleryScreen {
  RokGalleryScreen({required super.collection});

  @override
  Widget docDisplay(SQDoc doc) => Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () async => goToDocScreen(docScreen(doc)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10)),
                child: SizedBox(
                  height: 120,
                  width: double.infinity,
                  child: doc.imageLabel != null
                      ? Image.network(
                          doc.imageLabel!,
                          fit: BoxFit.cover,
                        )
                      : const Center(child: Text('No Image')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.topLeft,
                  child: Text(
                    doc.label,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
