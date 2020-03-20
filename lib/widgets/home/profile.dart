import 'package:flutter/material.dart';
import 'package:safqty/screens/tabs/profile_screen.dart';

class Profile extends StatelessWidget {
  final String name;
  final String imagePath;

  Profile(this.name, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Row(
        children: <Widget>[
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white12, width: 0.6),
            ),
            child: imagePath.isEmpty
                ? Icon(
                    Icons.person,
                    size: 60,
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/user_photo.png',
                      image: imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
          SizedBox(
            width: 16,
          ),
          Text(
            name,
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
