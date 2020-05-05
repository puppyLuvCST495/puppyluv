//
//  FeedViewController.swift
//  PuppyLuv
//
//  Created by Pernille Dahl on 4/13/20.
//  Copyright © 2020 Athena Enosara. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage
import MessageInputBar

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MessageInputBarDelegate {
    
    let myRefreshControl = UIRefreshControl()
    
    @IBOutlet weak var tableView: UITableView!
    
    var objectID:String = ""
    
    let commentBar = MessageInputBar()
    var showCommentBar = false
    var posts = [PFObject]()
    var selectedPost: PFObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commentBar.inputTextView.placeholder = "Add a comment..."
        commentBar.sendButton.title = "Post"
        commentBar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.keyboardDismissMode = .interactive
        
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(keyboardWillBeHidden(note:)), name: UIResponder.keyboardWillHideNotification, object: nil)
       
        
        myRefreshControl.addTarget(self, action: #selector(updateTableView), for: .valueChanged)
        tableView.refreshControl = myRefreshControl
        
    }
        
    
    @objc func keyboardWillBeHidden(note: Notification) {
        commentBar.inputTextView.text = nil
        showCommentBar = false
        becomeFirstResponder()
    }
    
    override var inputAccessoryView: UIView? {
        return commentBar
    }
    
    override var canBecomeFirstResponder: Bool {
        return showCommentBar
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.updateTableView()
        
//        let query = PFQuery(className: "LikedByUser")
//        query.whereKey("userLiked", equalTo: PFUser.current() as Any)
//        query.includeKeys(["userLiked", "post", "liked"])
//
//        query.findObjectsInBackground { (likedPostByUser, error) in
//            if likedPostByUser != nil {
//                self.tableView.reloadData()
//            }
//        }
        
        
    }
    
    @objc func updateTableView(){
           let query = PFQuery(className: "DogFeed")
           query.includeKeys(["user", "comments", "comments.user"])
           query.limit = 20
           
           query.findObjectsInBackground { (posts, error) in
               if posts != nil {
                   self.posts = posts!
                   self.tableView.reloadData()
               }
           }
           self.tableView.reloadData()
           self.myRefreshControl.endRefreshing()
           
       }
    
    
    
    
    func messageInputBar(_ inputBar: MessageInputBar, didPressSendButtonWith text: String) {
           // create the comment
        
        let comment = PFObject(className: "Comments")
           comment["text"] = text
           comment["post"] = selectedPost
           comment["user"] = PFUser.current()!
   
           selectedPost.add(comment, forKey: "comments")
   
           selectedPost.saveInBackground { (success, error) in
               if success {
                   print("comment saved")
               }else{
                   print("error saving comment")
               }
           }
        tableView.reloadData()
           
           
           // clear and dismiss input bar
           commentBar.inputTextView.text = nil
           
           showCommentBar = false
           becomeFirstResponder()
           commentBar.inputTextView.resignFirstResponder()
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let post = posts[section]
        let comments = (post["comments"] as? [PFObject]) ?? []
        
        return comments.count + 2
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return posts.count
    }
    


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let post = posts[indexPath.section]
        let comments = (post["comments"] as? [PFObject]) ?? []
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DogFeedCell") as! DogFeedCell
            
            let user = post["user"] as! PFUser
            cell.usernameLabel.text = user.username
            cell.captionLabel.text = post["caption"] as? String
            
            let likeByUserRecord = PFQuery(className: "LikedByUser")
            likeByUserRecord
                .whereKey("userLiked" , equalTo: PFUser.current())
                .whereKey("post", equalTo: post)
                .getFirstObjectInBackground {
                    (obj,error) in
                    if obj == nil {
                        cell.likeButton.setImage(UIImage(named: "notfilledP"), for: UIControl.State.normal)
                    } else {
                        cell.likeButton.setImage(UIImage(named: "filledP"), for: UIControl.State.normal)
                    }
            }
                
            let imageFile = post["image"] as! PFFileObject
            let urlString = imageFile.url!
            let url = URL(string: urlString)!
            print(url)
            cell.photoView.af_setImage(withURL: url)
            
            return cell
            
        }else if indexPath.row <= comments.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell") as! CommentCell
            
            let comment = comments[indexPath.row - 1]
            cell.commentLabel.text = comment["text"] as? String
            
            let user = comment["user"] as! PFUser
            cell.nameLabel.text = user.username
            
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddCommentCell")!
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // UI
        let post = posts[indexPath.section]
        let cell = tableView.cellForRow(at: indexPath) as? DogFeedCell
        cell?.heartClicked();
        
        
        let comment = (post["comments"] as? [PFObject]) ?? []
       
        let likeByUserRecord = PFQuery(className: "LikedByUser")
        likeByUserRecord
            .whereKey("userLiked" , equalTo: PFUser.current())
            .whereKey("post", equalTo: post)
            .getFirstObjectInBackground {
                (obj,error) in
                if obj == nil {
                    self.addToDb(post)
                } else {
                    obj?.deleteInBackground()
                }
        }
        
        if indexPath.row == comment.count + 1 {
            showCommentBar = true
            becomeFirstResponder()
            commentBar.inputTextView.becomeFirstResponder()
            selectedPost = post
        }
        
    }
    
    func addToDb(_ post:PFObject){
        let likedByUser = PFObject(className: "LikedByUser")
        likedByUser["userLiked"] = PFUser.current()
        likedByUser["post"] = post
        post.add(likedByUser, forKey: "likedbyuser")
        post.saveInBackground {(success, error) in
            if success {
                print("Sucess saving liked user")
            }else {
                print("Error saving liked user")
            }
        }
    }

}
