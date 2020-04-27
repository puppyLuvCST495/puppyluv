//
//  FavorViewController.swift
//  PuppyLuv
//
//  Created by Pernille Dahl on 4/24/20.
//  Copyright © 2020 Athena Enosara. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage

class FavorViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var posts = [PFObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        

    }
    
    
    override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
           self.updateCollectionView()
            let numberOfCellsPerRow: CGFloat = 4
            if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
                let horizontalSpacing = flowLayout.scrollDirection == .vertical ? flowLayout.minimumInteritemSpacing : flowLayout.minimumLineSpacing
                let cellWidth = (view.frame.width - max(0, numberOfCellsPerRow - 1)*horizontalSpacing)/numberOfCellsPerRow
                flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
            }
       }
    
    func updateCollectionView(){
        
        let currentUser = PFUser.current()
        
        let query = PFQuery(className: "LikedDogs")
        query.whereKey("user", equalTo: currentUser as Any)
        query.whereKey("liked", equalTo: true)
        query.includeKeys(["image", "liked"])
        
    
        query.limit = 20

        query.findObjectsInBackground { (posts, error) in
            if posts != nil {
                print("YES")
                self.posts = posts!
                self.collectionView.reloadData()
            }else{
                print("NO")
            }

        }
        self.collectionView.reloadData()
    }
    

    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavorCell", for: indexPath) as! FavorCell
        
    
        let post = posts[indexPath.item]
        let imageFile = post["image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        
        
        cell.dogImageView.af_setImage(withURL: url)
        
        return cell
    }
    
  
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = collectionView.bounds.width/4.0
        let yourHeight = yourWidth

        return CGSize(width: yourWidth, height: yourHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}
