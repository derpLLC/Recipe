import 'package:flutter/material.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  var arguments;
  var size;
  @override
  Widget build(BuildContext context) {
    arguments =
        ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;
    size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
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
                    Text(arguments['recipe']['strMeal']),
                    Container(
                      child: InkWell(
                        child: Icon(Icons.more_horiz),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Container(height: size.height * 0.3, color: Colors.green),
                SizedBox(height: 40),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Ingredients'),
                      Text('Servings'),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                ListView.builder(
                  itemBuilder: _ingredientsList,
                  itemCount: arguments['ingredients'].length,
                  shrinkWrap: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _ingredientsList(BuildContext context, int) {
    return Container(
      height: size.height * 0.12,
      color: Colors.yellow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(arguments['ingredients'][int]),
          Text(arguments['measurements'][int])
        ],
      ),
    );
  }
}
