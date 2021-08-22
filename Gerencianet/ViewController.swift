//
//  ViewController.swift
//  Gerencianet
//
//  Created by Fabiana Petrovick on 07/08/21.
//  Copyright © 2021 Fabiana Petrovick. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var accessAccountButton: UIButton!
    @IBOutlet weak var openAccountButton: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.delegate = self
        }
    }
    
    var currentSnapshotImage: UIImage?
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides:[Slide] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func accessAccountButton(_ sender: UIButton) {
        guard let reactionVC = storyboard?.instantiateViewController(withIdentifier: "AccessAccountController")
            as? AccessAccountController else {
                
                assertionFailure("No view controller ID AccessCountController in storyboard")
                return
        }
        
        // set the modal presentation to full screen, in iOS 13, its no longer full screen by default
        reactionVC.backingImage = self.view.asImage()
        
        // present the view controller modally without animation
        self.present(reactionVC, animated: false, completion: nil)
    }
    
    @IBAction func openAccountController(_ sender: UIButton) {
        guard let reactionVC = storyboard?.instantiateViewController(withIdentifier: "OpenAccountController")
                   as? OpenAccountController else {
                       
                       assertionFailure("No view controller ID OpenAccountController in storyboard")
                       return
               }
               
               // set the modal presentation to full screen, in iOS 13, its no longer full screen by default
               reactionVC.backingImage = self.view.asImage()
               
               // present the view controller modally without animation
               self.present(reactionVC, animated: false, completion: nil)
    }
    
    func createSlides() -> [Slide] {
        
        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        var labelTitle = slide1.labelTitle.text
        
        var normalText1 = "Soluções para\ndescomplicar a gestão\nfinanceira,\n"
        
        var boldText1  = "pensadas para você e\nseu negócio."
        
        var attributedString = NSMutableAttributedString()
        
        var attrs1 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 25)]
        var boldString1 = NSMutableAttributedString(string: boldText1, attributes:attrs1)
        
        var attr1 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 25)]
        var normalString1 = NSMutableAttributedString(string: normalText1, attributes:attr1)
        
        attributedString.append(normalString1)
        attributedString.append(boldString1)
        
        slide1.labelTitle.attributedText = attributedString
        slide1.labelTitle.textColor = .white
        
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        var normalText2 = "\n24h por dia, 365 dias ao\nano.\n"
        
        var boldText2  = "Prepare-se para fazer\num PIX."
        
        var attributedString2 = NSMutableAttributedString()
        
        var attrs2 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 25)]
        var boldString2 = NSMutableAttributedString(string: boldText2, attributes:attrs2)
        
        var attr2 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 25)]
        var normalString2 = NSMutableAttributedString(string: normalText2, attributes:attr2)
        
        attributedString2.append(normalString2)
        attributedString2.append(boldString2)
        
        slide2.labelTitle.attributedText = attributedString2
        slide2.labelTitle.textColor = .white
        
        let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        var normalText3 = "\n\nRealize cobranças\npor meio de "
        
        var boldText3  = "boletos,\ncartões e carnês!"
        
        var attributedString3 = NSMutableAttributedString()
        
        var attrs3 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 25)]
        var boldString3 = NSMutableAttributedString(string: boldText3, attributes:attrs3)
        
        var attr3 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 25)]
        var normalString3 = NSMutableAttributedString(string: normalText3, attributes:attr3)
        
        attributedString3.append(normalString3)
        attributedString3.append(boldString3)
        
        slide3.labelTitle.attributedText = attributedString3
        slide3.labelTitle.textColor = .white
        
        let slide4:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        var normalText4 = "\n\n\nPague somente pelas\n"
        
        var boldText4  = "emissões "
        
        var normalText44 = "recebidas."
        
        var attributedString4 = NSMutableAttributedString()
        
        var attrs4 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 25)]
        var boldString4 = NSMutableAttributedString(string: boldText4, attributes:attrs4)
        
        var attr4 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 25)]
        var normalString4 = NSMutableAttributedString(string: normalText4, attributes:attr4)
        
        var attr44 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 25)]
        var normalString44 = NSMutableAttributedString(string: normalText44, attributes:attr44)
        
        attributedString4.append(normalString4)
        attributedString4.append(boldString4)
        attributedString4.append(normalString44)
        
        slide4.labelTitle.attributedText = attributedString4
        slide4.labelTitle.textColor = .white
        
        let slide5:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        var normalText5 = "\n\n\nAPI de "
        
        var boldText5  = "fácil integração "
        
        var normalText55 = "e\ndocumentação completa."
        
        var attributedString5 = NSMutableAttributedString()
        
        var attrs5 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 25)]
        var boldString5 = NSMutableAttributedString(string: boldText5, attributes:attrs5)
        
        var attr5 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 25)]
        var normalString5 = NSMutableAttributedString(string: normalText5, attributes:attr5)
        
        var attr55 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 25)]
        var normalString55 = NSMutableAttributedString(string: normalText55, attributes:attr55)
        
        attributedString5.append(normalString5)
        attributedString5.append(boldString5)
        attributedString5.append(normalString55)
        
        slide5.labelTitle.attributedText = attributedString5
        slide5.labelTitle.textColor = .white
        
        let slide6:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        var normalText6 = "\n\n\nMais praticidade e\n"
        
        var boldText6 = "menor custo "
        
        var normalText66 = "para você!"
        
        var attributedString6 = NSMutableAttributedString()
        
        var attrs6 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 25)]
        var boldString6 = NSMutableAttributedString(string: boldText6, attributes:attrs6)
        
        var attr6 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 25)]
        var normalString6 = NSMutableAttributedString(string: normalText6, attributes:attr6)
        
        var attr66 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 25)]
        var normalString66 = NSMutableAttributedString(string: normalText66, attributes:attr66)
        
        attributedString6.append(normalString6)
        attributedString6.append(boldString6)
        attributedString6.append(normalString66)
        
        slide6.labelTitle.attributedText = attributedString6
        slide6.labelTitle.textColor = .white
        
        
        return [slide1, slide2, slide3, slide4, slide5, slide6]
    }
    
    
    func setupSlideScrollView(slides : [Slide]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        
        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
        
        // vertical
        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
        let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
        
        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
        
        let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
        
    }
    
    func scrollView(_ scrollView: UIScrollView, didScrollToPercentageOffset percentageHorizontalOffset: CGFloat) {
        if(pageControl.currentPage == 0) {
            
            let pageUnselectedColor: UIColor = fade(fromRed: 255/255, fromGreen: 255/255, fromBlue: 255/255, fromAlpha: 1, toRed: 103/255, toGreen: 58/255, toBlue: 183/255, toAlpha: 1, withPercentage: percentageHorizontalOffset * 3)
            pageControl.pageIndicatorTintColor = pageUnselectedColor
            
            
            let bgColor: UIColor = fade(fromRed: 103/255, fromGreen: 58/255, fromBlue: 183/255, fromAlpha: 1, toRed: 255/255, toGreen: 255/255, toBlue: 255/255, toAlpha: 1, withPercentage: percentageHorizontalOffset * 3)
            slides[pageControl.currentPage].backgroundColor = bgColor
            
            let pageSelectedColor: UIColor = fade(fromRed: 81/255, fromGreen: 36/255, fromBlue: 152/255, fromAlpha: 1, toRed: 103/255, toGreen: 58/255, toBlue: 183/255, toAlpha: 1, withPercentage: percentageHorizontalOffset * 3)
            pageControl.currentPageIndicatorTintColor = pageSelectedColor
        }
    }
    
    func fade(fromRed: CGFloat,
              fromGreen: CGFloat,
              fromBlue: CGFloat,
              fromAlpha: CGFloat,
              toRed: CGFloat,
              toGreen: CGFloat,
              toBlue: CGFloat,
              toAlpha: CGFloat,
              withPercentage percentage: CGFloat) -> UIColor {
        
        let red: CGFloat = (toRed - fromRed) * percentage + fromRed
        let green: CGFloat = (toGreen - fromGreen) * percentage + fromGreen
        let blue: CGFloat = (toBlue - fromBlue) * percentage + fromBlue
        let alpha: CGFloat = (toAlpha - fromAlpha) * percentage + fromAlpha
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setupSlideScrollView(slides: slides)
    }
}
