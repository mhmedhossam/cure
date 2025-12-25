import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:round_8_mobile_cure_team3/features/Booking/presentation/manager/get_bookingCubit/get_booking_cubit.dart';
import 'package:round_8_mobile_cure_team3/features/Booking/presentation/widgets/appointment.dart';

// ignore: must_be_immutable
class Booking extends StatelessWidget {
  Booking({super.key});

  final DateTime now = DateTime.now();
  final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final dayName = days[now.weekday - 1];
    final dayNumber = now.day.toString();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "My Booking",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Column(
        children: [
          // DayScrollView(
          //   dayName: dayName,
          //   dayNumber: dayNumber,
          //   height: size.height * 0.12, // responsive height
          // ),
          Expanded(
            child: BlocBuilder<GetBookingCubit, GetBookingState>(
              builder: (context, state) {
                if (state is GetBookingSucess) {
                  return ListView.builder(
                    itemBuilder: (context, index) => AppointmentCardUI(
                      bookingModels: state.bookingdata[index],
                    ),
                    itemCount: state.bookingdata.length,
                  );
                } else if (state is GetBookingFailure) {
                  return Center(child: Text(state.emessage));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DayScrollView extends StatefulWidget {
  const DayScrollView({
    super.key,
    required this.dayName,
    required this.dayNumber,
    required this.height,
  });

  final String dayName;
  final String dayNumber;
  final double height;

  @override
  State<DayScrollView> createState() => _DayScrollViewState();
}

class _DayScrollViewState extends State<DayScrollView> {
  int clickedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: widget.height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() => clickedIndex = index);
            },
            child: Container(
              width: width * 0.18, // responsive width
              margin: EdgeInsets.symmetric(
                horizontal: width * 0.02,
                vertical: widget.height * 0.15,
              ),
              decoration: BoxDecoration(
                color: clickedIndex == index ? Colors.blueAccent : Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.dayName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.035,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.dayNumber,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
