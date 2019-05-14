//
//  TracksTableViewCell.swift
//  RxSwiftDemo2
//
//  Created by LeeZB on 2019/5/10.
//  Copyright © 2019 Leezb. All rights reserved.
//

import UIKit

class TracksTableViewCell: UITableViewCell {

    @IBOutlet weak var trackImage: UIImageView!
    @IBOutlet weak var trackTitle: UILabel!
    @IBOutlet weak var trackArtist: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
    }

    override func prepareForReuse() {
        trackImage.image = UIImage()
    }
    
}
