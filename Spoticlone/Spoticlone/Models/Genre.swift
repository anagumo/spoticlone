//
//  Genre.swift
//  Spoticlone
//
//  Created by Ariana Rodríguez on 28/02/25.
//

struct Genre: Hashable {
    let id: Int
    let name: String
    let description: String
    let color: String
}

enum GenreLocalRepository {
    static let genres: [Genre] = [
        Genre(id: 1, name: "Pop", description: "Catchy and mainstream music that dominates the charts.", color: "#FF6F61"),
        Genre(id: 2, name: "Rock", description: "Guitar-driven music with a strong beat, ranging from classic to alternative.", color: "#8B4513"),
        Genre(id: 3, name: "Hip-Hop", description: "Rhythmic music with rhyming lyrics, often featuring beats and rap.", color: "#FF1493"),
        Genre(id: 4, name: "Electronic", description: "Music created using electronic instruments and technology, often for dancing.", color: "#FFD700"),
        Genre(id: 5, name: "R&B", description: "Soulful and smooth music blending jazz, gospel, and blues influences.", color: "#FF69B4"),
        Genre(id: 6, name: "Country", description: "Music rooted in American folk traditions, often featuring storytelling lyrics.", color: "#8B4513"),
        Genre(id: 7, name: "Jazz", description: "Improvisational music with complex harmonies and rhythms.", color: "#4B0082"),
        Genre(id: 8, name: "Classical", description: "Timeless compositions from renowned composers, often orchestral.", color: "#483D8B"),
        Genre(id: 9, name: "Reggae", description: "Music originating from Jamaica, characterized by its offbeat rhythms and social themes.", color: "#FF4500"),
        Genre(id: 10, name: "Indie", description: "Independent music often characterized by its unique and experimental sound.", color: "#FF69B4"),
        Genre(id: 11, name: "Metal", description: "Heavy and aggressive music with distorted guitars and powerful vocals.", color: "#2F4F4F"),
        Genre(id: 12, name: "Folk", description: "Traditional and acoustic music often featuring storytelling and simple melodies.", color: "#DAA520"),
        Genre(id: 13, name: "Blues", description: "Music rooted in African-American history, characterized by its melancholic tone.", color: "#00008B"),
        Genre(id: 14, name: "Latin", description: "Vibrant music from Latin America, including salsa, reggaeton, and bachata.", color: "#FF0000"),
        Genre(id: 15, name: "K-Pop", description: "Korean pop music known for its catchy melodies and high-energy performances.", color: "#FF6F61"),
        Genre(id: 16, name: "EDM", description: "Electronic Dance Music designed for clubs and festivals, with heavy beats and drops.", color: "#00FFFF"),
        Genre(id: 17, name: "Punk", description: "Raw and rebellious music with fast tempos and anti-establishment themes.", color: "#DC143C"),
        Genre(id: 18, name: "Soul", description: "Emotional and expressive music blending R&B and gospel influences.", color: "#FF69B4"),
        Genre(id: 19, name: "Funk", description: "Groove-driven music with strong bass lines and rhythmic patterns.", color: "#8A2BE2"),
        Genre(id: 20, name: "World", description: "Music from diverse cultures and traditions around the globe.", color: "#20B2AA")
    ]
}
