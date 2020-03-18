import 'package:flutter/material.dart';
import 'package:safqty/screens/tabs/profile_screen.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Row(
        children: <Widget>[
          GestureDetector(
            child: Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage('assets/images/user_photo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            onTap: () => Navigator.of(context).pushNamed(ProfileScreen.routeName, arguments: true),
          ),
          SizedBox(
            width: 16,
          ),
          Text(
            'أسامة محمد العيتيبي',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
