//
//  CustomButton.swift
//  RogaAlbum
//
//  Created by Joao Marcus Dionisio Araujo on 29/04/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import UIKit
import MaterialComponents


class CustomButtonDefault: MDCButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.blue
        self.layer.cornerRadius = 6
        
        
    }
}

class CustomButton: MDCFloatingButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.systemBlue
        
    }

}
