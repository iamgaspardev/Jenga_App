import 'package:flutter/material.dart';
import 'package:jenga_app/common_component/top_bar.dart';
import 'package:jenga_app/screens/create_project_form.dart';
import 'package:jenga_app/screens/formfields.dart';

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
      appBar: CustomAppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            // _headerView(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 22.0, right: 18),
                  child: Text(
                    'Projects Lists ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 119, 119, 119),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 18),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProjectCreationForm()),
                      );
                    },
                    color: Color.fromARGB(255, 12, 184, 135),
                    child: const Text(
                      "Add Project",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            Divider(),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12),
              child: _menuList(),
            ),
            Divider(),
            const Padding(
              padding: EdgeInsets.only(left: 18.0, right: 18, top: 10),
              child: Text(
                'Completed Projects ',
                style: TextStyle(
                  fontSize: 17,
                  color: Color.fromARGB(255, 119, 119, 119),
                ),
              ),
            ),
            Divider(),
            const Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10),
              child: CardList(),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10),
              child: CardList(),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10),
              child: CardList(),
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
        mainAxisSpacing: 4,
        childAspectRatio: 1.6,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GridTile(
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 158, 209, 156),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${items[index]['subtitle']}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white70),
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

class ListViewHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: const <Widget>[
        Card(
            child: ListTile(
                title: Text("Battery Full"),
                subtitle: Text("The battery is full."),
                leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
                trailing: Icon(Icons.star))),
        Card(
            child: ListTile(
                title: Text("Anchor"),
                subtitle: Text("Lower the anchor."),
                leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg")),
                trailing: Icon(Icons.star))),
        Card(
            child: ListTile(
                title: Text("Alarm"),
                subtitle: Text("This is the time."),
                leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg")),
                trailing: Icon(Icons.star))),
        Card(
            child: ListTile(
                title: Text("Ballot"),
                subtitle: Text("Cast your vote."),
                leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg")),
                trailing: Icon(Icons.star)))
      ],
    );
  }
}

class CardList extends StatelessWidget {
  const CardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.white70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.abc),
              title: Text('Makala Constructions'),
              subtitle: Text('Active Projects Date: July,03 2023'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('View'),
                  onPressed: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditableTable()),
                      );
                  },
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('Delete'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
