//
//  PhotoPresenter.swift
//  RogaAlbum
//
//  Created by Joao Marcus Dionisio Araujo on 02/05/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import Foundation
protocol PhotoViewDelegate:NSObjectProtocol {
    func showPhotoData(photos : [PhotoData])
    
}


class PhotoPresenter {
    
    let photoService : PhotoService
    weak var photoViewDelegate : PhotoViewDelegate?
    var photos : [PhotoData] = []
    init(photoService: PhotoService) {
        self.photoService = photoService
    }
    
    func setViewDelegate (photoViewDelegate : PhotoViewDelegate?){
        self.photoViewDelegate = photoViewDelegate
    }
    
    func getPhotoData(idAlbum: Int){
        
        photoService.getPhotoDataList(idAlbum: idAlbum) {result in
            
            self.photos = result
            self.photoViewDelegate?.showPhotoData(photos: self.photos)

        }
    }
}

