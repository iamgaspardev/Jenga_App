import 'package:flutter/material.dart';

class DashboardsCreen extends StatefulWidget {
  const DashboardsCreen({super.key});

  @override
  State<DashboardsCreen> createState() => _DashboardsCreenState();
}

class _DashboardsCreenState extends State<DashboardsCreen> {
  List<Map<String, dynamic>> items = [
    {
      'id': 0,
      'icon': 'books',
      'subtitle': 'Magomeni House',
    },
    {
      'id': 1,
      'icon': 'upload',
      'subtitle': 'Mangonjo Road',
    },
    {
      'id': 2,
      'icon': 'report',
      'title': 'Item 3',
      'subtitle': 'Kichacha Shell',
    },
  ];

  IconData _getIcon(String iconName) {
    switch (iconName) {
      case 'books':
        return Icons.menu_book;
      case 'upload':
        return Icons.cloud_upload;
      case 'report':
        return Icons.report;
      // add more cases for other icon names
      default:
        return Icons.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 44,
            ),
            _headerView(),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30.0, right: 18),
              child: Text(
                'Projects Lists ',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 119, 119, 119),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18),
              child: _menuList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuList() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 6,
        mainAxisSpacing: 6,
        childAspectRatio: 1.6,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GridTile(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: items[index]['id'] == 0 ? const Color.fromARGB(221, 85, 194, 134) : items[index]['id'] == 1 ? const Color.fromARGB(255, 228, 18, 18): items[index]['id'] == 2 ? const Color.fromARGB(255, 228, 154, 18): const Color.fromARGB(255, 167, 151, 151),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${items[index]['subtitle']}',
                    style: const TextStyle(fontWeight: FontWeight.normal, color: Colors.white70),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _headerView() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        children: [
          const Expanded(
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/profile.jpeg"),
              radius: 35,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Gaspar",
                        style: TextStyle(
                            color: Color.fromARGB(210, 46, 44, 44),
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Good Morning..!",
                        style: TextStyle(
                            color: Color.fromARGB(255, 173, 132, 132),
                            fontWeight: FontWeight.bold,
                            fontSize: 19),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
                alignment: Alignment.topRight,
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.sort),
                )),
          )
        ],
      ),
    );
  }
}
