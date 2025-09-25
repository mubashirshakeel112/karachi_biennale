import 'package:flutter/material.dart';
import 'package:karachi_biennale/widgets/custom_dropdown.dart';

class VenuesFullImageView extends StatelessWidget {
  static const String id = '/venue_full_image_view';
  const VenuesFullImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomDropdown(
                items: [
                  "Cluster A",
                  "Cluster B",
                  "Cluster C",
                  "Cluster D"
                ],
                onChange: (){},
                hintText: 'Cluster A',
              ),
              SizedBox(height: 36),
              // CustomVenueCard(image: Strings.venueFullImage1),
              SizedBox(height: 24),
              // CustomVenueCard(image: Strings.venueFullImage2),
            ],
          ),
        ),
      ),
    );
  }

  DropdownMenuItem dropdownItem(String item) {
    return DropdownMenuItem(value: item, child: Text(item));
  }
}
