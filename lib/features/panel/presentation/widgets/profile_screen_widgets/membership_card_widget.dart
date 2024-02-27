import 'package:flutter/material.dart';

class MembershipCard extends StatelessWidget {
  final Color cardColour;
  final String membershipName;
  final String membershipPrice;
  final String membershipInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(color: cardColour, width: 2),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: 300,
          child: Column(
            children: [
              Container(
                height: 50,
                width: double.infinity,
                color: cardColour,
                child: Center(
                  child: Text(
                    membershipName,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "₹ $membershipPrice",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              const SizedBox(height: 15),
              Text(membershipInfo),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: cardColour,
                  foregroundColor: Colors.black,
                ),
                child: Text("Purchase $membershipName"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  const MembershipCard({
    super.key,
    required this.cardColour,
    required this.membershipName,
    required this.membershipPrice,
    required this.membershipInfo,
  });
}