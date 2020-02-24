//
//  InboxViewController.swift
//  Side Menu Using View
//
//  Created by mac mini on 21/02/20.
//  Copyright © 2020 mac mini. All rights reserved.
//

import UIKit

class InboxViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Inbox"
        setUpBackButton()
        // Do any additional setup after loading the view.
    }
    
    func setUpBackButton() {
        let backButton = UIBarButtonItem(image: #imageLiteral(resourceName: "Radio Sele"), style: .plain, target: self, action: #selector(goToHome))
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func goToHome(){
        navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
