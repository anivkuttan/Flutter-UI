import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date And Time'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Date(),
              Time(),
              DateAndTime(),
            ]),
      ),
    );
  }
}

class Date extends StatefulWidget {
  const Date({Key? key}) : super(key: key);

  @override
  _DateState createState() => _DateState();
}

class _DateState extends State<Date> {
  DateTime date = DateTime(2022, 1, 07);
  Future<void> getDate(BuildContext context) async {
    DateTime? _pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2050));
    if (_pickedDate != null) {
      setState(() {
        date = _pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Column(
        children: [
          const Text(
            'Pick Date',
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 70,
            width: 280,
            child: ElevatedButton(
              child: Text(
                '${date.day}/${date.month}/${date.year}',
                style: const TextStyle(fontSize: 25),
              ),
              onPressed: () {
                getDate(context);
              },
            ),
          )
        ],
      ),
    );
  }
}

class Time extends StatefulWidget {
  const Time({Key? key}) : super(key: key);

  @override
  _TimeState createState() => _TimeState();
}

class _TimeState extends State<Time> {
  TimeOfDay time =const TimeOfDay(hour: 12,minute: 30);

  Future<void> getTime(BuildContext context) async {
    TimeOfDay? _time = await showTimePicker(
        context: context, initialTime: time);
    if (_time != null) {
      setState(() {
        time = _time;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Column(
        children: [
          const Text(
            'Pick Time',
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 70,
            width: 280,
            child: ElevatedButton(
              child: Text(
                '${time.hour} : ${time.minute}',
                style: const TextStyle(fontSize: 25),
              ),
              onPressed: () {
                getTime(context);
              },
            ),
          )
        ],
      ),
    );
  }
}

class DateAndTime extends StatefulWidget {
  const DateAndTime({Key? key}) : super(key: key);

  @override
  _DateAndTimeState createState() => _DateAndTimeState();
}

class _DateAndTimeState extends State<DateAndTime> {
  DateTime dateAndTime = DateTime(2022, 3, 4, 8, 40);

  Future<void> getDateAndTime(BuildContext context) async {
    DateTime? _date = await showDatePicker(
        context: context,
        initialDate: dateAndTime,
        firstDate: DateTime(2010),
        lastDate: DateTime(2050));

    TimeOfDay? _time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (_date != null && _time != null) {
      DateTime newDateAndTime = DateTime(
          _date.year, _date.month, _date.day, _time.hour, _time.minute);
      setState(() {
        dateAndTime = newDateAndTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var hour = dateAndTime.hour.toString().padLeft(2, '0');
    var minute = dateAndTime.minute.toString().padLeft(2, '0');
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Column(
        children: [
          const Text(
            'Pick Date And Time',
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 70,
            width: 280,
            child: ElevatedButton(
              child: Text(
                '${dateAndTime.day}/${dateAndTime.month}/${dateAndTime.year}   $hour:$minute',
                style: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                getDateAndTime(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
