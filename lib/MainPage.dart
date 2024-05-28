import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_first_flutter_project/RandomizerPage.dart';
import 'package:my_first_flutter_project/widgets/RangeSelectorTextField.dart';

class MainPage extends HookWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final min = useState<int>(0);
    final max = useState<int>(0);

    return Scaffold(
      appBar: AppBar(
          title: const Text("Select Range")
      ),
      body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RangeSelectorTextField(
                  labelText: "Minimum",
                  onChange: (value) => min.value = value,
                ),
                const SizedBox(height: 12),
                RangeSelectorTextField(
                  labelText: "Maximum",
                  onChange: (value) => max.value = value,
                )
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward),
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => RandomizerPage(min: min.value, max: max.value)));
          }
        },
      ),
    );
  }
}
