//
//  Album.swift
//  RxSwiftDemo2
//
//  Created by LeeZB on 2019/5/10.
//  Copyright © 2019 Leezb. All rights reserved.
//

import Foundation

struct Album: Codable {
    let id: String
    let name: String
    let albumArtWork: String
    let artist: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case albumArtWork = "album_art_work"
        case artist
    }
}

extension Album {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Album.self, from: data) else { return nil }
        self = me
    }
}
