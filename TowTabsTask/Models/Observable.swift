//
//  Observable.swift
//  TowTabsTask
//
//  Created by Abdulla Alsahli on 29/04/1443 AH.
//

import Foundation


class Observable<T>{
    var value: T?  {
        didSet {
            listeners.forEach {
                $0(value)
            }
        }
    }
    
private var listeners : [((T?) -> Void)] = []
    init(_ value: T?) {
        self.value = value
    }
    func bind(_ listener : @escaping (T?) -> Void){
        listener(value)
        self.listeners.append(listener)
    }
}
