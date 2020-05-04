//
//  Album.swift
//  RogaAlbum
//
//  Created by Joao Marcus Dionisio Araujo on 30/04/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import Foundation
import Alamofire

class AlbumService {
    let albumUrl = "https://jsonplaceholder.typicode.com/albums/"
    var albuns : [AlbumData] = []
    
    func getAlbum(result: @escaping (_:[AlbumData]) -> Void){
        var albuns : [AlbumData] = []
        AF.request(albumUrl).responseJSON{
            response in
            
            if let data = response.value{
                if let albunsData = data as? [Dictionary<String,Any>]{
                    for album in albunsData{
                        let p = AlbumData(albumData: album)
                        
                        
                        albuns.append(p)
                    }
                    print(self.albuns)
                    result(albuns)
                    
                }
            }
        }
    }
    
    func postAlbum(title: String){
        
        let albumData = AlbumData(albumData: ["title":title])
        AF.request(albumUrl,method: .post , parameters: albumData, encoder: JSONParameterEncoder.default).responseJSON{
            response in
            debugPrint(response)
            
        }
    }
    
    func getThumbDataList(id: Int, result: @escaping (_:String) -> Void) {
        var url: String?
        AF.request("\(self.albumUrl)\(id)/photos").responseJSON{
            response in
            if let data = response.value{
                if let photoData = data as? [Dictionary<String,Any>]{
                    url = photoData[0]["url"] as? String
                    
                }
            }
            result(url!)
        }
    }
}
