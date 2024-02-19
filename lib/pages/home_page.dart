import 'package:flutter/material.dart';
import 'package:local_push_notification_demo/API/data_fetch.dart';
import 'package:local_push_notification_demo/model/employee_model.dart';
import 'package:local_push_notification_demo/services/notification_services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<EmployeeModel> employeeList = [];

  @override
  void initState(){
    super.initState();
    DataFetch().getEmployeeData().then((value){
      employeeList = value;
      setState(() {});
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: employeeList.length,
              itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  NotificationService.notificationService.scheduleNotification();
                  /*NotificationService.notificationService.showNotification(
                    title: employeeList[index].name,
                    body: employeeList[index].website,
                    payLoad: employeeList[index].username,
                  );*/
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name : ${employeeList[index].name}'),
                      Text('Username : ${employeeList[index].username}'),
                      Text('Email : ${employeeList[index].email}'),
                    ],
                  ),
                ),
              );
            }, separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 16,);
            },),
          ),
         /* Center(
            child: ElevatedButton(
                onPressed: () {
                  debugPrint('Simple Notification');
                  NotificationService.notificationService.showNotification(
                    body: 'This is Simple Notification',
                    title: 'Simple Notification'
                  );
                },
                child: const Text('Simple Notification')),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  debugPrint('Button is Pressed');
                  NotificationService.notificationService.scheduleNotification();
                },
                child: const Text('Show Notification')),
          ),*/
        ],
      ),
    );
  }
}
