//
//  ViewMemeViewController.swift
//  Meme2.0
//
//  Created by Ion M on 5/18/18.
//  Copyright © 2018 Ion M. All rights reserved.
//

import UIKit

class ViewMemeViewController: UIViewController {

    @IBOutlet weak var memeImage: UIImageView!
    
    var meme: Meme!
    var didEdit: Bool!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tabBarController?.tabBar.isHidden = true
        
        if didEdit {
            didEdit = false
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memeImage.image = meme.memedImage
        didEdit = false
    }
    
    @IBAction func editButtonPressed(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let memeVC = mainStoryboard.instantiateViewController(withIdentifier: "MemeVC") as! MemeViewController
        
        memeVC.memeToBeEdited = meme
        memeVC.isEditMode = true
        
        navigationController?.present(memeVC, animated: true, completion:nil)
        
        didEdit = true
    }
}
