import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String userName;
  final List<dynamic> messages;
  const ChatPage({
    super.key,
    required this.userName,
    required this.messages
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {
      'text': 'Hello Jon,\nI\'d like to know how my son, Mark Twain is doing. Is he making any trouble?\n\nThank you ',
      'sender': 'other',
      'time': '8:37 PM',
      'date': 'June 25'
    },
    {
      'text': 'Hi Mrs. Twain, your son is doing great. He\'s been participating actively and hasn\'t caused any concerns.',
      'sender': 'me',
      'time': '9:40 PM',
      'date': 'June 25'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/camping.jpg'),
              radius: 20,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    widget.userName,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                ),
                Text(
                    'Camp PIC',
                    style: TextStyle(fontSize: 12, color: Colors.grey)
                ),
              ],
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.call),
              onPressed: () {
              },
            )
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: widget.messages.length,
                itemBuilder: (context, index) {
                  return buildMessageBubble(widget.messages[index]);
                },
              ),
            ),
            _buildMessageInput(),
          ],
        ),
      ),
    );
  }

  Widget buildMessageBubble(Map<String, dynamic> message) {
    bool isMe = message['sender'] == 'me';
    return Column(
      crossAxisAlignment:
      isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        if (message['date'] != null)
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                message['date'],
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 4),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isMe ? Color(0xFF677E32) : Colors.green.shade700,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isMe ? 12 : 0),
              topRight: Radius.circular(isMe ? 0 : 12),
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                message['text'],
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 4),
              Text(
                message['time'],
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 10
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.attach_file),
            onPressed: () {
            },
          ),
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type a message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Color(0xFF677E32)),
            onPressed: () {
            },
          ),
        ],
      ),
    );
  }
}