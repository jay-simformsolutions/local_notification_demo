import 'package:flutter/material.dart';
import 'package:local_push_notification_demo/services/notification_services.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(onPressed: (){
              NotificationService().showNotification(title: 'Sample Notification', body: 'It works fine');
            }, child: const Text('Show Notification')),
          )
        ],
      ),
    );
  }
}
