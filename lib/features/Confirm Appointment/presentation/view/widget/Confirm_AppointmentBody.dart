import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/core/utils/text_styles.dart';
import 'package:round_8_mobile_cure_team3/features/Confirm%20Appointment/presentation/manager/selectDateCubit/select_date_cubit.dart';
import 'package:round_8_mobile_cure_team3/features/DoctorDetails/presentation/view/widget/custom_doctor_profile.dart';
import 'package:round_8_mobile_cure_team3/features/Pay/presentation/manager/cubit/save_date_cubit.dart';

class ConfirmAppointmentBody extends StatefulWidget {
  const ConfirmAppointmentBody({super.key});
  @override
  State<ConfirmAppointmentBody> createState() => _ConfirmAppointmentBodyState();
}

class _ConfirmAppointmentBodyState extends State<ConfirmAppointmentBody> {
  DateTime selectedDate = DateTime.now();
  String selectedTime = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Doctor Profile Card
            const CustomDoctorProfile(),
            const SizedBox(height: 25),
            Text(
              'Select a day',
              style: TextStyles.title.copyWith(
                fontWeight: FontWeight.w400,
              ), //TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Custom_Calendar_Month(),
            Text(
              'Select Time',
              style: TextStyles.title.copyWith(
                fontWeight: FontWeight.w400,
              ), //TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SelectTimePage(),
            // const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class SelectTimePage extends StatefulWidget {
  const SelectTimePage({super.key});

  @override
  State<SelectTimePage> createState() => _SelectTimePageState();
}

class _SelectTimePageState extends State<SelectTimePage> {
  String selectedTime = "11:00 AM";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectDateCubit, SelectDateState>(
      builder: (context, state) {
        if (state is SelectDateSucess) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.dateModels.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 2.5,
            ),
            itemBuilder: (context, index) {
              final time = state.dateModels[index].startTime;
              final isSelected = selectedTime == time;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    // BlocProvider.of<SaveDateCubit>(
                    //   context,
                    // ).Savemothed(date: selectedTime);
                    selectedTime = time;
                    SaveDateCubit.dates = time;
                  });
                },
                child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.blue : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    time,
                    style: TextStyles.details.copyWith(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class Custom_Calendar_Month extends StatefulWidget {
  const Custom_Calendar_Month({super.key});

  @override
  State<Custom_Calendar_Month> createState() => _Custom_Calendar_MonthState();
}

class _Custom_Calendar_MonthState extends State<Custom_Calendar_Month> {
  bool isCalendarExpanded = true;
  String ddd = '';
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  int mon = DateTime.now().month;
  String get dataas => months[mon - 1];
  DateTime selectedDate = DateTime.now();
  late String selectedMonth = dataas; // 'July';
  int selectedYear = DateTime.now().year;
  int _getDaysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }

  int _getFirstWeekdayOfMonth(int year, int month) {
    return DateTime(year, month, 1).weekday;
  }

  void _changeMonth(int direction) {
    setState(() {
      int currentMonthIndex = months.indexOf(selectedMonth);
      int newMonthIndex = currentMonthIndex + direction;

      if (newMonthIndex > 11) {
        newMonthIndex = 0;
        selectedYear++;
      } else if (newMonthIndex < 0) {
        newMonthIndex = 11;
        selectedYear--;
      }

      selectedMonth = months[newMonthIndex];
    });
  }

  String _getFormattedDate(BuildContext context) {
    final weekdays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    int weekdayIndex = selectedDate.weekday - 1;
    String monthName = months[selectedDate.month - 1];
    // BlocProvider.of<SaveDateCubit>(
    //   context,
    // ).Savemothed(day: "$monthName ${selectedDate.day}");
    SaveDateCubit.days = "$monthName ${selectedDate.day}";
    ddd =
        '${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}';
    ;
    BlocProvider.of<SelectDateCubit>(context).getDateByDay(ddd);

    print(ddd);
    return '${weekdays[weekdayIndex]}, $monthName ${selectedDate.day}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              print(isCalendarExpanded);
              isCalendarExpanded = !isCalendarExpanded;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.primaryColor),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/calender.svg",
                  colorFilter: const ColorFilter.mode(
                    AppColors.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  _getFormattedDate(context),
                  style: TextStyles.details.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
                const Spacer(),
                Icon(
                  isCalendarExpanded
                      ? Icons.keyboard_arrow_up_sharp
                      : Icons.keyboard_arrow_down_sharp,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Calendar Container
        AnimatedSize(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          child: isCalendarExpanded
              ? Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.1),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Month Navigation Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.chevron_left, size: 28),
                            onPressed: () => _changeMonth(-1),
                            color: Colors.blue,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                          Text(
                            '$selectedMonth $selectedYear',
                            style: TextStyles.details.copyWith(
                              color: AppColors.secondaryColor,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.chevron_right, size: 28),
                            onPressed: () => _changeMonth(1),
                            color: Colors.blue,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Days of Week Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:
                            ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                                .map(
                                  (day) => SizedBox(
                                    width: 40,
                                    child: Center(
                                      child: Text(
                                        day,
                                        style: TextStyles.details.copyWith(
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                      ),
                      const SizedBox(height: 16),

                      // Calendar Grid
                      _buildCalendarGrid(),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }

  Widget _buildCalendarGrid() {
    int monthIndex = months.indexOf(selectedMonth) + 1;
    int daysInMonth = _getDaysInMonth(selectedYear, monthIndex);
    int firstWeekday = _getFirstWeekdayOfMonth(selectedYear, monthIndex);
    int totalCells = 42;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemCount: totalCells,
      itemBuilder: (context, index) {
        int day = index - firstWeekday + 2;

        if (day < 1 || day > daysInMonth) {
          return const SizedBox();
        }

        return _buildDateCell(day);
      },
    );
  }

  Widget _buildDateCell(int day) {
    bool isSelected =
        day == selectedDate.day &&
        selectedMonth == months[selectedDate.month - 1] &&
        selectedYear == selectedDate.year;

    DateTime today = DateTime.now();
    bool isToday =
        day == today.day &&
        months.indexOf(selectedMonth) + 1 == today.month &&
        selectedYear == today.year;

    // Check if date is in the past
    DateTime cellDate = DateTime(
      selectedYear,
      months.indexOf(selectedMonth) + 1,
      day,
    );
    bool isPast = cellDate.isBefore(
      DateTime(today.year, today.month, today.day),
    );

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDate = DateTime(
            selectedYear,
            months.indexOf(selectedMonth) + 1,
            day,
          );
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.transparent,
          shape: BoxShape.circle,
          border: isToday && !isSelected
              ? Border.all(color: Colors.blue, width: 2)
              : null,
        ),
        child: Center(
          child: Text(
            '$day',
            style: TextStyles.details.copyWith(
              color: isSelected
                  ? Colors.white
                  : isPast
                  ? Colors.grey.shade400
                  : Colors.black87,
              fontWeight: isSelected || isToday
                  ? FontWeight.bold
                  : FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
// class Custom_Calendar_Month extends StatefulWidget {
//   const Custom_Calendar_Month({super.key});

//   @override
//   State<Custom_Calendar_Month> createState() => _Custom_Calendar_MonthState();
// }

// class _Custom_Calendar_MonthState extends State<Custom_Calendar_Month> {
//   bool isCalendarExpanded = true;
//   DateTime selectedDate = DateTime(2024, 7, 21);
//   String selectedMonth = 'July';
//   int selectedYear = 2024;

//   final List<String> months = [
//     'January',
//     'February',
//     'March',
//     'April',
//     'May',
//     'June',
//     'July',
//     'August',
//     'September',
//     'October',
//     'November',
//     'December',
//   ];

//   int _getDaysInMonth(int year, int month) {
//     return DateTime(year, month + 1, 0).day;
//   }

//   int _getFirstWeekdayOfMonth(int year, int month) {
//     return DateTime(year, month, 1).weekday;
//   }

//   void _changeMonth(int direction) {
//     setState(() {
//       int currentMonthIndex = months.indexOf(selectedMonth);
//       int newMonthIndex = currentMonthIndex + direction;

//       if (newMonthIndex > 11) {
//         newMonthIndex = 0;
//         selectedYear++;
//       } else if (newMonthIndex < 0) {
//         newMonthIndex = 11;
//         selectedYear--;
//       }

//       selectedMonth = months[newMonthIndex];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return // Month Selector Bar
//     Column(
//       children: [
//         GestureDetector(
//           onTap: () {
//             setState(() {
//               isCalendarExpanded = !isCalendarExpanded;
//             });
//           },
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(color: AppColors.primaryColor),
//             ),
//             child: Row(
//               //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SvgPicture.asset(
//                   "assets/icons/calender.svg",
//                   color: AppColors.primaryColor,
//                 ),
//                 SizedBox(width: 4),
//                 // Icon(
//                 //   Icons.calendar_month_outlined,
//                 //   color: Colors.grey.shade400,
//                 // ),
//                 Text(
//                   'Monday, July 21',
//                   style: TextStyles.details.copyWith(
//                     color: AppColors.secondaryColor,
//                   ),
//                 ),
//                 Spacer(),
//                 Icon(
//                   isCalendarExpanded
//                       ? Icons.keyboard_arrow_up_sharp
//                       : Icons.keyboard_arrow_down_sharp,
//                   color: AppColors.primaryColor,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         const SizedBox(height: 16),

//         // Calendar Container
//         AnimatedSize(
//           duration: const Duration(milliseconds: 400),
//           curve: Curves.easeInOut,
//           child: isCalendarExpanded
//               ? Container(
//                   padding: const EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(16),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.1),
//                         blurRadius: 15,
//                         offset: const Offset(0, 5),
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     children: [
//                       // Month Navigation Header
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           IconButton(
//                             icon: const Icon(Icons.chevron_left, size: 28),
//                             onPressed: () => _changeMonth(-1),
//                             color: Colors.blue,
//                             padding: EdgeInsets.zero,
//                             constraints: const BoxConstraints(),
//                           ),
//                           Text(
//                             '$selectedMonth $selectedYear',
//                             style: const TextStyle(
//                               fontSize: 17,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black87,
//                             ),
//                           ),
//                           IconButton(
//                             icon: const Icon(Icons.chevron_right, size: 28),
//                             onPressed: () => _changeMonth(1),
//                             color: Colors.blue,
//                             padding: EdgeInsets.zero,
//                             constraints: const BoxConstraints(),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20),

//                       // Days of Week Header
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children:
//                             ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
//                                 .map(
//                                   (day) => SizedBox(
//                                     width: 40,
//                                     child: Center(
//                                       child: Text(
//                                         day,
//                                         style: TextStyle(
//                                           color: Colors.grey.shade600,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                                 .toList(),
//                       ),
//                       const SizedBox(height: 16),

//                       // Calendar Grid
//                       _buildCalendarGrid(),
//                     ],
//                   ),
//                 )
//               : const SizedBox.shrink(),
//         ),
//       ],
//     );
//   }

//   Widget _buildCalendarGrid() {
//     int monthIndex = months.indexOf(selectedMonth) + 1;
//     int daysInMonth = _getDaysInMonth(selectedYear, monthIndex);
//     int firstWeekday = _getFirstWeekdayOfMonth(selectedYear, monthIndex);
//     int totalCells = 42;

//     return GridView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 7,
//         mainAxisSpacing: 10,
//         crossAxisSpacing: 10,
//         childAspectRatio: 1,
//       ),
//       itemCount: totalCells,
//       itemBuilder: (context, index) {
//         int day = index - firstWeekday + 2;

//         if (day < 1 || day > daysInMonth) {
//           return const SizedBox();
//         }

//         return _buildDateCell(day);
//       },
//     );
//   }

//   Widget _buildDateCell(int day) {
//     bool isSelected =
//         day == selectedDate.day &&
//         selectedMonth == months[selectedDate.month - 1] &&
//         selectedYear == selectedDate.year;

//     DateTime today = DateTime.now();
//     bool isToday =
//         day == today.day &&
//         months.indexOf(selectedMonth) + 1 == today.month &&
//         selectedYear == today.year;

//     // Past dates
//     DateTime cellDate = DateTime(
//       selectedYear,
//       months.indexOf(selectedMonth) + 1,
//       day,
//     );
//     bool isPast = cellDate.isBefore(
//       DateTime.now().subtract(const Duration(days: 1)),
//     );

//     return GestureDetector(
//       onTap: isPast
//           ? null
//           : () {
//               setState(() {
//                 selectedDate = DateTime(
//                   selectedYear,
//                   months.indexOf(selectedMonth) + 1,
//                   day,
//                 );
//               });
//             },
//       child: Container(
//         decoration: BoxDecoration(
//           color: isSelected
//               ? Colors.blue
//               : isPast
//               ? Colors.transparent
//               : Colors.transparent,
//           shape: BoxShape.circle,
//           border: isToday && !isSelected
//               ? Border.all(color: Colors.blue, width: 2)
//               : null,
//         ),
//         child: Center(
//           child: Text(
//             '$day',
//             style: TextStyle(
//               color: isSelected
//                   ? Colors.white
//                   : isPast
//                   ? Colors.grey.shade300
//                   : Colors.black87,
//               fontWeight: isSelected || isToday
//                   ? FontWeight.bold
//                   : FontWeight.w500,
//               fontSize: 15,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
