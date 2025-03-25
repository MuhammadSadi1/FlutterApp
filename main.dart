import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      darkTheme: ThemeData(primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      home: HomeActivity(),
    );
  }
}

class HomeActivity extends StatelessWidget {
  HomeActivity({super.key});

  MySnackBar(message, context) async {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  MyAlertDialog(context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert !"),
          content: Text("Do you want to delete"),
          actions: [
            TextButton(onPressed: () {
              MySnackBar("Delete Success", context);
              Navigator.of(context).pop();
              
            }, child: Text("Yes")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("No"))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle = ElevatedButton.styleFrom(
        padding: EdgeInsets.all(25),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(40))));
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            onPressed: () {
              MySnackBar("Search", context);
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              MySnackBar("Comment", context);
            },
            icon: const Icon(Icons.comment),
          ),
          IconButton(
            onPressed: () {
              MySnackBar("Settings", context);
            },
            icon: const Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {
              MySnackBar("Email", context);
            },
            icon: const Icon(Icons.email),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("click me"),
              onPressed: () {
                MyAlertDialog(context);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    MySnackBar("I'm text button", context);
                  },
                  child: Text('Text: Button'),
                ),
                ElevatedButton(
                  onPressed: () {
                    MySnackBar("I'm elevated button", context);
                  },
                  child: Text('Text: Button'),
                ),
                OutlinedButton(
                  onPressed: () {
                    MySnackBar("I'm outline button", context);
                  },
                  child: Text('Text: Button'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: Colors.amber,
        onPressed: () {
          MySnackBar("Floating Button", context);
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Contact"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        onTap: (int index) {
          if (index == 0) {
            MySnackBar("I'm Home", context);
          }
          if (index == 1) {
            MySnackBar("I'm Contact", context);
          }
          if (index == 2) {
            MySnackBar("I'm Profile", context);
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.white),
                accountName: Text("Sadi", style: TextStyle(color: Colors.black)),
                accountEmail: Text("example@account.com", style: TextStyle(color: Colors.black)),
                currentAccountPicture: Image(
                  image: NetworkImage("https://media.licdn.com/dms/image/v2/D5603AQG8wb_vhjpVoQ/profile-displayphoto-shrink_200_200/B56ZSPe1zMHEAY-/0/1737574014753?e=2147483647&v=beta&t=JkK5W0dqoHfACtL0wDRY75GR13Grug3NYXv_W41kXmI"),
                ),
              ),
            ),
            ListTile(leading: Icon(Icons.home), title: Text("Home"), onTap: null),
            ListTile(leading: Icon(Icons.contact_mail), title: Text("Contact"), onTap: null),
            ListTile(leading: Icon(Icons.person), title: Text("Profile"), onTap: null),
            ListTile(leading: Icon(Icons.email), title: Text("Email"), onTap: null),
            ListTile(leading: Icon(Icons.phone), title: Text("Phone"), onTap: null),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.white),
                accountName: Text("Sadi", style: TextStyle(color: Colors.black)),
                accountEmail: Text("example@account.com", style: TextStyle(color: Colors.black)),
                currentAccountPicture: Image(
                  image: NetworkImage("https://media.licdn.com/dms/image/v2/D5603AQG8wb_vhjpVoQ/profile-displayphoto-shrink_200_200/B56ZSPe1zMHEAY-/0/1737574014753?e=2147483647&v=beta&t=JkK5W0dqoHfACtL0wDRY75GR13Grug3NYXv_W41kXmI"),
                ),
              ),
            ),
            ListTile(leading: Icon(Icons.home), title: Text("Home"), onTap: null),
            ListTile(leading: Icon(Icons.contact_mail), title: Text("Contact"), onTap: null),
            ListTile(leading: Icon(Icons.person), title: Text("Profile"), onTap: null),
            ListTile(leading: Icon(Icons.email), title: Text("Email"), onTap: null),
            ListTile(leading: Icon(Icons.phone), title: Text("Phone"), onTap: null),
          ],
        ),
      ),
    );
  }
}