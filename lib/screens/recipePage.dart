import 'package:flutter/material.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>?;

    print(arguments!['measurements'].length);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: InkWell(
                      child: Icon(Icons.arrow_back),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Text(arguments!['recipe']['strMeal']),
                  Container(
                    child: InkWell(
                      child: Icon(Icons.more_horiz),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
