// Create a component for the regex group
// Create a regex from the words
// Create a component for the regex group

import 'package:flutter/material.dart';

const String _regexGroup = r'''
  (?<group>
    (?<word>
      [a-zA-Z]+
    )
    (?<andOr>
      \s+(and|or)\s+
    )?
  )+
''';

class RegexGroup extends StatefulWidget {
  const RegexGroup({super.key});

  @override
  State<RegexGroup> createState() => _RegexGroupState();
}

class _RegexGroupState extends State<RegexGroup> {
  @override
  Widget build(BuildContext context) {
    // Ask the user to enter words with 'and' and 'or' in between
    // Create a component for the regex group
    return Column(
      children: [
        const Text('Enter words with "and" and "or" in between'),
      ],
    );
  }
}
