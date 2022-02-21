//
//  TweetViewController.swift
//  Twitter
//
//  Created by Luis Morfin on 2/20/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    
    
    @IBOutlet weak var tweetView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //cursor shows up & keyboard
        tweetView.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tweet(_ sender: Any) {
        if(!tweetView.text.isEmpty) {
            TwitterAPICaller.client?.postTweet(tweetString: tweetView.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (Error) in
                print("Error posting tweet...")
                
                self.dismiss(animated: true, completion: nil)
            })
        }  else {
            self.dismiss(animated: true, completion: nil)

        }
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