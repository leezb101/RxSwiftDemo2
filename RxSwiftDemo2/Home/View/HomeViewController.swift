//
//  HomeViewController.swift
//  RxSwiftDemo2
//
//  Created by Leezb101 on 2019/5/8.
//  Copyright © 2019 Leezb. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {

    @IBOutlet weak var albumsVCView: UIView!
    
    @IBOutlet weak var tracksVCView: UIView!
    
    private lazy var albumsViewController: AlbumViewController = {
        let storyboard = UIStoryboard(name: "Home", bundle: Bundle.main)
        var viewcontroller = storyboard.instantiateViewController(withIdentifier: "AlbumViewController") as! AlbumViewController
        self.add(asChildViewController: viewcontroller, to: self.albumsVCView)
        return viewcontroller
    }()
    
    private lazy var tracksViewController: TrackViewController = {
        let storyboard = UIStoryboard(name: "Home", bundle: Bundle.main)
        let viewcontroller = storyboard.instantiateViewController(withIdentifier: "TrackViewController") as! TrackViewController
        add(asChildViewController: viewcontroller, to: self.tracksVCView)
        return viewcontroller
    }()
    
    var homeViewModel: HomeViewModel = HomeViewModel()
    
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addBlurArea(area: self.view.frame, style: .dark)
        
        
    }
    
    private func setupBindings() {
        
    }
   
}
