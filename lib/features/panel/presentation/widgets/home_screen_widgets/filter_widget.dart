import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';

class FilterWidgetDesktop extends StatelessWidget {
  const FilterWidgetDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            CSCPicker(
              flagState: CountryFlag.DISABLE,
              defaultCountry: CscCountry.India,
              disabledDropdownDecoration:
                  const BoxDecoration(color: Colors.white),
              onCountryChanged: (country) {
                print(country);
              },
              onCityChanged: (city) {
                print(city);
              },
              onStateChanged: (state) {
                print(state);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Filters",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black,
                      fontSize: 22,
                    ),
              ),
            ),
            Wrap(
              spacing: 20,
              alignment: WrapAlignment.center,
              children: [
                CustomChoiceChip(
                  label: "Rent",
                  selected: true,
                  onSelected: (val) {},
                ),
                CustomChoiceChip(
                  label: "Sell",
                  selected: false,
                  onSelected: (val) {},
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: Text(
                "BHK Type",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black,
                      fontSize: 16,
                    ),
              ),
            ),
            Wrap(
              spacing: 20,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                CustomChoiceChip(
                  label: "1 RK",
                  selected: true,
                  onSelected: (val) {},
                ),
                CustomChoiceChip(
                  label: "1 BHK",
                  selected: false,
                  onSelected: (val) {},
                ),
                CustomChoiceChip(
                  label: "2 BHK",
                  selected: false,
                  onSelected: (val) {},
                ),
                CustomChoiceChip(
                  label: "3 BHK",
                  selected: false,
                  onSelected: (val) {},
                ),
                CustomChoiceChip(
                  label: "4 BHK",
                  selected: false,
                  onSelected: (val) {},
                ),
                CustomChoiceChip(
                  label: "4+ BHK",
                  selected: false,
                  onSelected: (val) {},
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: Text(
                "Price Range",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black,
                      fontSize: 16,
                    ),
              ),
            ),
            SizedBox(
              child: RangeSlider(
                min: 1000,
                max: 10000000,
                values: const RangeValues(50000, 1500000),
                onChanged: (_) {},
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: Text(
                "Preferred Tenants",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black,
                      fontSize: 16,
                    ),
              ),
            ),
            Wrap(
              spacing: 20,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                CustomChoiceChip(
                  label: "Family",
                  selected: true,
                  onSelected: (val) {},
                ),
                CustomChoiceChip(
                  label: "Bachelor Male",
                  selected: false,
                  onSelected: (val) {},
                ),
                CustomChoiceChip(
                  label: "Bachelor Female",
                  selected: false,
                  onSelected: (val) {},
                ),
                CustomChoiceChip(
                  label: "All",
                  selected: false,
                  onSelected: (val) {},
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: Text(
                "Furnishing",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black,
                      fontSize: 16,
                    ),
              ),
            ),
            Wrap(
              spacing: 20,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                CustomChoiceChip(
                  label: "Full",
                  selected: true,
                  onSelected: (val) {},
                ),
                CustomChoiceChip(
                  label: "Semi",
                  selected: false,
                  onSelected: (val) {},
                ),
                CustomChoiceChip(
                  label: "None",
                  selected: false,
                  onSelected: (val) {},
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: Text(
                "Parking",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black,
                      fontSize: 16,
                    ),
              ),
            ),
            Wrap(
              spacing: 20,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                CustomChoiceChip(
                  label: "Bike",
                  selected: true,
                  onSelected: (val) {},
                ),
                CustomChoiceChip(
                  label: "Car",
                  selected: false,
                  onSelected: (val) {},
                ),
                CustomChoiceChip(
                  label: "Bike And Car",
                  selected: false,
                  onSelected: (val) {},
                ),
                CustomChoiceChip(
                  label: "None",
                  selected: false,
                  onSelected: (val) {},
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 30),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.filter_alt),
                label: const Text("Apply Filter"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomChoiceChip extends StatelessWidget {
  final String label;
  final bool selected;
  final ValueChanged<bool> onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      labelStyle: TextStyle(color: selected ? Colors.white : Colors.black),
      backgroundColor: Colors.white,
      selected: selected,
      onSelected: onSelected,
      selectedColor: Theme.of(context).primaryColor,
      checkmarkColor: Colors.white,
    );
  }

  const CustomChoiceChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onSelected,
  });
}
