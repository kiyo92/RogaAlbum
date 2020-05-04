//
//  PhotoService.swift
//  RogaAlbum
//
//  Created by Joao Marcus Dionisio Araujo on 02/05/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//


import Foundation
import Alamofire

class PhotoService {
    let photoUrl = "https://jsonplaceholder.typicode.com/albums/"
    
    func getPhotoDataList(idAlbum: Int,result: @escaping (_:[PhotoData]) -> Void){
        var photos : [PhotoData] = []
        AF.request("\(self.photoUrl)\(idAlbum)/photos").responseJSON{
            response in
            
            if let data = response.value{
                if let photosData = data as? [Dictionary<String,Any>]{
                    for photo in photosData{
                        let p = PhotoData(photoData: photo)

                        photos.append(p)
                    }
                    result(photos) 
                }
            }
        }
    }
    
}
