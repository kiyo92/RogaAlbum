//
//  CustomCard.swift
//  RogaAlbum
//
//  Created by Joao Marcus Dionisio Araujo on 30/04/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import UIKit
import MaterialComponents
class CustomCard: MDCCard {

    var albumId : Int?
    init(frame: CGRect, coverURL: String) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.blue

        let thumb = UIImageView();
        thumb.af.setImage(withURL: URL(string: coverURL)!)
        thumb.frame = CGRect(x: 0, y: 0 , width: self.frame.size.width, height: 150)
        self.addSubview(thumb)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
     super.init(coder: aDecoder)
     self.backgroundColor = UIColor.blue
    
    }

}
