//
//  PhotoCollectionViewCell.swift
//  RogaAlbum
//
//  Created by Joao Marcus Dionisio Araujo on 02/05/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import UIKit
import AlamofireImage
class PhotoCollectionViewCell: UICollectionViewCell {
    
    
    var thumb: UIImageView!
    @IBOutlet var cellCard: CustomCard!
    
    func setCellData (photo: PhotoData){
        thumb = UIImageView();
        let imageURL = URL(string: photo.thumbnailUrl)!
 
        thumb.af.setImage(withURL: imageURL)
        thumb.frame = CGRect(x: 0, y: 0 , width: cellCard.frame.size.width, height: cellCard.frame.size.height)
        cellCard.addSubview(thumb)

        
    }
}
