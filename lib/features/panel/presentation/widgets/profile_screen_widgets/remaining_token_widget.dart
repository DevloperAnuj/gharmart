import 'package:flutter/material.dart';

class RemainingTokensWidget extends StatelessWidget {
  const RemainingTokensWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your Remaining Tokens",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const CircleAvatar(
            backgroundColor: Colors.black,
            radius: 90,
            child: Text(
              "💰",
              style: TextStyle(
                fontSize: 75,
                color: Colors.yellowAccent,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "25",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}