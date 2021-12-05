//
//  DateViewController.swift
//  TowTabsTask
//
//  Created by Abdulla Alsahli on 29/04/1443 AH.
//

import UIKit

class DateViewController: UIViewController {

    let textField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Pleas Enter time in 12-hour format.."
        textField.backgroundColor = .lightGray
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 2
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let resultLebel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24)
        label.text = "ANSWERS"
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .right
        return label
    }()
    
    let convertBtn : UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.titleLabel?.textColor = .white
        button.setTitle("Convert", for: .normal)
        button.sizeToFit()
        button.addTarget(self, action: #selector(convertBtnAction), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpView()
    }
    
    fileprivate func setUpView(){
        let stackView            = UIStackView(arrangedSubviews: [textField ,convertBtn, resultLebel])
        stackView.axis          = .vertical
        stackView.distribution  = .fillProportionally
        stackView.alignment     = .center
        stackView.spacing       = 30
        stackView.frame.size = CGSize(width: 100, height: 100)
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints                                          = false
        
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor ).isActive               = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive                = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor , constant: 20).isActive                = true
    }
    
    @objc func convertBtnAction(sender : UIButton){
        if textField.text!.isEmpty || textField.text == "" || textField.text!.isValdiateDate() == false{
            textField.layer.borderColor = UIColor.red.cgColor
            textField.layer.borderWidth = 2
            resultLebel.text = " "
            }
        
        if !textField.text!.isEmpty{
        guard let text = textField.text  else {return}
            textField.layer.borderColor = UIColor.green.cgColor
            print(text.isValdiateDate())
            if text.isValdiateDate() == true {
            resultLebel.text = text.ConvertDate()
            }else {
                resultLebel.text = " "
                textField.layer.borderColor = UIColor.red.cgColor
           }
        }
        
    }

}
