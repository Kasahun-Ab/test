import '../../../common_components/index.dart';

class DontHaveAnaccountButton extends StatelessWidget {
  const DontHaveAnaccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      ontap: () => Navigator.pushNamed(context, '/register'),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account?",
            style: TextStyle(color: Colors.black87, fontSize: 16),
          ),
          SizedBox(
            width: 15,
          ),
          Text("Sign Up",
              style: TextStyle(
                fontSize: 16,
                color: Colors.amber,
              ))
        ],
      ),
    );
  }
}
