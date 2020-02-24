//
//  ProfileViewController.swift
//  Side Menu Using View
//
//  Created by mac mini on 21/02/20.
//  Copyright © 2020 mac mini. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var colView: UICollectionView!
    
    @IBOutlet weak var colViewComments: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colView.showsHorizontalScrollIndicator = false
        setUpBackButton()
        colView.delegate = self
        colView.dataSource = self
        colViewComments.delegate = self
        colViewComments.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    func setUpBackButton() {
        let backButton = UIBarButtonItem(image: #imageLiteral(resourceName: "Radio Sele"), style: .plain, target: self, action: #selector(goToHome))
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func goToHome(){
        navigationController?.popViewController(animated: true)
    }

    
    func makeTransparentNavBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
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


extension ProfileViewController: UICollectionViewDelegate{
    
}

extension ProfileViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case colView:
            return 5
        case colViewComments:
            return 4
            
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        switch collectionView {
        case colView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionView", for: indexPath) as! CollectionViewCell
               return cell

        default:
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionView1", for: indexPath)
                       return cell
        }
}
        
}
