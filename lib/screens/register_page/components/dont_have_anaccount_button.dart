import '../../../common_components/index.dart';

class AlreadyHaveanAccount extends StatelessWidget {
  const AlreadyHaveanAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      ontap: ()=>Navigator.pushNamed(context,'/login'),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have an Account?",
            style: TextStyle(color: Colors.black87, fontSize: 16),
          ),
          SizedBox(
            width: 15,
          ),
          Text("Sign in",
              style: TextStyle(
                fontSize: 16,
                color: Colors.amber,
              ))
        ],
      ),
    );
  }
}
