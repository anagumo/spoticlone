//
//  Playlist.swift
//  Spoticlone
//
//  Created by Ariana Rodríguez on 28/02/25.
//

struct Playlist: Hashable {
    let id: Int
    let name: String
    let description: String
    let emoji: String
    let color: String
    let songs: [Song]
}

struct Song: Hashable {
    let title: String
    let artist: String
    let duration: String
}

enum PlaylistLocalRepository {
    static let playlists: [Playlist] = [
        Playlist(
            id: 1,
            name: "Top Hits 2023",
            description: "The hottest tracks of the year, updated weekly!",
            emoji: "🔥",
            color: "#FF4500",
            songs: [
                Song(title: "Flowers", artist: "Miley Cyrus", duration: "3:20"),
                Song(title: "As It Was", artist: "Harry Styles", duration: "2:47"),
                Song(title: "Anti-Hero", artist: "Taylor Swift", duration: "3:20"),
                Song(title: "Unholy", artist: "Sam Smith ft. Kim Petras", duration: "2:36"),
                Song(title: "Creepin'", artist: "Metro Boomin, The Weeknd, 21 Savage", duration: "3:41"),
                Song(title: "Kill Bill", artist: "SZA", duration: "2:33"),
                Song(title: "Calm Down", artist: "Rema ft. Selena Gomez", duration: "3:59"),
                Song(title: "Die For You", artist: "The Weeknd", duration: "4:20"),
                Song(title: "I'm Good (Blue)", artist: "David Guetta ft. Bebe Rexha", duration: "2:55"),
                Song(title: "Lavender Haze", artist: "Taylor Swift", duration: "3:22")
            ]
        ),
        Playlist(
            id: 2,
            name: "Rock Classics",
            description: "Timeless rock anthems from legendary bands.",
            emoji: "🎸",
            color: "#8B4513",
            songs: [
                Song(title: "Bohemian Rhapsody", artist: "Queen", duration: "5:55"),
                Song(title: "Hotel California", artist: "Eagles", duration: "6:30"),
                Song(title: "Stairway to Heaven", artist: "Led Zeppelin", duration: "8:02"),
                Song(title: "Smells Like Teen Spirit", artist: "Nirvana", duration: "5:01"),
                Song(title: "Sweet Child O' Mine", artist: "Guns N' Roses", duration: "5:56"),
                Song(title: "Back in Black", artist: "AC/DC", duration: "4:15"),
                Song(title: "Another Brick in the Wall", artist: "Pink Floyd", duration: "3:59"),
                Song(title: "Paint It Black", artist: "The Rolling Stones", duration: "3:22"),
                Song(title: "Purple Haze", artist: "Jimi Hendrix", duration: "2:50"),
                Song(title: "Livin' on a Prayer", artist: "Bon Jovi", duration: "4:09")
            ]
        ),
        Playlist(
            id: 3,
            name: "Chill Vibes",
            description: "Relaxing and soothing tunes for any mood.",
            emoji: "🌊",
            color: "#00BFFF",
            songs: [
                Song(title: "Sunflower", artist: "Post Malone & Swae Lee", duration: "2:38"),
                Song(title: "Lovely", artist: "Billie Eilish & Khalid", duration: "3:20"),
                Song(title: "Night Owl", artist: "Galimatias", duration: "4:10"),
                Song(title: "Best Part", artist: "Daniel Caesar ft. H.E.R.", duration: "3:29"),
                Song(title: "Location", artist: "Khalid", duration: "3:39"),
                Song(title: "Electric Feel", artist: "MGMT", duration: "3:49"),
                Song(title: "The Less I Know The Better", artist: "Tame Impala", duration: "3:36"),
                Song(title: "Sweater Weather", artist: "The Neighbourhood", duration: "4:00"),
                Song(title: "Coffee", artist: "Beabadoobee", duration: "2:06"),
                Song(title: "Talk", artist: "Khalid", duration: "3:17")
            ]
        ),
        Playlist(
            id: 4,
            name: "Hip-Hop Bangers",
            description: "Hard-hitting beats and fire bars.",
            emoji: "🎤",
            color: "#FF1493",
            songs: [
                Song(title: "SICKO MODE", artist: "Travis Scott", duration: "5:12"),
                Song(title: "God's Plan", artist: "Drake", duration: "3:18"),
                Song(title: "HUMBLE.", artist: "Kendrick Lamar", duration: "2:57"),
                Song(title: "Mo Bamba", artist: "Sheck Wes", duration: "3:03"),
                Song(title: "Suge", artist: "DaBaby", duration: "2:43"),
                Song(title: "ROCKSTAR", artist: "DaBaby ft. Roddy Ricch", duration: "3:01"),
                Song(title: "Bad and Boujee", artist: "Migos ft. Lil Uzi Vert", duration: "5:43"),
                Song(title: "Money Trees", artist: "Kendrick Lamar ft. Jay Rock", duration: "6:26"),
                Song(title: "Going Bad", artist: "Meek Mill ft. Drake", duration: "3:00"),
                Song(title: "Mask Off", artist: "Future", duration: "3:24")
            ]
        ),
        Playlist(
            id: 5,
            name: "Electronic Essentials",
            description: "The best electronic beats and festival anthems.",
            emoji: "⚡️",
            color: "#FFD700",
            songs: [
                Song(title: "Strobe", artist: "deadmau5", duration: "10:33"),
                Song(title: "Titanium", artist: "David Guetta ft. Sia", duration: "4:05"),
                Song(title: "Opus", artist: "Eric Prydz", duration: "9:03"),
                Song(title: "Wake Me Up", artist: "Avicii", duration: "4:09"),
                Song(title: "Lean On", artist: "Major Lazer & DJ Snake ft. MØ", duration: "2:56"),
                Song(title: "Animals", artist: "Martin Garrix", duration: "3:11"),
                Song(title: "Summer", artist: "Calvin Harris", duration: "3:42"),
                Song(title: "Don't You Worry Child", artist: "Swedish House Mafia", duration: "3:32"),
                Song(title: "Levels", artist: "Avicii", duration: "5:37"),
                Song(title: "Clarity", artist: "Zedd ft. Foxes", duration: "4:31")
            ]
        )
    ]
}
