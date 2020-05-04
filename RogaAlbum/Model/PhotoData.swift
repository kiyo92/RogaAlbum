//
//  PhotoData.swift
//  RogaAlbum
//
//  Created by Joao Marcus Dionisio Araujo on 02/05/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import Foundation

struct PhotoData: Codable {
    let albumId: Int
    let id : Int
    let title: String
    let url: String
    let thumbnailUrl: String
    
    init(photoData: Dictionary<String,Any>) {
        self.albumId = photoData["albumId"] as? Int ?? 0
        self.id = photoData["id"] as? Int ?? 0
        self.title = photoData["title"] as? String ?? ""
        self.url = photoData["url"] as? String ?? ""
        self.thumbnailUrl = photoData["thumbnailUrl"] as? String ?? ""
    }
}
