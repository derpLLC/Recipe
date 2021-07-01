import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Opacity(
            opacity: 0.6,
            child: Image(
              image: NetworkImage(
                  'https://images.pexels.com/photos/5929/food-salad-dinner-eating.jpg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Cooking Experience',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Like a Chef',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Let\'s make a delicious dish with',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Text(
                'the best recipe for the family',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 40),
              Container(
                height: size.height * 0.1,
                width: size.width * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.greenAccent,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: size.height * 0.2,
                        width: size.width * 0.15,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: InkWell(
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.greenAccent,
                          ),
                        ),
                      ),
                      Text(
                        'Get Started',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
            ],
          )
        ],
      ),
    );
  }
}
