import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final bool ismale;
  const UserAvatar({
    super.key,
    required this.ismale,
    required this.radius,
  });

  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: ismale
          ? AssetImage('assets/images/male-user-1.png')
          : AssetImage('assets/images/female-user-1.png'),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
