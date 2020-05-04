//
//  HomePresenter.swift
//  RogaAlbum
//
//  Created by Joao Marcus Dionisio Araujo on 30/04/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import Foundation

protocol AlbumViewDelegate:NSObjectProtocol {
    func showAlbumData(album : [AlbumData])
    
    
}
protocol ThumbViewDelegate:NSObjectProtocol {
    func showThumbData(album : AlbumData)
    
}

class AlbumPresenter {
    
    let albumService : AlbumService
    weak var albumViewDelegate : AlbumViewDelegate?
    weak var thumbViewDelegate : ThumbViewDelegate?
    var album : [AlbumData] = []
    init(albumService: AlbumService) {
        self.albumService = albumService
    }
    
    func setViewDelegate (albumViewDelegate : AlbumViewDelegate?){
        self.albumViewDelegate = albumViewDelegate
    }

    func setThumbViewDelegate (thumbViewDelegate : ThumbViewDelegate?){
        self.thumbViewDelegate = thumbViewDelegate
    }
    
    func getAlbumData(){
        
        albumService.getAlbum() {result in
            
            self.album = result
            self.albumViewDelegate?.showAlbumData(album: self.album)

        }
    }
    func sendAlbumData(title: String){
        albumService.postAlbum(title: title)
    }
    
    func getThumbData(album: AlbumData){
        albumService.getThumbDataList(id: album.id){result in
            
            var alb:AlbumData = album
            
            alb.setThumbUrl(thumbURL: result)
            self.thumbViewDelegate?.showThumbData(album: alb)
        } 
        
    }
    
    
}
