import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_flutter/model/recent_trans.dart';

void main() {
  runApp(MyApp());
}

var PRIMARY_COLOR = Colors.indigo[900];

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Color initColor = Colors.white;
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2.5,
                color: Colors.indigo[600],
              ),
              Column(
                children: <Widget>[
                  TopSection(),
                  SendReceiveWidget(),
                ],
              ),
            ],
          ),
          MidWidget(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'RECENT TRANSACTIONS',
            
              style: TextStyle(
                color: PRIMARY_COLOR,
              ),
            ),
          ),
          Expanded(child: TransationWidget()),
        ],
      ),
      bottomNavigationBar: BubbleBottomBar(
        hasNotch: true,

        opacity: .2,
        currentIndex: 0,

        borderRadius: BorderRadius.vertical(
            top: Radius.circular(
                16)), //border radius doesn't work when the notch is enabled.
        elevation: 18,
        inkColor: Colors.blue[900],
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.blue[900],
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                style: TextStyle(
                  color: Colors.white,
                ),
              )),
          BubbleBottomBarItem(
              backgroundColor: Colors.deepPurple,
              icon: Icon(
                Icons.access_time,
                color:PRIMARY_COLOR,
              ),
              activeIcon: Icon(
                Icons.access_time,
                color: Colors.deepPurple,
              ),
              title: Text("Logs")),
          BubbleBottomBarItem(
              backgroundColor: Colors.indigo,
              icon: Icon(
                Icons.mail_outline,
                color: PRIMARY_COLOR
              ),
              activeIcon: Icon(
                Icons.mail_outline,
                color: Colors.indigo,
              ),
              title: Text("Mail")),
          BubbleBottomBarItem(
              backgroundColor: Colors.green,
              icon: Icon(
                Icons.sort,
                color: PRIMARY_COLOR,
              ),
              activeIcon: Icon(
                Icons.sort,
                color: Colors.green,
              ),
              title: Text("Menu"))
        ],
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  const TopSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Hey James,',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'What would you like to do today?',
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        CircleAvatar(
          backgroundImage: AssetImage('assets/image_one.jpg'),
        )
      ],
    );
  }
}

class MidWidget extends StatelessWidget {
  const MidWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      color: Colors.grey[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Flexible(child: _buildMidCard('Pay Bills', 'assets/bills.png')),
          Flexible(child: _buildMidCard('Donate', 'assets/donate.png')),
          Flexible(child: _buildMidCard('Recipients', 'assets/recipients.png')),
          Flexible(child: _buildMidCard('Offers', 'assets/offers.png')),
        ],
      ),
    );
  }

  Widget _buildMidCard(
    String name,
    String icon,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Image.asset(
              icon,
              height: 50,
              width: 50,
            ),
          ),
        ),
        Text(
          name,
          style: TextStyle(
            color: PRIMARY_COLOR,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

var list = [
  RecentTransModel(
    name: 'Alexander Young',
    details: 'Groceries. 19 Feb, 19',
    color: Colors.blue,
    profilePic: 'assets/three.jpg',
    price: '\$ 500.00',
    sentrp: 'Sent',
    icon: Icons.arrow_upward,
  ),
  RecentTransModel(
    name: 'Lisa Moreno',
    details: 'School Fee. 02 Feb, 19',
    color: Colors.green,
    profilePic: 'assets/four.jpg',
    price: '\$ 2500.00',
    sentrp: 'Received',
    icon: Icons.arrow_downward,
  ),
  RecentTransModel(
    name: 'Bryan Valdez',
    details: 'Health Services. 28 Jan, 19',
    color: Colors.orange[100],
    profilePic: 'assets/five.jpg',
    price: '\$ 600.00',
    sentrp: 'Pending',
    icon: Icons.arrow_downward,
  ),
  RecentTransModel(
    name: 'Alexander Young',
    details: 'Groceries. 19 Feb, 19',
    color: Colors.blue,
    profilePic: 'assets/three.jpg',
    price: '\$ 500.00',
    sentrp: 'Sent',
    icon: Icons.arrow_upward,
  ),
  RecentTransModel(
    name: 'Lisa Moreno',
    details: 'School Fee. 02 Feb, 19',
    color: Colors.green,
    profilePic: 'assets/four.jpg',
    price: '\$ 2500.00',
    sentrp: 'Received',
    icon: Icons.arrow_downward,
  ),
  RecentTransModel(
    name: 'Bryan Valdez',
    details: 'Health Services. 28 Jan, 19',
    color: Colors.orange[100],
    profilePic: 'assets/five.jpg',
    price: '\$ 600.00',
    sentrp: 'Pending',
    icon: Icons.arrow_downward,
  ),
];

class TransationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        final _transationCard = list[index];
        return Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      _transationCard.profilePic,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: _transationCard.color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      _transationCard.icon,
                      size: 15,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              title: Text(_transationCard.name,
                  style: TextStyle(
                    color: PRIMARY_COLOR,
                    fontWeight: FontWeight.bold,
                  )),
              subtitle: Text(_transationCard.details,
                  style: TextStyle(
                    color: PRIMARY_COLOR,
                    fontSize: 12,
                  )),
              trailing: Column(
                children: <Widget>[
                  Text(_transationCard.price,
                      style: TextStyle(
                        color: PRIMARY_COLOR,
                            fontWeight: FontWeight.bold,
                      )),
                  Text(
                    _transationCard.sentrp,
                    style: TextStyle(
                      color: _transationCard.color,
                      fontSize: 12,
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

class SendReceiveWidget extends StatelessWidget {
  const SendReceiveWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.indigo[400],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildTextTile('Receive', Icons.call_received),
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.short_text),
            ),
            _buildTextTile('Send', Icons.call_made),
          ],
        ),
      ),
    );
  }

  Widget _buildTextTile(String name, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 14,
        ),
        Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
