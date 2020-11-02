import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ingenieria_flutter/widgets/button_default.dart';

class ConfigPage extends StatefulWidget {
  ConfigPage({Key key}) : super(key: key);

  @override
  _ConfigState createState() => _ConfigState();
}

class _ConfigState extends State<ConfigPage> {
  final Widget svg = SvgPicture.asset(
    'assets/icons/back.svg',
    height: 40,
    width: 40,
    color: Colors.white,
  );
  bool _isSelected = false;
  bool _isSelected2 = false;
  bool _isSelected3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(39, 174, 96, 1),
        title: Text('Categorías'),
        leading: IconButton(
          padding: EdgeInsets.all(15),
          icon: svg,
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Container(
            color: Color.fromRGBO(236, 240, 241, 1),
            padding: EdgeInsets.all(20),
            height: 400,
            child: Column(
              children: <Widget>[
                LabeledCheckbox(
                  label: 'Categoría 1',
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  value: _isSelected,
                  onChanged: (bool newValue) {
                    setState(() {
                      _isSelected = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Categoría 2',
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  value: _isSelected2,
                  onChanged: (bool newValue) {
                    setState(() {
                      _isSelected2 = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Categoría 3',
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  value: _isSelected3,
                  onChanged: (bool newValue) {
                    setState(() {
                      _isSelected3 = newValue;
                    });
                  },
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: ButtonDefault(onPressed: () => {}, text: 'Guardar cambios'),
          )
        ],
      )),
    );
  }
}

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    this.label,
    this.padding,
    this.value,
    this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Expanded(child: Text(label)),
            Checkbox(
              value: value,
              onChanged: (bool newValue) {
                onChanged(newValue);
              },
            ),
          ],
        ),
      ),
    );
  }
}
