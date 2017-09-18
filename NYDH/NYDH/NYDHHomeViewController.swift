//
//  ViewController.swift
//  NYDH
//
//  Created by Marcel Chaucer on 8/16/17.
//  Copyright © 2017 Marcel Chaucer. All rights reserved.
//

import UIKit
import MessageUI

class NYDHHomeViewController: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func registerPatient(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let registerVC = storyboard.instantiateViewController(withIdentifier: "RegistrationViewController")
        self.navigationController?.pushViewController(registerVC, animated: true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    @IBAction func showOfficeLocations(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let locationsVC = storyboard.instantiateViewController(withIdentifier: "LocationsViewController")
        self.navigationController?.pushViewController(locationsVC, animated: true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    @IBAction func sendEmail(_ sender: UIButton) {
        let mailVC = MFMailComposeViewController()
        mailVC.mailComposeDelegate = self
        mailVC.setToRecipients(["ronaldnydh@gmail.com"])
        mailVC.setSubject("My teeth hurt")
        mailVC.setMessageBody("They really really really hurt", isHTML: false)
        
        if MFMailComposeViewController.canSendMail() {
        self.present(mailVC, animated: true, completion: nil)
        } else {
            print("This phone can't send emails")
        }
    }
    
    @IBAction func callNYDH(_ sender: UIButton) {
        let url = URL(string: "tel://7185997500")!
        
        if UIApplication.shared.canOpenURL(url) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            print("This phone doesn't have a phone ._.")
        }
    }
    
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        controller.dismiss(animated: true, completion: nil)
    
    }
    

}

