//
//  ViewController.swift
//  SlideshowApp
//
//  Created by jumu on 2020/02/06.
//  Copyright © 2020 jumu.furukawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var UIImageView: UIImageView!
    //imageIndexは数字
    var imageIndex = 0
    var timer: Timer!
    let images = [UIImage(named:"image0"), UIImage(named:"image1"), UIImage(named:"image2") , UIImage(named:"image3"), UIImage(named:"image4")]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let imageView = images[0]
        UIImageView.image = imageView
    }
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
    @IBAction func nextButtom(_ sender: Any) {
        if imageIndex == 4{
        imageIndex = 0
        } else {
            imageIndex += 1
        }
        UIImageView.image = images[imageIndex]
    }
    @IBAction func backButtom(_ sender: Any) {
        if imageIndex == 0 {
            imageIndex = 4
        } else {
            imageIndex -= 1
        }
        UIImageView.image = images[imageIndex]
        
    }
    @IBAction func startstopButtom(_ sender: Any) {
        if self.timer == nil{
        self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(onTimer(_:)), userInfo: nil, repeats: true)
        } else {
            self.timer.invalidate()
            self.timer = nil
        }
    }
    @objc func onTimer(_ timer: Timer) {
        if imageIndex == 4{
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        UIImageView.image = images[imageIndex]
    }
}
