//
//  ArtistAlbums.swift
//  music_new
//
//  Created by BenD on 1/20/22.
//

import Foundation

struct ArtistAlbums: Decodable{
    let name: String
    let albums: [String]
}
