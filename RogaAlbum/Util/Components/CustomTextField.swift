//
//  CustomTextFieldViewController.swift
//  RogaAlbum
//
//  Created by Joao Marcus Dionisio Araujo on 29/04/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import UIKit
import Material
class CustomTextField: TextField {
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let padding = UIEdgeInsets(top: 15, left: 10, bottom: 0, right: 0)
        //self.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.textInsets = padding
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 6
        
        
        
    }


}
