//
//  PhotoListViewController.swift
//  RogaAlbum
//
//  Created by Joao Marcus Dionisio Araujo on 02/05/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import UIKit

class PhotoListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, PhotoViewDelegate{
    

    @IBOutlet weak var collectionView: UICollectionView!
    var idAlbum: Int = 0
    var photos: [PhotoData] = []
    private let photoPresenter = PhotoPresenter(photoService: PhotoService())
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        self.photoPresenter.setViewDelegate(photoViewDelegate: self)
        self.photoPresenter.getPhotoData(idAlbum: self.idAlbum)
        
    }
    
    @IBAction func performBack(_ sender: Any) {
        performSegue(withIdentifier: "backAlbum", sender: self)
    }
    
    func showPhotoData(photos: [PhotoData]) {
        self.photos = photos
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
       
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photos.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photo_cell", for: indexPath) as? PhotoCollectionViewCell{
            let photo = self.photos[indexPath.item]
            cell.setCellData(photo: photo)
            return cell
        }else{
            return PhotoCollectionViewCell()
        }
    }
    

}
