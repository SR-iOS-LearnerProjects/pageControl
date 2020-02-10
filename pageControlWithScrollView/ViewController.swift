//
//  ViewController.swift
//  pageControlWithScrollView
//
//  Created by Sridatta Nallamilli on 27/12/19.
//  Copyright © 2019 Sridatta Nallamilli. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var imgScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var images: [String] = ["0", "1", "2", "3", "4", "5"]
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pageControl.numberOfPages = images.count
        
        for index in 0..<images.count {
            // setting the size of userdefined frame to noOfImages in images array times the width of the imgScrollView
            frame.origin.x = imgScrollView.frame.size.width * CGFloat(index)
            // frame size is set equal to imgScrollViews frame size
            frame.size = imgScrollView.frame.size
            // initilaizing the an imgView with the above frame created
            let imgView = UIImageView(frame: frame)
            imgView.image = UIImage(named: images[index])
            // adding the imgView as SubView to the imgScrollView
            imgScrollView.addSubview(imgView)
        }
        
        imgScrollView.contentSize = CGSize(width: (imgScrollView.frame.size.width * CGFloat(images.count)), height: imgScrollView.frame.size.height)
        imgScrollView.delegate = self
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = imgScrollView.contentOffset.x / imgScrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }


}

