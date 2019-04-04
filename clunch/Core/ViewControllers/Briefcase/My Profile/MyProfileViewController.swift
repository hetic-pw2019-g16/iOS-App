//
//  MyProfileViewController.swift
//  clunch
//
//  Created by Macintosh on 03/04/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

class MyProfileViewController: UIViewController {

    @IBOutlet weak var chooseImageButton: UIButton!
    
    @IBOutlet weak var companyPoleTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var validateProfileButton: UIButton!
    @IBOutlet weak var miniBioLabel: UILabel!
    @IBOutlet weak var addPhotoLabel: UILabel!
    @IBOutlet weak var miniBioTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

         self.validateProfileButton.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
    }
    
    @IBAction func validateProfilAction(_ sender: Any) {
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProfileCompletedViewController") as! ProfileCompletedViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
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
