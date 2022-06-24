import '../view_report.dart';

class ReportScreen extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_)=> ReportScreen());

  @override
  ReportScreenState createState() => ReportScreenState();
}

class ReportScreenState extends State<ReportScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const ReportAppBar(),
        body: OverallReportBody(),
      ),
    );
  }
}