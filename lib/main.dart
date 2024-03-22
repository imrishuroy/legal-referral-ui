// /// -----------------------------------
// ///          External Packages
// /// -----------------------------------

// import 'package:auth0_flutter/auth0_flutter.dart';
// import 'package:flutter/material.dart';

// const appScheme = 'https';

// /// -----------------------------------
// ///           Profile Widget
// /// -----------------------------------

// class Profile extends StatelessWidget {
//   final Future<void> Function() logoutAction;
//   final UserProfile? user;

//   const Profile(this.logoutAction, this.user, {final Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Container(
//           width: 150,
//           height: 150,
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.blue, width: 4),
//             shape: BoxShape.circle,
//             image: DecorationImage(
//               fit: BoxFit.fill,
//               image: NetworkImage(user?.pictureUrl.toString() ?? ''),
//             ),
//           ),
//         ),
//         const SizedBox(height: 24),
//         Text('Name: ${user?.name}'),
//         const SizedBox(height: 48),
//         ElevatedButton(
//           onPressed: () async {
//             await logoutAction();
//           },
//           child: const Text('Logout'),
//         ),
//       ],
//     );
//   }
// }

// /// -----------------------------------
// ///            Login Widget
// /// -----------------------------------

// class Login extends StatelessWidget {
//   final Future<void> Function() loginAction;
//   final String loginError;

//   const Login(this.loginAction, this.loginError, {final Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         ElevatedButton(
//           onPressed: () async {
//             await loginAction();
//           },
//           child: const Text('Login'),
//         ),
//         Text(loginError ?? ''),
//       ],
//     );
//   }
// }

// /// -----------------------------------
// ///                 App
// /// -----------------------------------

// void main() => runApp(const MyApp());

// class MyApp extends StatefulWidget {
//   const MyApp({final Key? key}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// /// -----------------------------------
// ///              App State
// /// -----------------------------------

// class _MyAppState extends State<MyApp> {
//   Credentials? _credentials;
//   late Auth0 auth0;

//   bool isBusy = false;
//   late String errorMessage;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Auth0 Demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Auth0 Demo'),
//         ),
//         body: Center(
//           child: isBusy
//               ? const CircularProgressIndicator()
//               : _credentials != null
//                   ? Profile(logoutAction, _credentials?.user)
//                   : Login(loginAction, errorMessage),
//         ),
//       ),
//     );
//   }

//   Future<void> loginAction() async {
//     setState(() {
//       isBusy = true;
//       errorMessage = '';
//     });

//     try {
//       final Credentials credentials =
//           await auth0.webAuthentication(scheme: appScheme).login();

//       debugPrint('credentials: ${credentials.accessToken}');

//       setState(() {
//         isBusy = false;
//         _credentials = credentials;
//       });
//     } on Exception catch (e, s) {
//       debugPrint('login error: $e - stack: $s');

//       setState(() {
//         isBusy = false;
//         errorMessage = e.toString();
//       });
//     }
//   }

//   Future<void> logoutAction() async {
//     await auth0.webAuthentication(scheme: appScheme).logout();

//     setState(() {
//       _credentials = null;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();

//     auth0 = Auth0('dev-5c6eook6rrlaobtv.us.auth0.com',
//         'YXTkygnU2SepreFXxlY5THnX5Vz3EuwN');
//     errorMessage = '';
//   }
// }

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:legal_referral_ui/auth0/signin_screen.dart';
import 'package:legal_referral_ui/firebase_options.dart';

Future<dynamic> main() async {
  await dotenv.load();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Auth0 Demo',
      home: const SignInScreen(),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
