import 'package:flutter/material.dart';

void main() => runApp(FuadFileManagerApp());

class FuadFileManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fuad File Manager',
      theme: ThemeData.dark(),
      home: FuadHomePage(),
    );
  }
}

class FuadHomePage extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Documents(45)',
      'subtitle': 'Includes Word, PPT, Excel, WPS, etc.',
      'icon': Icons.document_scanner
    },
    {
      'title': 'EBooks(88)',
      'subtitle': 'Includes .umd, .ebk, .txt, .chm, etc.',
      'icon': Icons.book_online
    },
    {
      'title': 'APKS(0)',
      'subtitle': 'Includes .apk files',
      'icon': Icons.file_open
    },
    {
      'title': 'Archives(4)',
      'subtitle': 'Includes .7z, .rar, .zip, .iso, etc.,',
      'icon': Icons.archive
    },
    {
      'title': 'BIG fIs(41)',
      'subtitle': 'Includes files > 50 MB',
      'icon': Icons.file_download
    },
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fuad File Manager"),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FuadSettingsPage()),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search local files',
                filled: true,
                fillColor: const Color.fromARGB(255, 239, 236, 236),
                prefixIcon: Icon(Icons.search),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.storage),
            title: Text('Phone Storage'),
            subtitle: LinearProgressIndicator(
              value: 250 / 450,
              backgroundColor: const Color.fromARGB(255, 241, 240, 240),
              color: Colors.green,
            ),
            trailing: Text("Available: 135GB"),
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final item = categories[index];
                return ListTile(
                  leading: Icon(item['icon']!),
                  title: Text(item['title']!),
                  subtitle: Text(item['subtitle']!),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.library_music), label: 'PLAYLIST'),
          BottomNavigationBarItem(icon: Icon(Icons.music_note), label: 'TOMP3'),
          BottomNavigationBarItem(
              icon: Icon(Icons.swap_horiz), label: 'SOCIAL'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'FUAD'),
        ],
      ),
    );
  }
}

class FuadSettingsPage extends StatefulWidget {
  @override
  _FuadSettingsPageState createState() => _FuadSettingsPageState();
}

class _FuadSettingsPageState extends State<FuadSettingsPage> {
  bool highSpeedMode = true;
  bool nightMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fuad Settings")),
      body: ListView(
        children: [
          ListTile(leading: Icon(Icons.language), title: Text("Language")),
          SwitchListTile(
            value: highSpeedMode,
            onChanged: (value) => setState(() => highSpeedMode = value),
            title: Text("High-speed Mode supported"),
          ),
          ListTile(
              leading: Icon(Icons.settings), title: Text("General Settings")),
          SwitchListTile(
            value: nightMode,
            onChanged: (value) => setState(() => nightMode = value),
            title: Text("Night mode"),
          ),
          ListTile(
              leading: Icon(Icons.phone_android),
              title: Text("Device Settings")),
          ListTile(
              leading: Icon(Icons.feedback), title: Text("Help & Feedback")),
          ListTile(leading: Icon(Icons.star), title: Text("Ratings")),
          ListTile(leading: Icon(Icons.info), title: Text("About Fuad")),
        ],
      ),
    );
  }
}
