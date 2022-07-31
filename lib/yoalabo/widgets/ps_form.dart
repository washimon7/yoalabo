import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yoalabo/models/praise_song.dart';
import 'package:yoalabo/themes/theme.dart';
import 'package:yoalabo/yoalabo/services/praise_song_service.dart';

class PSForm extends StatefulWidget {
  const PSForm({
    Key? key,
  }) : super(key: key);

  @override
  State<PSForm> createState() => _PSFormState();
}

class _PSFormState extends State<PSForm> {
  final _formKey = GlobalKey<FormState>();
  var _counterText = '';
  final _tffMaxLength = 65;
  var _ttfValue = '';
  var _loading = false;

  @override
  void initState() {
    super.initState();
  }

  void _clearForm() {
    _formKey.currentState!.reset();
    _ttfValue = '';
    setState(() {
      _counterText = '';
    });
  }

  void _createPraiseSong() async {
    setState(() => _loading = true);
    final ps = PraiseSong(songName: _ttfValue.trim(), createdAt: Timestamp.fromDate(DateTime.now()));
    final res = await PraiseSongService.fetchCreatePS(ps);
    if (res[200] != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Éxito: canto creado correctamente.')),
      );
      _clearForm();
    }
    if (res[500] != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error: hay un problema de conexión.')),
      );
    }
    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24),
          TextFormField(
            autofocus: true,
            cursorColor: YocantoColors.pink,
            decoration: InputDecoration(
              labelText: 'Nombre del canto',
              counterText: _counterText
            ),
            maxLength: _tffMaxLength,
            textCapitalization: TextCapitalization.sentences,
            onChanged: (value) {
              setState(() {
                _counterText = value.isEmpty ? '' : '${value.length}/$_tffMaxLength';
              });
              _formKey.currentState!.validate();
              _ttfValue = value;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ingresa un nombre para el canto';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              fixedSize: const Size(double.maxFinite, 44),
            ),
            child: Text(
              'Crear',
              style: TextStyle(
                color: YocantoColors.white,
              ),
            ),
            onPressed: _loading ? null : () {
              if (!_formKey.currentState!.validate()) return;
              _createPraiseSong();
            },
          )
        ],
      ),
    );
  }
}