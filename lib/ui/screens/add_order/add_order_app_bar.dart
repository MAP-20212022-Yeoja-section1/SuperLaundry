import 'add_order.dart';

class AddOrderAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AddOrderAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('ADD ORDER'),
      leading: IconButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => mainMenuScreen()));
        },
        icon: Icon(Icons.chevron_left_sharp),
        iconSize: 40.0,
      ),
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 31, 215, 169),
      foregroundColor: Colors.white,
    );
  }
}
