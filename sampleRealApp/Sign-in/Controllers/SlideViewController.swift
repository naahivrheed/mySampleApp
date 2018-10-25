//
//  ViewController.swift
//  sampleRealApp
//
//  Created by Vihaan Dheer on 10/11/18.
//  Copyright © 2018 Vihaan Dheer. All rights reserved.
//

import UIKit
import Firebase

class SlideViewController: UIViewController, UIScrollViewDelegate {

    var slides:[Slide] = []
    
    //@IBOutlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        pageControl.pageIndicatorTintColor = UIColor.white
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
    }

    func createSlides() -> [Slide]
    {
        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.title.text = "Do you like this dog?"
        slide1.descriptor.text = "With our app, you can now be a temporary parent to him!"
        slide1.image.image = UIImage(named: "dog1")
        slide1.backgroundColor = UIColor.lightGray
        
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.title.text = "How about him?"
        slide2.descriptor.text = "We're sure he would love for you take cae of him!"
        slide2.image.image = UIImage(named: "dog2")
        slide2.backgroundColor = UIColor.red
        
        let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide3.title.text = "Lastly..."
        slide3.descriptor.text = "We think that you could make a perfect care taker!!"
        slide3.image.image = UIImage(named: "dog3")
        slide3.backgroundColor = UIColor.cyan
        
        let slide4:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide4.title.text = "And, it's free!"
        slide4.descriptor.isHidden = true
        slide4.image.isHidden = true
        slide4.getStarted.isHidden = false
        slide4.getStarted.addTarget(self, action: #selector(action), for: .touchUpInside)
        slide4.backgroundColor = UIColor.yellow
        
        return [slide1, slide2, slide3, slide4]
    }
    
    
    func setupSlideScrollView(slides : [Slide]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width * CGFloat(slides.count), height: UIScreen.main.bounds.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
 
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        if pageControl.currentPage == 0
        {
            pageControl.pageIndicatorTintColor = UIColor.white
        }
        else
        {
            pageControl.pageIndicatorTintColor = UIColor.lightGray
        }
    }
    
    @objc func action(_ sender:UIButton)
    {
        performSegue(withIdentifier: "segue", sender: nil)
    }
}

