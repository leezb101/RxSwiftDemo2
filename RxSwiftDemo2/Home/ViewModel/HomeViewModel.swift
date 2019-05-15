//
//  HomeViewModel.swift
//  RxSwiftDemo2
//
//  Created by Leezb101 on 2019/5/15.
//  Copyright © 2019 Leezb. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel {
    
    public enum HomeError {
        case netError(String)
        case serverMessage(String)
    }
    
    public let albums = PublishSubject<[Album]>()
    public let tracks = PublishSubject<[Track]>()
    public let loading = PublishSubject<Bool>()
    public let error = PublishSubject<HomeError>()
    
    private let bag = DisposeBag()
    
    
    
}
