//
//  LoaderViewController.swift
//  clunch
//
//  Created by Samy on 01/02/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

class LoaderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let imageData = try? Data(contentsOf: Bundle.main.url(forResource: "play", withExtension: "gif")!)
        let advTimeGif = UIImage.gifImageWithData(imageData!)
        UIImage.gif
        let imageView2 = UIImageView(image: advTimeGif)
        imageView2.frame = CGRect(x: 20.0, y: 220.0, width:
            self.view.frame.size.width - 40, height: 150.0)
        view.addSubview(imageView2)
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
