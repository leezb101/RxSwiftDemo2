//
//  AlbumViewController.swift
//  RxSwiftDemo2
//
//  Created by Leezb101 on 2019/5/8.
//  Copyright © 2019 Leezb. All rights reserved.
//

import UIKit

class AlbumViewController: UIViewController {

    @IBOutlet weak var albumsCollectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        albumsCollectionView.backgroundColor = .clear
    }
    
    private func setupBinding() {
        albumsCollectionView.register(UINib(nibName: "AlbumsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: String(describing: AlbumsCollectionViewCell.self))
    }

}
