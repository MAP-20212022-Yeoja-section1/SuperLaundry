import 'view_report.dart';

class ReportAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ReportAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('REPORT'),
      leading: IconButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>mainMenuMScreen()));
        },
        icon: Icon(Icons.chevron_left_sharp),
        iconSize: 40.0,
      ),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 31, 215, 169),
      foregroundColor: Colors.white,
    );
  }
}