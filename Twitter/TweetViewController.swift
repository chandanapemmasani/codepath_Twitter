//
//  TweetViewController.swift
//  Twitter
//
//  Created by Chandana Pemmasani on 9/29/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    
    
    @IBOutlet weak var tweetView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetView.becomeFirstResponder()

    }
    
    @IBAction func cancelAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tweetAction(_ sender: Any) {
        
        if (!tweetView.text.isEmpty) {
            TwitterAPICaller.client?.postTweet(tweetString: tweetView.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print("error posting tweet \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        }else {
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
}
