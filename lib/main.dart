import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:try1/infotabs/battery_info.dart';
import 'package:try1/infotabs/network_info.dart';
import 'package:try1/infotabs/sensors_info.dart';
import 'infotabs/device_info.dart';
import 'infotabs/system_info.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final List<Widget> _pages = [DeviceTab(), SystemTab(),NetworkTab(),BatteryTab(),SensorsTab()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Know your device',
      theme: new ThemeData(brightness: Brightness.dark),
      home: BackdropScaffold(
        appBar: BackdropAppBar(
          title: Text("Know Your Device"),
          actions: <Widget>[
            BackdropToggleButton(
              icon: AnimatedIcons.list_view,
            )
          ],
        ),
        stickyFrontLayer: true,
        frontLayer: _pages[_currentIndex],
        backLayer: BackdropNavigationBackLayer(
          items: [
            ListTile(leading: Icon(Icons.memory, color: Colors.blueAccent,), title: Text("Device")),
            ListTile(leading: Icon(Icons.android, color: Colors.blueAccent,), title: Text("System")),
            ListTile(leading: Icon(Icons.signal_cellular_4_bar, color: Colors.blueAccent,), title: Text("Network")),
            ListTile(leading: Icon(Icons.battery_std, color: Colors.blueAccent,),title: Text("Battery")),
            ListTile(leading: Icon(Icons.screen_rotation, color: Colors.blueAccent,),title: Text("Sensors")),
          ],
          onTap: (int position) => {setState(() => _currentIndex = position)},
        ),
      ),
    );
  }
}