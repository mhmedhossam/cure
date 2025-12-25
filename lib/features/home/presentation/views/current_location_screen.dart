import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:round_8_mobile_cure_team3/core/constants/app_images.dart';
import 'package:round_8_mobile_cure_team3/core/constants/navigation.dart';
import 'package:round_8_mobile_cure_team3/core/constants/routes.dart';
import 'package:round_8_mobile_cure_team3/core/di/servies_locator.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/core/utils/text_styles.dart';
import 'package:round_8_mobile_cure_team3/core/widgets/custom_back_button.dart';
import 'package:round_8_mobile_cure_team3/core/widgets/custom_button.dart';
import 'package:round_8_mobile_cure_team3/core/widgets/custom_text_form_field.dart';
import 'package:round_8_mobile_cure_team3/features/home/data/data_sources/local_data_source/local_data_source.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/widgets/custom_rich_text.dart';

class CurrentLocation extends StatefulWidget {
  const CurrentLocation({super.key});

  @override
  State<CurrentLocation> createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  final MapController _mapController = MapController();
  bool isSearch = false;

  LatLng? _selectedLocation;
  String _address = "choice your location";

  @override
  void initState() {
    super.initState();
    _handleLocationPermission();
  }

  Future<void> _handleLocationPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return;
    }

    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    _selectedLocation = LatLng(position.latitude, position.longitude);
    _mapController.move(_selectedLocation!, 15);

    _getAddressFromLatLng(_selectedLocation!);

    setState(() {});
  }

  Future<void> _getAddressFromLatLng(LatLng location) async {
    final placeMarks = await placemarkFromCoordinates(
      location.latitude,
      location.longitude,
    );

    if (placeMarks.isNotEmpty) {
      final place = placeMarks.first;
      setState(() {
        _address = '${place.street}, ${place.locality}, ${place.country}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                onTap: (tapPosition, point) {
                  setState(() {
                    _selectedLocation = point;
                  });
                  _getAddressFromLatLng(point);
                  _mapController.move(point, 14);
                },
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://api.maptiler.com/maps/streets/{z}/{x}/{y}.png?key=ZZ2ThhqafpVEiwq44B9B',
                  userAgentPackageName: 'com.example.round_8_mobile_cure_team3',
                ),
                if (_selectedLocation != null)
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: _selectedLocation!,
                        width: 50,
                        height: 50,
                        child: const Icon(
                          Icons.location_on,
                          size: 45,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
              ],
            ),

            Positioned(
              top: 10,
              left: 10,
              right: 10,
              child: isSearch
                  ? CustomTextForm(
                      onSubmit: (value) async {
                        try {
                          final locations = await locationFromAddress(value);

                          if (locations.isNotEmpty) {
                            final latLng = LatLng(
                              locations.first.latitude,
                              locations.first.longitude,
                            );

                            setState(() {
                              _selectedLocation = latLng;
                            });

                            _mapController.move(latLng, 13);

                            _address = value;
                            setState(() {});
                          }
                        } catch (e) {
                          print('Place not found');
                        }
                      },
                      hint: "Search for your location",
                      prefix: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: SvgPicture.asset(AppImages.searchSvg),
                      ),
                      controller: TextEditingController(),
                    )
                  : Container(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          const CustomBackButton(),
                          const Gap(10),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "Current location",
                                  style: TextStyles.title.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                                const Gap(5),
                                CustomRichText(
                                  assetName: AppImages.shipSvg,
                                  location: _address,
                                ),
                              ],
                            ),
                          ),
                          const Gap(10),

                          GestureDetector(
                            onTap: () {
                              isSearch = true;
                              setState(() {});
                            },
                            child: SvgPicture.asset(AppImages.searchSvg),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.whiteColor,
                      ),
                    ),
            ),

            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () async {
                      showLoading(context);
                      setState(() {});

                      final position = await Geolocator.getCurrentPosition(
                        desiredAccuracy: LocationAccuracy.high,
                      );

                      final latLng = LatLng(
                        position.latitude,
                        position.longitude,
                      );

                      setState(() {
                        _selectedLocation = latLng;
                      });

                      _mapController.move(latLng, 15);
                      _getAddressFromLatLng(latLng);
                      hideLoading(context);
                      setState(() {});
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.whiteColor,
                      ),
                      child: const Icon(
                        Icons.gps_fixed_sharp,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  const Gap(20),
                  CustomButton(
                    onPressed: () {
                      if (_selectedLocation != null) {
                        Navigation.pushReplacement(
                          context,
                          Routes.doctorNearYouScreen,
                          {'latlong': _selectedLocation, 'address': _address},
                        );
                      }

                      ServiceLocator.gi<LocalDataSource>().setLocation(
                        _address,
                      );
                    },
                    title: 'Confirm Location',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black45,
    builder: (context) {
      return const Center(
        child: CircleAvatar(
          backgroundImage: AssetImage(AppImages.docImg),
          maxRadius: 50,
        ),
      );
    },
  );
}

void hideLoading(BuildContext context) {
  Navigator.of(context).pop();
}
