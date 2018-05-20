//
//  MemeCollectionViewController.swift
//  Meme2.0
//
//  Created by Ion M on 5/18/18.
//  Copyright © 2018 Ion M. All rights reserved.
//

import UIKit

class MemeCollectionViewController: UICollectionViewController {

    var memes: [Meme]!
    
    @IBOutlet var memeCollectionView: UICollectionView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        memeCollectionView.reloadData()
    }
    
    //MARK: CollectionView Delegates
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = memeCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MemeCollectionViewCell
        let meme = memes[indexPath.row]
        
        //Set the image
        cell.memeImageView?.image = meme.memedImage
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {
        let viewMemeVC = storyboard!.instantiateViewController(withIdentifier: "ViewMeme") as! ViewMemeViewController
        viewMemeVC.meme = memes[indexPath.row]
        navigationController!.pushViewController(viewMemeVC, animated: true)
    }
}
