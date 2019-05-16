//
//  LoadingView.swift
//  RxSwiftDemo2
//
//  Created by LeeZB on 2019/5/16.
//  Copyright © 2019 Leezb. All rights reserved.
//

import UIKit

class LoadingView: UIView {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var animateView: AnimateLoadingView!
    
    public var loadingViewMessage: String! {
        didSet {
            messageLabel.text = loadingViewMessage
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    private func commonInit() {
        self.addBlurAreaForLoading(area: self.bounds, style: .dark)
        self.bringSubviewToFront(messageLabel)
    }
    
    public func startAnimation() {
        if animateView.isAnimating {
            return
        }
        animateView.startAnimating()
    }
    
    public func stopAnimation() {
        animateView.stopAnimating()
    }
    
}

extension UIView {
    func addBlurAreaForLoading(area: CGRect, style: UIBlurEffect.Style) {
        let effect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: effect)
        let container = UIView(frame: area)
        blurView.frame = CGRect(x: 0, y: 0, width: area.width, height: area.height)
        container.addSubview(blurView)
        self.insertSubview(container, at: 1)
    }
}
