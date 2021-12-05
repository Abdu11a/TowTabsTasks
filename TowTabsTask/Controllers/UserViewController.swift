//
//  ViewController.swift
//  TowTabsTask
//
//  Created by Abdulla Alsahli on 29/04/1443 AH.
//

import UIKit

class UserViewController: UIViewController {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private var viewModel = UserListViewModel()
    
    private var apiService : APIService!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.apiService =  APIService()
        setUpView()
    }
    fileprivate func setUpView(){
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        
        viewModel.users.bind { [weak self]_ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        self.apiService.getInfo{ (usersModels) in
            self.viewModel.users.value = usersModels.compactMap({
                UserTableViewCellViewModel(user: $0.user)
            })
        }
    }
    

}

extension UserViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath)
        cell.textLabel?.text = viewModel.users.value?[indexPath.row].user?.name
        let imgStr = viewModel.users.value?[indexPath.row].user?.profileImage?.medium ?? ""
         let imageUrl = URL(string:imgStr)!
        do {
            let data = try Data(contentsOf: imageUrl)
            cell.imageView?.image = UIImage(data: data)
        }
        catch{
            print(error)
        }
        return cell
    }
    
    
}
