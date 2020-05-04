//
//  AlbumFormAddViewController.swift
//  RogaAlbum
//
//  Created by Joao Marcus Dionisio Araujo on 03/05/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import UIKit

class AlbumFormAddViewController: UIViewController {
    

    @IBOutlet var titleField: CustomTextField!
    
    private let albumPresenter = AlbumPresenter(albumService: AlbumService())
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))

        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    

    @IBAction func registerButton(_ sender: Any) {
        albumPresenter.sendAlbumData(title: titleField.text ?? "")
    }
    
}
