//
//  ViewController.swift
//  Side Menu Using View
//
//  Created by mac mini on 21/02/20.
//  Copyright © 2020 mac mini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var menuVisible = false
    var gesture: UIGestureRecognizer?
   @IBOutlet weak var imgProfile: UIImageView!
        
    @IBOutlet weak var imgBackground: UIImageView!
    @IBOutlet weak var constraintSideMenu: NSLayoutConstraint!
    @IBOutlet weak var constraintMenu: NSLayoutConstraint!
    @IBOutlet weak var tblMenuOptions: UITableView!
        let optionArray = ["History", "Inbox" , "Account"]
        override func viewDidLoad() {
            super.viewDidLoad()
            
            let textChangeColor = [NSAttributedString.Key.foregroundColor:UIColor.white]
            navigationController?.navigationBar.titleTextAttributes = textChangeColor
            title = "Home"
            
            makeTransparentNavBar()
            // Do any additional setup after loading the view.
            tblMenuOptions.delegate = self
            tblMenuOptions.dataSource = self
            
            
            self.imgProfile.layer.cornerRadius = self.imgProfile.frame.size.width / 2;
            self.imgProfile.clipsToBounds = true ;
            imgProfile.layer.borderWidth = 1
            imgProfile.layer.borderColor = UIColor.white.cgColor
            
            
            
           // NotificationCenter.default.addObserver(self,
                                                //   selector: #selector(showHideMenu(_:)), name: NSNotification.Name("ToggleSideMenu"), object: nil)
            


            gesture = UITapGestureRecognizer(target: self, action: #selector(showHideMenu(_:)))

        }

    @IBAction func showHideMenu(_ sender: Any) {
        
        print("gesture")
        if !menuVisible {
            constraintSideMenu.constant = 0
            menuVisible = true
            self.imgBackground.addGestureRecognizer(gesture!)
            imgBackground.isUserInteractionEnabled = true
            print("gesture added")
            
        } else {
            constraintSideMenu.constant = -320
            menuVisible = false
            self.imgBackground.removeGestureRecognizer(gesture!)
            print("gesture removed ")
        }
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }) { (animationComplete) in
            print("The animation is complete!")
        }
    }
    
    func makeTransparentNavBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
    }
    @IBAction func goToProfile(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "ProfileViewController") as! ProfileViewController
        showHideMenu(false)
        navigationController?.pushViewController(vc , animated: true)
    }
}

    extension ViewController: UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return optionArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell") as! SideMenuCell
            cell.lblOption.text = optionArray[indexPath.row]
            return cell
        }
        
        
    }


    extension ViewController: UITableViewDelegate{
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

            switch indexPath.row {
            case 0:

               print("history")
               let vc = storyboard?.instantiateViewController(identifier: "HistoryViewController") as! HistoryViewController
               showHideMenu(false)
               navigationController?.pushViewController(vc , animated: true)

            case 1:
             
                print("Inbox")
                let vc = storyboard?.instantiateViewController(identifier: "InboxViewController") as! InboxViewController
                showHideMenu(false)
                navigationController?.pushViewController(vc , animated: true)

            case 2:
            
                print("Account")
                let vc = storyboard?.instantiateViewController(identifier: "AccountViewController") as! AccountViewController
                showHideMenu(false)
                navigationController?.pushViewController(vc , animated: true)

            default:
                break
            }
        
        }
}

