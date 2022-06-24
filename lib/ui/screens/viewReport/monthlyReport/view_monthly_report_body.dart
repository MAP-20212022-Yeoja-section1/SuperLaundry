import '../view_report.dart';

class MonthlyReportBody extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => MonthlyReportBody());

  @override
  _MonthlyReportBody createState() => _MonthlyReportBody();
}

class _MonthlyReportBody extends State<MonthlyReportBody> {
  final _formKey = GlobalKey<FormState>();
  final yearController = TextEditingController();
  final monthController = TextEditingController();
  List<String> items = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  @override
  Widget build(BuildContext context) {
    return View<ReportViewmodel>(
        shouldRebuild: false,
        builder: (_, viewmodel) => Stack(children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 167, 255, 235)),
              ),
              Center(
                  child: SingleChildScrollView(
                      child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Row(children: <Widget>[
                    TextButton(
                      child: Text('Overall'),
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromARGB(255, 25, 99, 78),
                          side: BorderSide(width: 1.0, color: Colors.white),
                          fixedSize: Size(80, 30)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReportScreen()));
                      },
                    ),
                    TextButton(
                      child: Text('Monthly'),
                      style: TextButton.styleFrom(
                          primary: Color.fromARGB(255, 25, 99, 78),
                          backgroundColor: Colors.white,
                          side: BorderSide(width: 1.0, color: Colors.white),
                          fixedSize: Size(80, 30)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MonthlyReportScreen()));
                      },
                    ),
                    TextButton(
                      child: Text('Yearly'),
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromARGB(255, 25, 99, 78),
                          side: BorderSide(width: 1.0, color: Colors.white),
                          fixedSize: Size(80, 30)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => YearlyReportScreen()));
                      },
                    ),
                  ]),
                ),
                Container(
                  height: 300,
                  width: 380,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 217, 255, 245),
                    borderRadius: BorderRadius.all(const Radius.circular(10)),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2.0,
                          offset: Offset(2.0, 2.0))
                    ],
                  ),
                  padding:
                      const EdgeInsets.only(left: 28.0, top: 20.0, right: 28.0),
                  child: Column(
                    children: [
                      Form(
                          key: _formKey,
                          child: SingleChildScrollView(
                            child: Column(children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: TextFormField(
                                    controller: monthController,
                                    decoration: InputDecoration(
                                        labelText: "Select a month",
                                        suffixIcon: PopupMenuButton<String>(
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            size: 40,
                                          ),
                                          onSelected: (String value) {
                                            monthController.text = value;
                                          },
                                          itemBuilder: (BuildContext context) {
                                            return items
                                                .map<PopupMenuItem<String>>(
                                                    (String value) {
                                              return new PopupMenuItem(
                                                  child: new Text(value),
                                                  value: value);
                                            }).toList();
                                          },
                                        )),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return ("Please choose the month!");
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      monthController.text = value!;
                                    },
                                  ),
                                ),
                              TextFormField(
                                controller: yearController,
                                keyboardType: TextInputType.number,
                                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'))],
                                decoration: const InputDecoration(
                                    labelText: 'Enter a year'),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter year!";
                                    } else {
                                      return null;
                                    }
                                },
                                onSaved: (value) {
                                  yearController.text = value!;
                                },
                              ),
                            ]),
                          )),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: FloatingActionButton.extended(
                            onPressed: () {
                              if (_formKey.currentState!.validate()){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ChosenMonthlyReportBody(month: monthController.text, year:yearController.text)));
                              }
                            },
                            label: Text(
                              'Search',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 25, 99, 78)),
                            ),
                            backgroundColor: Colors.white,
                            icon: Icon(Icons.search,
                                color: Color.fromARGB(255, 25, 99, 78))),
                      )
                    ],
                  ),
                )
              ])))
            ]));
  }
}
