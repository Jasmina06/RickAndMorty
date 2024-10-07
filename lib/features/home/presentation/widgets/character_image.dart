import 'package:flutter/material.dart';

class CharacterImage extends StatelessWidget {
  final String imageUrl;
  final int characterId;

  const CharacterImage({
    required this.imageUrl,
    required this.characterId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: characterId, 
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), 
              blurRadius: 15,
              spreadRadius: 3,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            imageUrl,
            height: 350,
            width: double.infinity,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) =>
                loadingProgress == null
                    ? child
                    : const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFF5C6BC0),
                        ),
                      ),
            errorBuilder: (_, __, ___) => Container(
              color: Colors.grey[200], 
              height: 350,
              width: double.infinity,
              child: const Center(
                child: Icon(Icons.error, color: Colors.red, size: 50),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
