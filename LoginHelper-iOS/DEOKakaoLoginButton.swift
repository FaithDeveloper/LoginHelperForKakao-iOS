//
//  LHKakaoLoginButton.swift
//  LoginHelper-iOS
//
//  Created by kchshin on 2018. 10. 24..
//  Copyright © 2018년 kcs. All rights reserved.
//

import UIKit

class DEOKakaoLoginButton : KOLoginButton{
    
    /// 카카오 로그인 버튼 클릭 이벤트 처리
    /// - Detail : 카카오 로그인 버튼 클릭 시 profile 정보를 넘겨줍니다.
    /// - Parameters:
    ///   - view: 카카오 로그인 화면이 추가될 rootView
    ///   - handler: 카카오 로그인 후 넘어오는 정보
//    func actionSigninButton(view: UIViewController, completion handler: @escaping KOSessionTaskUserMeCompletionHandler){
//        let session : KOSession = KOSession.shared()
//
//        if session.isOpen(){
//            session.close()
//        }
//
//        session.presentingViewController = view
//        session.open(completionHandler: { (error) in
//            session.presentingViewController = nil;
//            //, authType: KOAuthType.talk, nil
//            // 카카오 로그인 화면에서 벋어날 시 호출.
//            if error != nil {
//                print("Kakao login Error Massage : \(error?.localizedDescription ?? "")")
//            }else if session.isOpen(){
//                KOSessionTask.userMeTask(completion: handler)
//            }else{
//                print("Kakao login Error Massage : isn't open")
//            }
//        })
//    }
    
    func actionSigninButton(view: UIViewController, completion handler: @escaping (Error?, KOUserMe)->()){
        let session : KOSession = KOSession.shared()
        
        if session.isOpen(){
            session.close()
        }
        
        session.presentingViewController = view
        session.open(completionHandler: { (error) in
            session.presentingViewController = nil;
            
            // 카카오 로그인 화면에서 벋어날 시 호출.
            if error != nil {
                print("Kakao login Error Massage : \(error?.localizedDescription ?? "")")
            }else if session.isOpen(){
                KOSessionTask.userMeTask(completion: { (error_task, profile) in
                    if error != nil || profile == nil {
                        handler(error_task, KOUserMe.init())
                        return
                    }
                    
                    DispatchQueue.main.async(execute: { () -> Void in
                        if let kakao : KOUserMe = profile{
                            handler(nil, kakao)
                        }
                    })
                })
            }else{
                print("Kakao login Error Massage : isn't open")
            }
        })
    }
}
