//
//  ViewController.swift
//  Invio-Bootcamp-Design
//
//  Created by Abdullah Ayan on 28.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sizeExpandButton: UIButton!
    @IBOutlet weak var compositionExpandButton: UIButton!
    
    
    @IBOutlet weak var size1: UIButton!
    @IBOutlet weak var size2: UIButton!
    @IBOutlet weak var size3: UIButton!
    @IBOutlet weak var size4: UIButton!
    @IBOutlet weak var size5: UIButton!
    var sizeStack: [UIButton]!
    
    @IBOutlet weak var compostion1: UIButton!
    @IBOutlet weak var compositon2: UIButton!
    @IBOutlet weak var composition3: UIButton!
    var compositionStack: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Shoes"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: "textColor")!,.font: UIFont(name: "RobotoSlab-Regular", size: 25)!]
        
        
        navigationItem.rightBarButtonItem = navigationBarItemButton(icon: "starSymbol")
        navigationItem.leftBarButtonItem = navigationBarItemButton(icon: "arrowBack")
        
        sizeExpandButton.expandLess()
        compositionExpandButton.expandLess()
        
        sizeStack = [size1,size2,size3,size4,size5]
        compositionStack = [compostion1,compositon2,composition3]
        
        for element in sizeStack + compositionStack {
            element.addShadowAndBorder()
        }
        
    }
    
    
    @IBAction func expendLessTapped(_ sender: UIButton) {
        
        if sender.tag == 1 {
            for size in sizeStack {
                if size.isHidden {
                    size.isHidden = false
                    sender.expandLess()
                } else {
                    size.isHidden = true
                    sender.expandMore()

                }
            }
        }
        if sender.tag == 2 {
            for composition in compositionStack {
                if composition.isHidden {
                    composition.isHidden = false
                    sender.expandLess()
                    
                } else {
                    composition.isHidden = true
                    sender.expandMore()
                }
            }
        }
    }
    
    @IBAction func sizeButtonTapped(_ sender: UIButton) {
        if sender.backgroundColor == .black {
            sender.backgroundColor = UIColor(named: "backgroundColor")
            sender.setTitleColor(UIColor(named: "secondTextColor"), for: .normal)
        }else {
            sender.backgroundColor = .black
            sender.setTitleColor(.white, for: .normal)
        }
    }
    
    
}

extension UIButton {
    func sizeButton() {
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = CGFloat(1)
        self.layer.cornerRadius = 12
    }
    
    func expandLess() {
        self.setTitle("", for: .normal)
        self.setImage(UIImage(named: "expandLess"), for: .normal)
        self.tintColor = UIColor(named: "textColor")
    }
    
    func expandMore() {
        self.setTitle("", for: .normal)
        self.setImage(UIImage(named: "expandMore"), for: .normal)
        self.tintColor = UIColor(named: "textColor")
    }
    
    func addShadowAndBorder() {
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.cornerRadius = 10

        //        self.layer.shadowColor = UIColor.black.cgColor
        //        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        //        self.layer.shadowRadius = 3
        //        self.layer.shadowOpacity = 0.3
    }
    
}


func navigationBarItemButton(icon: String) -> UIBarButtonItem {
    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 25))
    button.setBackgroundImage(UIImage(named: icon), for: .normal)
    button.tintColor = UIColor(named: "textColor")
    
    return UIBarButtonItem(customView: button)
}


