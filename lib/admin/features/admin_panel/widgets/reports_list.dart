import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/admin/features/admin_panel/manager/fetch_reports/admin_fetch_reports_cubit.dart';
import 'package:gharmart/admin/features/properties/report_property_entity.dart';
import 'package:intl/intl.dart';

import '../manager/fetch_admin_properties/fetch_admin_properties_cubit.dart';

class ReportsList extends StatelessWidget {
  const ReportsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: BlocBuilder<AdminFetchReportsCubit, AdminFetchReportsState>(
        builder: (context, state) {
          return ListView.separated(
            itemBuilder: (c, i) {
              final ReportPropertyEntity report = state.reportsList[i];
              return ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: const BorderSide(width: 1, color: Colors.black54),
                ),
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(report.property.picsUrl.first),
                    ),
                  ),
                ),
                title: Text(
                  report.property.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText(
                      "\nOwner: ${report.property.user.name}"
                      "\nReport By: ${report.reporter.name}"
                      "\nReason: ${report.reason}"
                      "\n📅: ${DateFormat.yMMMd().format(report.createdAt)}",
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          if (report.reason == "Listed By Broker")
                            TextButton(
                              onPressed: () {
                                context
                                    .read<AdminFetchReportsCubit>()
                                    .takeActionOnReports(
                                      report,
                                      2,
                                    );
                              },
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(color: Colors.black),
                                ),
                                backgroundColor: Colors.white,
                              ),
                              child: const Text("Listed By Broker"),
                            ),
                          if (report.reason == "Rented Out")
                            TextButton(
                              onPressed: () {
                                context
                                    .read<AdminFetchReportsCubit>()
                                    .takeActionOnReports(
                                      report,
                                      3,
                                    );
                              },
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(color: Colors.black),
                                ),
                                backgroundColor: Colors.white,
                              ),
                              child: const Text("Rented Out"),
                            ),
                          if (report.reason == "Wrong Info")
                            TextButton(
                              onPressed: () {
                                context
                                    .read<AdminFetchReportsCubit>()
                                    .takeActionOnReports(
                                      report,
                                      1,
                                    );
                              },
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(color: Colors.black),
                                ),
                                backgroundColor: Colors.white,
                              ),
                              child: const Text("Wrong Info"),
                            ),
                          TextButton(
                            onPressed: () {
                              context
                                  .read<AdminFetchReportsCubit>()
                                  .ignoreReport(report.property.id);
                            },
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(color: Colors.black),
                              ),
                              backgroundColor: Colors.white,
                            ),
                            child: const Text("Ignore Report"),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            itemCount: state.reportsList.length,
            separatorBuilder: (c, i) {
              return const SizedBox(height: 10);
            },
          );
        },
      ),
    );
  }
}
