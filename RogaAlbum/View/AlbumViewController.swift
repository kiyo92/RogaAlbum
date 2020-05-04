//
//  ViewController.swift
//  RogaAlbum
//
//  Created by Joao Marcus Dionisio Araujo on 29/04/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import UIKit
import MaterialComponents
import MaterialComponents.MaterialTextFields
import Alamofire
class AlbumViewController: UIViewController, AlbumViewDelegate, ThumbViewDelegate {
    
    private let albumPresenter = AlbumPresenter(albumService: AlbumService())
    
    @IBOutlet weak var cardAlbum: CustomCard!
    
    @IBOutlet weak var addAlbum: CustomButton!
    
    @IBOutlet weak var stackView: UIStackView!
    
    var albuns: [AlbumData] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.stackView.sizeToFit()
        
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.albumPresenter.setViewDelegate(albumViewDelegate: self)
        self.albumPresenter.setThumbViewDelegate(thumbViewDelegate: self)
        self.albumPresenter.getAlbumData()

    }
    
    @IBAction func addAlbumPressed(_ sender: Any) {
         performSegue(withIdentifier: "addAlbum", sender: self)
        
    }
    
    func createCard(title: String, imgURL: String, albumId: Int){
        let cardI = { () -> CustomCard in
            let view = CustomCard(frame: stackView.frame, coverURL: imgURL)
            view.heightAnchor.constraint(equalToConstant:150).isActive = true

            return view
        }()
        cardI.albumId = albumId
       
        
        let myLabel = UILabel()
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.text = title
        myLabel.textAlignment = .center
        myLabel.backgroundColor = .lightGray

        cardI.addSubview(myLabel)
        cardI.addTarget(self, action: #selector(self.thumbClicked(_:)), for: .touchUpInside)

        self.stackView.addArrangedSubview(cardI)
        
    }
    
    
    
    func showAlbumData(album: [AlbumData]) {
        albuns = album
        for a in album{
            self.albumPresenter.getThumbData(album: a)
            
        }
    }
    func showThumbData(album: AlbumData) {
        
        createCard(title: album.title, imgURL: album.thumbURL!, albumId: album.id)
    }
    
    @objc func thumbClicked(_ sender: Any) {
        let idAlbum : Int = (sender as! CustomCard).albumId ?? -1
        
        performSegue(withIdentifier: "showPhotos", sender: idAlbum)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhotos"{
            if let destination = segue.destination as? PhotoListViewController{
                if let idAlbum = sender as? Int{
                    destination.idAlbum = idAlbum
                }
            }
        }
    }
    
}

