//
//  Billboard.swift
//  ParsingJSONExercises
//
//  Created by C4Q on 11/14/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation
class Billboard {
    var songId: Int
    var songName: String
    var artistId: Int
    var artistName: String
    var spotifyId: String
    init(songId:Int, songName:String, artistId: Int, artistName: String, spotifyId: String) {
        self.songId = songId
        self.songName = songName
        self.artistId = artistId
        self.artistName = artistName
        self.spotifyId = spotifyId
    }
    convenience init?(from jsonDict: [String: Any]){
        let songId: Int = jsonDict["song_id"] as? Int ?? 0
        let songName: String = jsonDict["song_name"] as? String ?? "Unknown Song"
        let artistId: Int = jsonDict["artist_id"] as? Int ?? 0
        let artistName: String = jsonDict["display_artist"] as? String ?? "Unknown Artist"
        let spotifyId: String = jsonDict["spotify_id"] as? String ?? "Uknown Spotify Id"
        self.init(songId: songId, songName: songName, artistId: artistId, artistName: artistName, spotifyId: spotifyId)
    }
    static func getBillboardData(from data: Data) -> [Billboard] {
        var billboardSongs = [Billboard]()
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            guard let songArr = json as? [[String: Any]] else {return []}
            for song in songArr {
                if let newSong = Billboard(from: song) {
                    billboardSongs.append(newSong)
                }
            }
        } catch {
            print("Error")
        }
        //TODO:
        return billboardSongs
    }
    
    
}
