//
//  ImageFullScreenVC.swift
//  Comparis
//
//  Created by Andrei Novikau on 6/15/16.
//  Copyright © 2016 IntoSoft. All rights reserved.
//

import UIKit

class ImageFullScreenVC: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var backScrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    
    var imageUrlString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageUrlString = imageUrlString.stringByReplacingOccurrencesOfString("%WIDTH%", withString: "\(imageView.bounds.size.width)")
        imageUrlString = imageUrlString.stringByReplacingOccurrencesOfString("%HEIGHT%", withString: "\(imageView.bounds.size.height)")
        
        imageView.setImageWithURL(NSURL(string: imageUrlString), placeholderImage: nil, options: .RetryFailed, completed: { (image, error, cacheType, url) in
            if error != nil {
                print("Load Error \(self.imageUrlString)")
                print(error)
            }
            }, usingActivityIndicatorStyle: .WhiteLarge)
        
        self.view.bringSubviewToFront(backButton)
        
        let tapTwice = UITapGestureRecognizer(target: self, action: #selector(tapTwice(_:)))
        tapTwice.numberOfTapsRequired = 2
        
        self.view.addGestureRecognizer(tapTwice)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    
        UIApplication.sharedApplication().statusBarStyle = .Default
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        
        backScrollView.zoomScale = 1
    }
    
    func tapTwice(gesture: UIGestureRecognizer) {
        if backScrollView.zoomScale < backScrollView.maximumZoomScale {
            backScrollView.setZoomScale(backScrollView.maximumZoomScale, animated: true)
        } else {
            backScrollView.setZoomScale(backScrollView.minimumZoomScale, animated: true)
        }
    }
    
    @IBAction func close(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}