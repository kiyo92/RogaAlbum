//
//  AlbumData.swift
//  RogaAlbum
//
//  Created by Joao Marcus Dionisio Araujo on 30/04/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import Foundation
struct AlbumData: Codable {
    let userId: Int
    let id: Int
    let title: String
    
    var thumbURL: String?
    
    init(albumData: Dictionary<String,Any>) {
        self.userId = albumData["userId"] as? Int ?? 0
        self.id = albumData["id"] as? Int ?? 0
        self.title = albumData["title"] as? String ?? ""
    }
    
    mutating func setThumbUrl(thumbURL: String) {
        self.thumbURL = thumbURL
    }
}
