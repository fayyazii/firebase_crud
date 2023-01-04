import 'dart:developer';

import 'package:firebase_crud/cubits/qrcubits/qrcubits_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class QrScanner extends StatefulWidget {
  const QrScanner({Key? key}) : super(key: key);

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  final txtcontroller = TextEditingController();
  @override
  void initState() {

    super.initState();
  }


  Future scanqr() async
  {
    var camerastaus = await Permission.camera.status;
    if (camerastaus.isGranted) {
      String? qrdata = await scanner.scan();
      log(qrdata ?? "null");
      context.read<QrcubitsCubit>().getdata(qrdata ?? "null");
      txtcontroller.text = qrdata ?? "null";
    }
    else {
      var isGrand = await Permission.camera.request();
      if (isGrand.isGranted) {
        String? qrdata = await scanner.scan();
        log(qrdata ?? "null");
        context.read<QrcubitsCubit>().getdata(qrdata ?? "null");
        txtcontroller.text = qrdata ?? "null";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("QrScanner"),
        centerTitle: true,
      ),
      body: BlocBuilder<QrcubitsCubit, QrcubitsState>(
        builder: (context, state) {
          if(state is QrcubitsInitial){
            return SizedBox(
              height: MediaQuery.of(context).size.height*0.6,
              child:const  Center(
                child: Text("Scan QR code"),
              ),
            );
          }
          if(state is QrcubitsLoading)
          {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is QrcubitsError)
          {
            return Center(
              child: Text(state.err),
            );
          }
          if(state is QrcubitsLoaded) {
            return Center(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                children: [
                 const SizedBox(height: 20,),
                  Center(
                    child: Text("code: "+state.data.code),
                  ),
                  const SizedBox(height: 20,),
                   Center(
                    child: Text("Name: ${state.data.name}"),
                  ),
                  const SizedBox(
                   height: 20,
                  ),
                  Center(
                    child: Text("Participant: ${state.data.participant}"),
                  ),
                  // Container(
                  //   height: 50,
                  //   width: 200,
                  //   decoration: const BoxDecoration(
                  //     color: Colors.orange,
                  //     borderRadius: BorderRadius.all(Radius.circular(10))
                  //   ),
                  //   child: Align(
                  //     alignment: Alignment.center,
                  //     child: Text(state.data ? "QrCode Matched"
                  //         : "Not Matched",
                  //     style: const TextStyle(
                  //       //fontWeight: FontWeight.bold,
                  //       fontSize: 24,
                  //       color: Colors.white
                  //     ),),
                  //   ),
                  // ),

                 const SizedBox(
                   height: 20,
                 )
                ],
          ),
              ),
            );
          }
          else
            {
              return SizedBox();
            }
        },
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.orange,
        backgroundColor: Colors.orange,
        onPressed: ()
      {
        scanqr();
      },
      child: Icon(Icons.document_scanner_outlined,color: Colors.white,),),
    );

  }
}
