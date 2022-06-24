import '../view_report.dart';

class MonthlyReportScreen extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_)=> MonthlyReportScreen());

  @override
  MonthlyReportScreenState createState() => MonthlyReportScreenState();
}

class MonthlyReportScreenState extends State<MonthlyReportScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const ReportAppBar(),
        body: MonthlyReportBody(),
      ),
    );
  }
}