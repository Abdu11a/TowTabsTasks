//
//  TabBarController.swift
//  TowTabsTask
//
//  Created by Abdulla Alsahli on 29/04/1443 AH.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [setUpUsersVC() , setUpDateVC()]
    }
    
    func setUpUsersVC()-> UINavigationController{
        let vc = UserViewController()
         let nc = UINavigationController(rootViewController: vc)
        vc.tabBarItem = UITabBarItem(title: "Users", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person"))
        vc.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 2)
        
        vc.title = "Users"
        
        return nc
    }
    
    func setUpDateVC()-> UINavigationController{
        let vc = DateViewController()
         let nc = UINavigationController(rootViewController: vc)
        vc.tabBarItem = UITabBarItem(title: "Date Converter", image: UIImage(systemName: "clock"), selectedImage: UIImage(systemName: "clock"))
        vc.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 2)
        
        vc.title = "Date Converter"
        
        return nc
    }

}
