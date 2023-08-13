import 'package:flutter/material.dart';
import 'package:jenga_app/common_component/top_bar.dart';
import 'package:jenga_app/screens/create_project_form.dart';
import 'package:jenga_app/screens/formfields.dart';

import '../services/service.dart';

class DashboardsCreen extends StatefulWidget {
  const DashboardsCreen({super.key});

  @override
  State<DashboardsCreen> createState() => _DashboardsCreenState();
}

class _DashboardsCreenState extends State<DashboardsCreen> {
  List items = [];

  @override
  void initState() {
    super.initState();
    _fetchProjects();
  }
// https://github.com/trusttechnologytz/Jenga_App.git
  Future<void> _fetchProjects() async {
    final service = Services();
    final data = await service.getProject();
    print("data projec---------->");
    print(data['data']);
    setState(() {
      items = data['data'] ?? [];
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
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
                            builder: (context) => const ProjectCreationForm()),
                      );
                    },
                    color: const Color.fromARGB(255, 12, 184, 135),
                    child: const Text(
                      "Add Project",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12),
              child: _menuList(),
            ),
            const Divider(),
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
            const Divider(),
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
       return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/task');
          },
          child: GridTile(
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 158, 209, 156),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 12.0, top: 15),
                    child: Icon(
                      Icons.note_alt,
                      size: 30,
                      color: Colors.white70,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 10, top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${items[index]['name']}'),
                        const Icon(
                          Icons.arrow_right_alt_sharp,
                          color: Colors.orange,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      'Budget ${items[index]['budget']}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white70),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ListViewHome extends StatelessWidget {
  const ListViewHome({super.key});

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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: <Widget>[
            //     TextButton(
            //       child: const Text('View'),
            //       onPressed: () {
            //        Navigator.pushNamed(context, '/task');
            //       },
            //     ),
            //     const SizedBox(width: 8),
            //     TextButton(
            //       child: const Text('create'),
            //       onPressed: () {
            //         Navigator.pushNamed(context, '/create-task');
            //       },
            //     ),
            //     const SizedBox(width: 8),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
