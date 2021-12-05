//
//  StringExtension.swift
//  TowTabsTask
//
//  Created by Abdulla Alsahli on 01/05/1443 AH.
//

import Foundation
extension String {
    
    
    func isValdiateDate() -> Bool {
         let formatter = DateFormatter()
        formatter.dateFormat = "h:mm:ssa"
        if formatter.date(from: self) != nil {
            return true
        }else{
            return false
        }
    }
    
    func ConvertDate() -> String {
         let formatter = DateFormatter()
        formatter.dateFormat = "h:mm:ssa"
        guard let date = formatter.date(from: self) else {return " "}
        formatter.dateFormat = "HH:mm:ss"
        let time = formatter.string(from: date)
        return time
    }
    
}
