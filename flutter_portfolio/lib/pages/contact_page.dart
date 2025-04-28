import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'pages_layout.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

 


  void _submitForm() async {
  if (_formKey.currentState!.validate()) {
    final String name = nameController.text.trim();
    final String subject = subjectController.text.trim();
    final String email = emailController.text.trim();
    final String message = messageController.text.trim();

    final Uri mailtoUri = Uri(
      scheme: 'mailto',
      path: 'testsa98@gmail.com',
      queryParameters: {
        'subject': subject,
        'body': 'Name: $name\nEmail: $email\n\n$message',
      },
    );

    final Uri gmailWebUri = Uri.parse(
      'https://mail.google.com/mail/?view=cm&to=testsa98@gmail.com&su=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent('Name: $name\nEmail: $email\n\n$message')}'
    );

    try {
      final bool canLaunchMailto = await canLaunchUrl(mailtoUri);

      if (canLaunchMailto) {
        await launchUrl(mailtoUri, mode: LaunchMode.platformDefault);
      } else {
        final bool canLaunchGmailWeb = await canLaunchUrl(gmailWebUri);
        if (canLaunchGmailWeb) {
          await launchUrl(gmailWebUri, mode: LaunchMode.externalApplication);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Could not open email client or Gmail.')),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }
}





  @override
  Widget build(BuildContext context) {
    return MainLayout(
      currentRoute: '/contact',
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 600),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  SizedBox(height: 16,),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Your Name',
                      border: OutlineInputBorder(borderSide: BorderSide())
                    ),
                    validator: (value) => value!.isEmpty ? 'Please enter your name' : null,
                  ),
                  SizedBox(height: 16,),
                  TextFormField(
                    controller: subjectController,
                    decoration: InputDecoration(
                      labelText: 'Subject',
                      border: OutlineInputBorder(borderSide: BorderSide())
                    ),
                    validator: (value) => value!.isEmpty ? 'Please enter a subject' : null,
                  ),
                  SizedBox(height: 16,),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(borderSide: BorderSide())
                    ),
                    validator: (value) {
                      if(value == null){
                        return 'Please enter your email';
                      }else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)){
                        return 'Please enter a valid email address';
                      }
                      return null;
                    }
                  ),
                  SizedBox(height: 16,),
                  TextFormField(
                    controller: messageController,
                    decoration: InputDecoration(
                      labelText: 'Message',
                      border: OutlineInputBorder(borderSide: BorderSide())
                    ),
                    maxLines: 5,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your message' : null,
                  ),
                  SizedBox(height: 16,),
                  OutlinedButton(
                    onPressed: _submitForm,
                    style: OutlinedButton.styleFrom(
                      foregroundColor:Colors.white,
                    ),
                    child: Text("Submit")
                  )
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}

