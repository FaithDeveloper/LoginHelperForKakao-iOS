//
//  SingInViewController.swift
//  LoginHelper-iOS
//
//  Created by kchshin on 2018. 10. 24..
//  Copyright © 2018년 kcs. All rights reserved.
//

import UIKit

class SampleSignInViewController: UIViewController{
    //-------------------------------------------------------------------------------------------
    // MARK: - IBOutlets
    //-------------------------------------------------------------------------------------------
    @IBOutlet weak var btnKakao: KKakaoLoginButton!
    
    //-------------------------------------------------------------------------------------------
    // MARK: - IBAction
    //-------------------------------------------------------------------------------------------
    @IBAction func kakoAction(_ sender: Any) {
        btnKakao.actionSigninButton(view: self
            , completion: {(profile, error) -> Void in
                if(error != nil){
                    print("error : \(error!)")
                    return
                }
                
                guard profile != nil else {
                    return
                }
                
                DispatchQueue.main.async(execute: { () -> Void in
                    print("Kakao Email = \(String(describing: profile!.email))")
                    if let nickName = profile!.property(forKey: KOUserNicknamePropertyKey) as? String{
                        print("Kakao Nick Name = \(nickName)")
                    }
                    if let profileImage = profile!.property(forKey: KOUserProfileImagePropertyKey) as? String{
                        print("Kakao Profile Image = \(profileImage)")
                    }
                })
        })
    }
    
    //-------------------------------------------------------------------------------------------
    // MARK: - override method
    //-------------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
