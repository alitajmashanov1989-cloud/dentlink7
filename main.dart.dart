import 'package:flutter/material.dart';

void main() {
  runApp(DentLinkApp());
}

class DentLinkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DentLink MVP',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: RoleSelectionPage(),
    );
  }
}

class RoleSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Выберите роль')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PatientPage()));
              },
              child: Text('Пациент'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ClinicPage()));
              },
              child: Text('Стоматология'),
            ),
          ],
        ),
      ),
    );
  }
}

class PatientPage extends StatefulWidget {
  @override
  _PatientPageState createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  List<String> comments = [];
  int bonusPoints = 0;
  TextEditingController controller = TextEditingController();

  void addComment() {
    if (controller.text.trim().isNotEmpty) {
      setState(() {
        comments.add(controller.text.trim());
        bonusPoints += 1; // бонус за комментарий
        controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Пациент')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Бонусные очки: $bonusPoints'),
            TextField(
              controller: controller,
              decoration: InputDecoration(labelText: 'Напишите комментарий'),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: addComment, child: Text('Отправить')),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(comments[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClinicPage extends StatefulWidget {
  @override
  _ClinicPageState createState() => _ClinicPageState();
}

class _ClinicPageState extends State<ClinicPage> {
  List<String> patientComments = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Стоматология')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Комментарии пациентов:'),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: patientComments.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(patientComments[index]),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  patientComments.add('Новый тестовый комментарий');
                });
              },
              child: Text('Добавить тестовый комментарий'),
            )
          ],
        ),
      ),
    );
  }
}