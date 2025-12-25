import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/pages/payment_method_second.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: topPart(),
    );
  }
}

class topPart extends StatefulWidget {
  topPart({super.key});
  final int selectedDay = 28;
  final String selectedMonth = 'October';
  final int selectedYear = 2010;
  final List<int> days = List.generate(31, (index) => index + 1);

  final List<String> months = const [
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

  final List<int> years = List.generate(50, (index) => 1970 + index);

  @override
  State<topPart> createState() => _topPartState();
}

class _topPartState extends State<topPart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/person.jpg'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Mohamed',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'georgia',
                fontWeight: FontWeight.bold,
              ),
            ),
            Transform.translate(
              offset: const Offset(10, -10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/ship.svg'),
                  const Text(
                    "129El-Nasr Street, Cairo, Egypt",
                    style: TextStyle(
                      fontSize: 10,
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/arrow_down.svg',
                      width: 13,
                    ),
                  ),
                ],
              ),
            ),
            // Spacer(flex: 1),
            const editProfileListTile(title: ' Mohamed', icon: Icons.person),
            // Spacer(flex: 1),
            const editProfileListTile(
              title: 'Seifmohamed@gmail.com',
              icon: Icons.mail,
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              tileColor: Colors.grey.withAlpha(25),
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/icons/flag.png', width: 20),
                  const SizedBox(width: 5),
                  Transform.translate(
                    offset: const Offset(-15, 0),
                    child: IconButton(
                      icon: SvgPicture.asset('assets/icons/arrow_down.svg'),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              title: Row(
                children: [
                  Transform.translate(
                    offset: const Offset(-40, 0),
                    child: const Text('+20 1123456789'),
                  ),
                ],
              ),
            ),
            // Spacer(flex: 1),
            const Row(
              children: [
                Text(
                  'Select your birthday',
                  style: TextStyle(fontFamily: 'montserrat', fontSize: 16),
                ),
              ],
              // ),Spacer(flex: 1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [],
            ),
            SpecialButton(icon: false, title: 'Edit Profile', onpressed: () {}),
          ],
        ),
      ),
    );
  }
}

class editProfileListTile extends StatelessWidget {
  const editProfileListTile({
    super.key,
    required this.title,
    required this.icon,
  });
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey.withAlpha(25),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      leading: Icon(icon),
      title: Text(title),
    );
  }
}
