//
//  ViewController.swift
//  task7
//
//  Created by Alex Antropoff on 20.03.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    private let imageView = UIImageView()
    private let scrollView = UIScrollView()

    private let imageHeight: CGFloat = 270

    override func viewDidLoad() {
        super.viewDidLoad()
        initScroll()
        initImage()
    }
    private func initScroll() {
        scrollView.delegate = self
        scrollView.frame = view.bounds
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height + imageHeight)
        view.addSubview(scrollView)
    }

    private func initImage() {
        imageView.image = UIImage(named: "image.png")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: imageHeight)
        view.addSubview(imageView)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        print(scrollView.contentOffset)
        let topInset=max(imageHeight-offsetY-view.safeAreaInsets.top,imageHeight)
        print(topInset)
        scrollView.verticalScrollIndicatorInsets=UIEdgeInsets(top: topInset, left: 0, bottom: 0, right: 0)
        if offsetY < 0 {
            imageView.frame = CGRect(x: offsetY/2, y: 0, width: view.bounds.width - offsetY, height: imageHeight - offsetY)
        } else {
            imageView.frame = CGRect(x: 0, y: -offsetY, width: view.bounds.width, height: imageHeight)
        }
            print(imageView.frame)
    }
}
