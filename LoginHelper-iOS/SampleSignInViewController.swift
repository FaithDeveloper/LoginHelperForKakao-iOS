//
//  SingInViewController.swift
//  LoginHelper-iOS
//
//  Created by kchshin on 2018. 10. 24..
//  Copyright © 2018년 kcs. All rights reserved.
//

import UIKit

class SampleSignInViewController: UIViewController{
    
    @IBOutlet weak var btnKakao: DEOKakaoLoginButton!
    @IBAction func kakoAction(_ sender: Any) {
        btnKakao.actionSigninButton(view: self
            , completion: {(error, profile) -> Void in
                if(error != nil){
                    print("error : \(error!)")
                    return
                }
                
                DispatchQueue.main.async(execute: { () -> Void in
                        print("kakao id = \(String(describing: profile.id))")
                        print("kakao displayID = \(String(describing: profile.account?.displayID))")
                        print("kako profileImageURL = \(String(describing: profile.profileImageURL))")
                        print("kako email = \(profile.account?.email ?? "No Email")")
                })
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
