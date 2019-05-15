//
//  Track.swift
//  RxSwiftDemo2
//
//  Created by Leezb101 on 2019/5/15.
//  Copyright © 2019 Leezb. All rights reserved.
//

import Foundation

struct Track: Codable {
    let id, name, trackArtWork, trackAlbum, artist: String
    
    enum CodingKyes: String, CodingKey {
        case id, name
        case trackArtWork = "track_art_work"
        case trackAlbum = "track_album"
        case artist
    }
    
}

extension Track {
    init?(data: Data) {
        do {
            let me = try JSONDecoder().decode(Track.self, from: data)
            self = me
        } catch  {
            print(error)
            return nil
        }
    }
}
