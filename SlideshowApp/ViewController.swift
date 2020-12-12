//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 前村龍 on 2020/12/12.
//  Copyright © 2020 ryomaemura. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    // 表示する image の数値
    var imageNumber: Int = 0
    
    // タイマー
    var timer: Timer! = nil

    // 画像ファイルを読み込み
    var image1 = UIImage(named: "image1")
    var image2 = UIImage(named: "image2")
    var image3 = UIImage(named: "image3")
    // 画像表示エリア
    @IBOutlet weak var imageView: UIImageView!
    // 「進む」ボタン
    @IBOutlet weak var nextButton: UIButton!
    // 「戻る」ボタン
    @IBOutlet weak var prevButton: UIButton!
    // 「再生/停止」ボタン
    @IBOutlet weak var startStopButton: UIButton!
    
    // 画面遷移時の imageNumber を保存する変数
    var resultViewImageNumber: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Image Viewに画像を設定
        imageView.image = image1
    }
    
    // 「進む」ボタン
    @IBAction func nextButton(_ sender: Any) {
        // imageNumber を1つ進める
        imageNumber += 1
        imageNumber %= 3
        
        showImage(showImageNumber: imageNumber)
    }
    
    // 「戻る」ボタン
    @IBAction func prevButton(_ sender: Any) {
        // imageNumber を1つ戻す
        imageNumber += 3
        imageNumber -= 1
        imageNumber %= 3
        
        showImage(showImageNumber: imageNumber)
    }
    
    // 「再生/停止」ボタン
    @IBAction func startButton(_ sender: Any) {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(imageNumberCountUp), userInfo: nil, repeats: true)
            // 停止ボタン化
            startStopButton.setTitle("停止", for: .normal)
            // 進むボタンを無効化
            nextButton.isEnabled = false
            // 戻るボタンを無効化
            prevButton.isEnabled = false
        } else {
            // タイマーを停止する
            timer.invalidate()
            timer = nil
            // 再生ボタン化
            startStopButton.setTitle("再生", for: .normal)
            // 進むボタンを有効化
            nextButton.isEnabled = true
            // 戻るボタンを有効化
            prevButton.isEnabled = true
        }
    }

    @objc func imageNumberCountUp() {
        imageNumber += 1
        imageNumber %= 3
        showImage(showImageNumber: imageNumber)
    }

    func showImage(showImageNumber: Int) {
        // Image Viewに画像を設定
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

    @IBAction func imageTap(_ sender: Any) {
        // imageView をタップした時に実行される
        performSegue(withIdentifier: "toResultViewController", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        if (segue.identifier == "toResultViewController") {
            let resultViewController:ResultViewController = segue.destination as! ResultViewController
            
            resultViewController.image1 = image1
            resultViewController.image2 = image2
            resultViewController.image3 = image3
            
            resultViewController.imageNumber = imageNumber
            
            resultViewImageNumber = imageNumber
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に実行される
        imageNumber = resultViewImageNumber
        showImage(showImageNumber: imageNumber)
    }
}
