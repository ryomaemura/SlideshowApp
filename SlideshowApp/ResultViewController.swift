//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 前村龍 on 2020/12/12.
//  Copyright © 2020 ryomaemura. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    // 画像ファイルを読み込み
    var image: UIImage!
    var image1: UIImage!
    var image2: UIImage!
    var image3: UIImage!
    
    var imageNumber: Int!

    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = self.image
        
        showImage(showImageNumber: imageNumber)
    }
    
    func showImage(showImageNumber: Int) {
        // large Image Viewに画像を設定
        switch showImageNumber {
            case 0:
                imageView.image = image1
            case 1:
                imageView.image = image2
            case 2:
                imageView.image = image3
            default:
                print("imageView error")
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
