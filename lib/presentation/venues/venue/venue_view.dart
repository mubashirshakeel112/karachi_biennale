import 'package:flutter/material.dart';
import 'package:karachi_biennale/constants/strings.dart';
import 'package:karachi_biennale/presentation/venues/controller/venue_controller.dart';
import 'package:karachi_biennale/presentation/venues/venue/widgets/custom_venue_card.dart';
import 'package:karachi_biennale/presentation/venues/venue_detail/venue_detail_view.dart';
import 'package:karachi_biennale/widgets/custom_app_bar.dart';
import 'package:karachi_biennale/widgets/custom_dropdown.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class VenueView extends StatefulWidget {
  static const String id = '/venue_view';

  const VenueView({super.key});

  @override
  State<VenueView> createState() => _VenueViewState();
}

class _VenueViewState extends State<VenueView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      final venueController = Provider.of<VenueController>(context, listen: false);
      venueController.getVenue();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<VenueController>(
        builder: (context, venueController, child) {
          return Column(
            children: [
              SecondaryAppBar(title: 'Venues',),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 24),
                child: CustomDropdown(
                  items: ["Cluster A", "Cluster B", "Cluster C", "Cluster D"],
                  onChange: () {},
                  hintText: 'Cluster A',
                ),
              ),
              Expanded(
                child: venueController.isLoading ? Center(child: Lottie.asset(Strings.lottieLoadAnim, width: 80, height: 80),) : ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  itemCount: venueController.venueData.length,
                  itemBuilder: (context, index) {
                    final venue = venueController.venueData[index];
                    return VenueCard(
                      title: venue.title,
                      subtitle: venue.subtitle,
                      leadingImage: venue.image,
                      onTap: (){
                        Navigator.pushNamed(context, VenueDetailView.id, arguments: venue.id);
                      },
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
