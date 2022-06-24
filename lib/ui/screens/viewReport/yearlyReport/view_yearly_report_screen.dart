import '../view_report.dart';

class YearlyReportScreen extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_)=> YearlyReportScreen());

  @override
  YearlyReportScreenState createState() => YearlyReportScreenState();
}

class YearlyReportScreenState extends State<YearlyReportScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const ReportAppBar(),
        body: YearlyReportBody(),
      ),
    );
  }
}