//
//  ViewControllerThree.swift
//  digitalStethoscope
//
//  Created by Andrew Stoycos on 4/23/18.
//  Copyright © 2018 Andrew Stoycos. All rights reserved.
//

import AVFoundation
import UIKit
import MessageUI

class ViewControllerThree:
UIViewController,MFMailComposeViewControllerDelegate,UITextFieldDelegate {
  
    @IBOutlet weak var enterEmail: UITextField!
    @IBOutlet weak var sendEmailobj: UIButton!
    @IBOutlet weak var startOver1: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendEmailobj.layer.cornerRadius = 4
        startOver1.layer.cornerRadius = 4
        self.enterEmail.delegate = self;
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func sendemail(email: String, filename: String){
        if( MFMailComposeViewController.canSendMail() ) {
            print("Can send email.")
            
            let mailComposer = MFMailComposeViewController()
            mailComposer.mailComposeDelegate = self
            
            //Set the subject and message of the email
            mailComposer.setSubject("Voice Note")
            mailComposer.setMessageBody("my sound", isHTML: false)
            mailComposer.setToRecipients([email])
            
            //collect collect various files from the multiple locations
            //Attatch ambiguous number of audio files
            for i in 1...fileNumber{
                if let docsDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as? String {
                    var fileManager = FileManager.default
                    var filecontent = fileManager.contents(atPath: docsDir + "/" + filename + String(i) + ".wav")
                    mailComposer.addAttachmentData(filecontent!, mimeType: "audio/x-wav", fileName: filename + String(i) + ".wav")
                    
                    
                }
                fileNumber = 0 
            }
            
            self.present(mailComposer, animated: true, completion: nil)
            
            func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
                
                controller.dismiss(animated: true, completion: nil)
                
            }
            
        }
    }
    
    //Error handling function for EMAIL
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        controller.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func sendEmailact(_ sender: UIButton) {
        
        let emailer = enterEmail.text
        
        sendemail(email: emailer! ,filename: "acc_TOP_audio_BOTTOM")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    
    
}
