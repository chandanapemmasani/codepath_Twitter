//
//  TweetTableViewCell.swift
//  Twitter
//
//  Created by Chandana Pemmasani on 9/23/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {

    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var tweetContent: UILabel!
    
    @IBOutlet weak var retweetBtn: UIButton!
     
    @IBOutlet weak var favBtn: UIButton!
    
    var favorited: Bool = false
    var tweetID: Int = -1
    var reTweeted: Bool = false
    
    func setFavorite(_ isFavorited: Bool) {
        favorited = isFavorited
        if (favorited) {
            favBtn.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else {
            favBtn.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func retweetAction(_ sender: Any) {
        TwitterAPICaller.client?.reTweet(tweetID: tweetID, success: {
            self.setRetweeted(true)
        }, failure: {(error) in
            print("error in retweeting: \(error)")
        })
        
        
    }
    
    func setRetweeted(_ isRetweeted: Bool) {
        if(isRetweeted) {
            retweetBtn.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetBtn.isEnabled = false
        } else {
            retweetBtn.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetBtn.isEnabled = true
        }
    }
    @IBAction func actionFavTweet(_ sender: Any) {
        
        let tobefavorited = !favorited
        if (tobefavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetID: tweetID, success: {
                self.setFavorite(true)
            }, failure: { (error) in
                print("favourite did not work \(error)")
            })
            
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetID: tweetID, success: {
                self.setFavorite(false)
            }, failure: { (error) in
                
                print("unfavorite did not succeed \(error)")
            })
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
