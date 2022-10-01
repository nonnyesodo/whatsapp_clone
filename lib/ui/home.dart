import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabIndex);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Whatsapp'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(
              text: 'CHATS',
            ),
            Tab(
              text: 'STATUS',
            ),
            Tab(
              text: 'CALLS',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          const Center(
            child: Icon(Icons.camera_alt),
          ),
          const Center(
            child: Text(' Start a conversation '),
          ),
          Container(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: const [
                    FloatingActionButton(
                      onPressed: null,
                      child: Icon(
                        Icons.person_add_alt,
                        size: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    Text('My status',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 10.0)),
                  ],
                ),
                const Center(
                  child: Text('No status'),
                ),
              ],
            ),
          ),
          const Center(
            child: Text('No Call '),
          ),
        ],
      ),
      floatingActionButton: _bottomButtons(),
    );
  }

  Widget? _bottomButtons() {
    if (_tabController.index == 0) {
      return null;
    }
    if (_tabController.index == 1) {
      return const FloatingActionButton(
          shape: StadiumBorder(),
          onPressed: null,
          backgroundColor: Colors.green,
          child: Icon(
            Icons.message,
            size: 40.0,
          ));
    }
    if (_tabController.index == 2) {
      return SizedBox(
        height: 140.0,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                    height: 60.0,
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Colors.white,
                      child: const Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    height: 20.0,
                  ), // a space
                  SizedBox(
                    height: 60.0,
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Colors.green,
                      child: const Icon(
                        Icons.camera_alt,
                        size: 40.0,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }
    if (_tabController.index == 3) {
      return const FloatingActionButton(
        shape: StadiumBorder(),
        onPressed: null,
        backgroundColor: Colors.green,
        child: Icon(
          Icons.add_ic_call,
          size: 40.0,
        ),
      );
    }
    return null;
  }
}
