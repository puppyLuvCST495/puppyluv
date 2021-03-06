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
    
    let myRefreshControl = UIRefreshControl()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var rows = [PFObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        myRefreshControl.addTarget(self, action: #selector(updateCollectionView), for: .valueChanged)
        collectionView.refreshControl = myRefreshControl
        
        

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
    
    @objc func updateCollectionView(){
        let query = PFQuery(className: "LikedByUser")
        query.whereKey("userLiked", equalTo: PFUser.current()!)
        query.includeKeys(["post"])
        query.limit = 20
        
        query.findObjectsInBackground { (dbRows, error) in
            if dbRows != nil {
                print("YES")
                self.rows = dbRows!
                self.collectionView.reloadData()
            }else{
                print("NO")
            }
            
        }
        self.collectionView.reloadData()
        self.myRefreshControl.endRefreshing()
    }
    

    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rows.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavorCell", for: indexPath) as! FavorCell
        let postItem = rows[indexPath.item]["post"] as? PFObject
        let postImage = postItem?["image"] as! PFFileObject
        
        let urlString = postImage.url!
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
