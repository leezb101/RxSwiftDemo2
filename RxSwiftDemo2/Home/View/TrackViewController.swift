//
//  TrackViewController.swift
//  RxSwiftDemo2
//
//  Created by Leezb101 on 2019/5/8.
//  Copyright © 2019 Leezb. All rights reserved.
//

import UIKit

class TrackViewController: UIViewController {

    @IBOutlet weak var tracksTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func setupBinding() {
        tracksTableView.register(UINib(nibName: "TracksTableViewCell", bundle: nil), forCellReuseIdentifier: String(describing: TracksTableViewCell.self))
    }

}
