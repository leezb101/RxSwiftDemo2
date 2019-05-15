//
//  ReactiveExtensions.swift
//  RxSwiftDemo2
//
//  Created by Leezb101 on 2019/5/15.
//  Copyright © 2019 Leezb. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UIViewController {
    public var isAnimating: Binder<Bool> {
        return Binder(self.base, binding: { (vc, active) in
            if active {
                
            } else {
                
            }
        })
    }
}
