import 'package:flutter/material.dart';

import '../../../../../../../../main.dart';
import '_/state_child.dart';
import '_/state_mother.dart';

class NewView extends StatefulWidget {
  NewView({super.key});

  @override
  State<NewView> createState() => StateChild();
}

class NewViewState extends State<NewView> with StateMother {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                // hide the back button
                floating: true,
                pinned: true,
                expandedHeight: 160.0, // you can change the height as you need
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    mainAxisSize: MainAxisSize.min,
                    // image + text
                    children: [
                      Container(
                        height: 130,
                        width: double.infinity,
                        child: Image.asset(
                          'assets/view/nest_tab_bar/furkan-elveren-KoKgPzSWpRQ.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        "top image + text",
                      ),
                    ],
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(48.0), // TabBar height
                  child: Material(
                    child: TabBar(
                      tabs: [
                        Tab(icon: Icon(Icons.list)),
                        Tab(icon: Icon(Icons.grid_on)),
                        Tab(icon: Icon(Icons.directions_bike)),
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              // ListView tab
              ListView.builder(
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('list item: $index'),
                  );
                },
              ),
              // GridView tab
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Center(
                      child: Text('grid item: $index'),
                    ),
                  );
                },
              ),
              // other tab
              Center(child: Text('other tab')),
            ],
          ),
        ),
      ),
    );
  }
}

main() async {
  return buildApp(appHome: NewView());
}