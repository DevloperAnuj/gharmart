import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/profile/presentation/manager/fetch_profile/fetch_profile_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

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
          child: BlocBuilder<FetchProfileCubit, FetchProfileState>(
            builder: (context, state) {
              if (state is FetchProfileSuccess) {
                return Column(
                  children: [
                    Container(
                      height: 50,
                      width: double.infinity,
                      color: cardColour,
                      child: Center(
                        child: Text(
                          membershipName,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
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
                      onPressed: () async {
                        if (membershipName == 'Single') {
                          final Uri url = Uri.parse(
                              'https://pages.razorpay.com/pl_Oz1TKpkeuddCMd/view?email=${state.profileEntity.email}&&phone=${state.profileEntity.phone}');
                          if (!await launchUrl(url)) {
                            print('Could not launch $url');
                          }
                        }
                        if (membershipName == 'Silver') {
                          final Uri url = Uri.parse(
                              'https://pages.razorpay.com/pl_Oz45i4eQmSeMHu/view?email=${state.profileEntity.email}&&phone=${state.profileEntity.phone}');
                          if (!await launchUrl(url)) {
                            print('Could not launch $url');
                          }
                        }
                        if (membershipName == 'Gold') {
                          final Uri url = Uri.parse(
                              'https://pages.razorpay.com/pl_Oz48Fwz86hThHh/view?email=${state.profileEntity.email}&&phone=${state.profileEntity.phone}');
                          if (!await launchUrl(url)) {
                            print('Could not launch $url');
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: cardColour,
                        foregroundColor: Colors.black,
                      ),
                      child: Text("Purchase $membershipName"),
                    ),
                  ],
                );
              }
              return const Text('Data Fetching in Process...');
            },
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
