//
//  AnimateLoadingView.swift
//  RxSwiftDemo2
//
//  Created by Leezb101 on 2019/5/16.
//  Copyright © 2019 Leezb. All rights reserved.
//

import UIKit

class AnimateLoadingView: UIView {

    public var color: UIColor = UIColor.white
    public var isAnimating: Bool = false
    
    public final func startAnimating() {
        isHidden = false
        layer.speed = 1
        setupAnimation(in: layer, size: self.frame.size, color: color)
    }
    
    public final func stopAnimating() {
        if isAnimating == false {
            return
        }
        isHidden = true
        layer.sublayers?.removeAll()
        isAnimating = false
    }
    
    
    func setupAnimation(in layer: CALayer, size: CGSize, color: UIColor) {
        let beginTime: Double = 0.5
        let strokeStartDuration: Double  = 1.5
        let strokeEndDuration: Double = 1.1
        
        let rotationAnimation = CABasicAnimation(keyPath: "transfrom.rotation")
        rotationAnimation.byValue = Float.pi * 2
        rotationAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        
        let strokeEndAnimation = CABasicAnimation(keyPath: "stokeEnd")
        strokeEndAnimation.duration = strokeEndDuration
        strokeEndAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.4, 0.0, 0.2, 1.0)
        strokeEndAnimation.fromValue = 0
        strokeEndAnimation.toValue = 1
        
        let strokeStartAnimation = CABasicAnimation(keyPath: "strokeStart")
        strokeStartAnimation.duration = strokeStartDuration
        strokeStartAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.4, 0.0, 0.2, 1.0)
        strokeStartAnimation.fromValue = 0
        strokeStartAnimation.toValue = 1
        strokeStartAnimation.beginTime = beginTime
        
        let group = CAAnimationGroup()
        group.animations = [rotationAnimation, strokeEndAnimation, strokeStartAnimation]
        group.duration = strokeStartDuration + beginTime
        group.repeatCount = .infinity
        group.isRemovedOnCompletion = false
        group.fillMode = .forwards
        
        let circle = circleLayer(size: size, color: color)
        let frame = CGRect(x: (layer.bounds.width - size.width) / 2, y: (layer.bounds.height - size.height) / 2, width: size.width, height: size.height)
        
        circle.frame = frame
        circle.add(group, forKey: "animation")
        layer.addSublayer(circle)
        isAnimating = true
    }
    
    func circleLayer(size: CGSize, color: UIColor) -> CALayer {
        let layer = CAShapeLayer()
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2), radius: size.width / 2, startAngle: -(.pi / 2), endAngle: .pi + .pi / 2, clockwise: true)
        layer.fillColor = nil
        layer.strokeColor = color.cgColor
        layer.lineWidth = 2
        
        layer.backgroundColor = nil
        layer.path = path.cgPath
        layer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        return layer
    }

}
