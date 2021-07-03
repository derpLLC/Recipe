import 'package:flutter/material.dart';
import 'package:recipes/api/randomRecipe.dart';
import 'package:recipes/utils/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var randomRecipe;
  List<String?> ingredientList = [];
  List<String?> measurementList = [];
  bool _isRandomRecipeReady = false;

  void getRandomRecipe() async {
    var data = await RandomRecipe().getRandomRecipe();
    var ingredients = RegExp(r'strIngredient*');
    var measure = RegExp(r'strMeasure*');

    data.forEach((k, v) => {
          if (ingredients.hasMatch(k) && v != '') {ingredientList.add(v)}
        });

    data.forEach((k, v) => {
          if (measure.hasMatch(k) && v != '') {measurementList.add(v)}
        });

    setState(() {
      randomRecipe = data;
      _isRandomRecipeReady = true;
    });
  }

  @override
  void initState() {
    super.initState();
    getRandomRecipe();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Text(
              'Find Best Recipe',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'For Cooking',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: size.height * 0.060,
                    width: size.width * 0.75,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: 'Search Destination',
                        hintStyle: TextStyle(color: Colors.black26),
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.060,
                  width: size.width * 0.12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300,
                  ),
                  child: InkWell(
                    child: Icon(
                      Icons.filter_list,
                      color: Colors.greenAccent,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: size.height * 0.07,
                  width: size.width * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text('All'),
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.07,
                  width: size.width * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text('Sushi'),
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.07,
                  width: size.width * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text('Burger'),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 40),
            Container(
              height: size.height * 0.5,
              child: _isRandomRecipeReady
                  ? Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: InkWell(
                            child: Image(
                              image: NetworkImage(randomRecipe['strMealThumb']),
                              fit: BoxFit.cover,
                            ),
                            onTap: () => {
                              Navigator.pushNamed(
                                  context, MyRoutes.recipePageRoute,
                                  arguments: {
                                    'recipe': randomRecipe,
                                    'ingredients': ingredientList,
                                    'measurements': measurementList,
                                  })
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20, right: 20),
                              child: Container(
                                height: size.height * 0.060,
                                width: size.width * 0.12,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade300,
                                ),
                                child: InkWell(
                                  child: Icon(
                                    Icons.bookmark,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 40),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                randomRecipe['strMeal'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '${ingredientList.length} Ingredients',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(height: 40),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Center(child: CircularProgressIndicator()),
            )
          ],
        ),
      ),
    );
  }
}
