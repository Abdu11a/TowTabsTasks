//
//  APIService.swift
//  TowTabsTask
//
//  Created by Abdulla Alsahli on 29/04/1443 AH.
//

import Foundation
import UIKit
class APIService: NSObject {
    private let sourcesURL = URL(string: "https://pastebin.com/raw/wgkJgazE")!
    
    func getInfo(completion : @escaping ([MainModel]) -> ()) {
        let task = URLSession.shared.dataTask(with: sourcesURL) {  (data, _, _) in
            guard let data = data else {return}
            
            do {
                let usersModels = try JSONDecoder().decode([MainModel].self, from: data)
                completion(usersModels)
            }catch{
                print("error")
            }
            
        }
        task.resume()
    }
    
    
}

