//
//  ViewController.swift
//  滑动解锁
//
//  Created by karl on 2017/07/29.
//  Copyright © 2017年 Karl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor.darkGray
    
    let v1 = KRLShimmerView(frame: CGRect(x: 100, y: 30, width: 200, height: 60))
    v1.font = UIFont.systemFont(ofSize: 20)
    v1.shimmerColors = [UIColor.red, UIColor.green]
    v1.textColor = UIColor.red
    view.addSubview(v1)
    v1.duration = 1
    
    let v2 = KRLShimmerView(frame: CGRect(x: 100, y: v1.frame.maxY + 20, width: 200, height: 80))
    v2.duration = 5
    v2.font = UIFont.boldSystemFont(ofSize: 30)
    v2.shimmerImage = UIImage(named: "gradient")
    v2.textColor = UIColor.blue
    view.addSubview(v2)
    
    let v3 = KRLShimmerView(frame: CGRect(x: 100, y: v2.frame.maxY + 20, width: 200, height: 70))
    view.addSubview(v3)
    
    lrcTest()
  }
  
  
  func lrcTest() {
    let contentView = UIView(frame: CGRect(x: 100, y: 330, width: 200, height: 80))
    contentView.backgroundColor = UIColor.white
    view.addSubview(contentView)
    
    let label = UILabel(frame: contentView.bounds)
    label.text = "这是一段简单的歌词"
    label.textColor = UIColor.green
    label.font = UIFont.boldSystemFont(ofSize: 20)
    label.textAlignment = .center
    contentView.addSubview(label)
    
    // ---
    let gradientLayer = CAGradientLayer()
    gradientLayer.bounds = contentView.bounds
    gradientLayer.anchorPoint = CGPoint.zero
    gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
    gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
    gradientLayer.colors = [UIColor.red.cgColor, UIColor.red.cgColor, UIColor.clear.cgColor]
    gradientLayer.locations = [0, 0, 1]
    gradientLayer.mask = label.layer
    contentView.layer.addSublayer(gradientLayer)
    
    let animation = CABasicAnimation(keyPath: "locations")
    animation.fromValue = [0, 0, 0]
    animation.toValue = [1, 1, 1]
    animation.duration = 5
    animation.repeatCount = HUGE
    gradientLayer.add(animation, forKey: nil)
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

