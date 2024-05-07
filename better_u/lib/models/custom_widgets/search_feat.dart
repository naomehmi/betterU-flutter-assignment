import 'package:better_u/screens/content/programs/workout_program_checklist.dart';
import 'package:better_u/screens/content/videos/play_video.dart';
import 'package:flutter/material.dart';

class SearchFeature extends StatefulWidget {
  const SearchFeature({
    super.key,
    required this.contents,
    required this.isProgram
  });

  final List contents;
  final bool isProgram;

  @override
  State<SearchFeature> createState() => _SearchFeatureState();
}

class _SearchFeatureState extends State<SearchFeature> {
  final TextEditingController _controller = TextEditingController();
  List filteredList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          controller: _controller,
          style: const TextStyle(
            fontSize: 12,
            height: 1
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            isDense: true,
            hintText: "Search for ${widget.isProgram ? 'programs' : 'videos'}...",
            focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Color.fromARGB(255, 139, 93, 175), width: 1.5), borderRadius: BorderRadius.circular(5)),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.purple[200]!,
                width: 1.5
              )
            )
          ),
          onChanged: (value){
            if(value.isEmpty) {
              filteredList = [];
            } else if(value.isNotEmpty){
              filteredList = widget.contents.where((element) => element.title.toLowerCase().contains(value)).toList();
            }
            setState(() {});
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Text(
                "Search Results For: \"${_controller.text}\"",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.purple[200]!
                ),
              ),
              const SizedBox(height: 15,),
              ...filteredList.map((e) => ListTile(
                onTap: (){
                  widget.isProgram ? Navigator.push(context, MaterialPageRoute(builder: (context) => WorkoutProgramChecklist(program: e))) : PlayVideo(video: e);
                },
                isThreeLine: true,
                visualDensity: const VisualDensity(vertical: 4),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    e.coverImage, 
                    width: MediaQuery.of(context).size.width / 3, 
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(e.title, style: const TextStyle(fontWeight: FontWeight.bold),),
                subtitle: widget.isProgram ? Text(e.desc, overflow: TextOverflow.ellipsis, maxLines: 2,) : Text(e.cat) 
              ))
            ],
          ),
        ),
      ),
    );
  }
}