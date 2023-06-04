import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

class AnswerTablet extends StatefulWidget {
  final Function selectHandler;
  final String answerText;
  final Function? playerStop;

  const AnswerTablet(this.selectHandler, this.answerText, this.playerStop, {Key? key})
      : super(key: key);

  @override
  State<AnswerTablet> createState() => _AnswerStateTablet();
}

class _AnswerStateTablet extends State<AnswerTablet> {
  bool _tapped = false;
  final animationDuration = const Duration(milliseconds: 50);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () async {
            
            setState(() {
              _tapped = true;
            });
            if( widget.playerStop != null){
              await  widget.playerStop!();
            }
            
            Future.delayed(animationDuration).then((_){
                 
                  widget.selectHandler();
                  
                });
          },
          style: ButtonStyle(
            backgroundColor: _tapped
                ? MaterialStateProperty.all(utilities.primaryColor)
                : MaterialStateProperty.all(utilities.tertiaryColor),
          ),
          child: Wrap(
          alignment: WrapAlignment.center,

        children: [Text(
      widget.answerText,
      //overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center ,
      style: GoogleFonts.openSans(
        fontSize: 25,
        color: Colors.black,
        fontWeight: FontWeight.bold ,
      ),
    )]
    ),
          
          
        ),
      ),
    );
  }
}

class AnswerHorizontalTablet extends StatefulWidget {
  final Function selectHandler;
  final String answerText;
  final Function? playerStop;

  const AnswerHorizontalTablet(this.selectHandler, this.answerText, this.playerStop,
      {Key? key})
      : super(key: key);

  @override
  State<AnswerHorizontalTablet> createState() => _AnswerHorizontalStateTablet();
}

class _AnswerHorizontalStateTablet extends State<AnswerHorizontalTablet> {
  bool _tapped = false;
  final animationDuration = const Duration(milliseconds: 50);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 380,
        height: 45,
        child: ElevatedButton(
          onPressed: () async {
            if (widget.playerStop != null) {
              await widget.playerStop!();
            }

            setState(() {
              _tapped = true;
            });
            Future.delayed(animationDuration).then((_) => {
                  widget.selectHandler(),
                });
          },
          style: ButtonStyle(
            
            backgroundColor: _tapped
                ? MaterialStateProperty.all(utilities.primaryColor)
                : MaterialStateProperty.all(utilities.tertiaryColor),
          ),
         
        child: Wrap(
          alignment: WrapAlignment.center,

        children: [Text(
      widget.answerText,
      //overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center ,
      style: GoogleFonts.openSans(
        fontSize: 25,
        color: Colors.black,
        fontWeight: FontWeight.bold ,
      ),
    ),]
    
    ),
        ),
      ),
    );
  }
}
