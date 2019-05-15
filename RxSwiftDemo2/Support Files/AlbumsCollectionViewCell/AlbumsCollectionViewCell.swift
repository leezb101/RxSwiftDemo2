//
//  AlbumsCollectionViewCell.swift
//  RxSwiftDemo2
//
//  Created by LeeZB on 2019/5/10.
//  Copyright © 2019 Leezb. All rights reserved.
//

import UIKit

class AlbumsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var albumTitle: UILabel!
    @IBOutlet weak var albumArtist: UILabel!
    
    var withBackView: Bool! {
        didSet {
            self.backViewGenrator()
        }
    }
    
    private lazy var backView: UIImageView = {
        let result = UIImageView(frame: albumImage.frame)
        result.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(result)
        NSLayoutConstraint.activate([
            result.topAnchor.constraint(equalTo: albumImage.topAnchor, constant: -10),
            result.leadingAnchor.constraint(equalTo: albumImage.leadingAnchor),
            result.trailingAnchor.constraint(equalTo: albumImage.trailingAnchor),
            result.bottomAnchor.constraint(equalTo: albumImage.bottomAnchor)
            ])
        result.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        result.alpha = 0.5
        contentView.bringSubviewToFront(albumImage)
        return result
    }()
    
    public var album: Album! {
        didSet {
            albumImage.loadImage(fromURL: album.albumArtWork)
            albumArtist.text = ""
            albumTitle.text = album.name
        }
    }
    
    private func backViewGenrator() {
        backView.loadImage(fromURL: album.albumArtWork)
    }
    
    override func prepareForReuse() {
        albumImage.image = UIImage()
        backView.image = UIImage()
    }
}
