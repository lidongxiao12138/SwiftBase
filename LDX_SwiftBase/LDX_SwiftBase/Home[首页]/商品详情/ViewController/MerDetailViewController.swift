//
//  MerDetailViewController.swift
//  LDX_SwiftBase
//
//  Created by 掌心 on 2018/1/16.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit
import HMSegmentedControl
class MerDetailViewController: UIViewController,UIScrollViewDelegate {

    //MAEK:=========== 进入程序 =============
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.detailSegment.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = ""
        //加载头部视图
        self.navigationController?.navigationBar.addSubview(self.detailSegment)
        //加载尾部视图
        self.tabdetailView.frame = CGRect(x: 0, y: SCREEN_HEIGHT-48, width: SCREEN_WIDTH, height: 48)
        self.view.addSubview(self.tabdetailView)
        
        //加载滚动视图
        self.view.addSubview(self.detailscrollerView)
        
        self.detailSegment.center.x = (self.navigationController?.navigationBar.center.x)!
        //详情
        self.detailSegment.ButDetail.addTarget(self, action: #selector(ButDetailClick(sender:)), for: .touchUpInside)
        //商品
        self.detailSegment.ButGoods.addTarget(self, action: #selector(ButDetailClick(sender:)), for: .touchUpInside)
        //评价
        self.detailSegment.ButComment.addTarget(self, action: #selector(ButDetailClick(sender:)), for: .touchUpInside)
    
    }
    
    @objc func ButDetailClick(sender:UIButton){
        print(sender.tag)
        switch sender.tag {
        case 0:
            self.detailscrollerView.setContentOffset(CGPoint(x:0,y:0), animated: true)
        case 1:
            self.detailscrollerView.setContentOffset(CGPoint(x:0,y:self.merupView.frame.size.height), animated: true)
        case 2:
            self.detailscrollerView.setContentOffset(CGPoint(x:0,y:self.merupView.frame.size.height+120), animated: true)
        default:
            break
        }
    }

    
  
    //MARK: =============懒加载视图===============
    //头部视图
    fileprivate lazy var detailSegment: DetailSegmentView = {
        let nibView = Bundle.main.loadNibNamed("DetailSegmentView", owner: nil, options: nil)?.first
        
        return nibView as! DetailSegmentView
    }()
    //尾部视图
    fileprivate lazy var tabdetailView: TabDetailView = {
        let nibView = Bundle.main.loadNibNamed("TabDetailView", owner: nil, options: nil)?.first
        
        return nibView as! TabDetailView
    }()
    
    //商品视图
    fileprivate lazy var merupView: MerUPView = {
        let nibView = Bundle.main.loadNibNamed("MerUPView",owner: nil, options: nil)?.first
        return nibView as! MerUPView
    }()
    //滚动视图
    fileprivate lazy var detailscrollerView: UIScrollView =
    {
        let scroller = UIScrollView()
        scroller.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-48)
        
        for index in 0...2 {
            let vc: UIViewController = UIViewController.init()
            if index == 0 {

                if IPHONE6p_DEV
                {
                    self.merupView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 720+64)
                    vc.view.frame = CGRect(x:0,y:64,width:(scroller.bounds.width),height:self.merupView.frame.size.height+64)
                }else
                {
                    self.merupView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 735)
                    vc.view.frame = CGRect(x:0,y:64,width:(scroller.bounds.width),height:720)
                }
                
                vc.view.addSubview(self.merupView)
            }
            if index == 1 {
                let evaVC = EvaCenViewController()
                if IPHONE6p_DEV
                {
                    evaVC.view.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 120)
                    vc.view.frame = CGRect(x:0,y:735+64,width:(scroller.bounds.width),height:120)
                }else
                {

                    evaVC.view.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 120)
                    vc.view.frame = CGRect(x:0,y:735+64,width:(scroller.bounds.width),height:110)
                }

                vc.view.addSubview(evaVC.view)
            }
            if index == 2 {
                vc.view.frame = CGRect(x:0,y:SCREEN_HEIGHT+200+64,width:(scroller.bounds.width),height:SCREEN_HEIGHT)
            }
            
            let temp1 = Float(arc4random()%255)/255
            let temp2 = Float(arc4random()%255)/255
            let temp3 = Float(arc4random()%255)/255
            vc.view.backgroundColor = UIColor.init(red: CGFloat(temp1), green: CGFloat(temp2), blue: CGFloat(temp3), alpha: 1)
            
            //添加子控制器
            scroller.addSubview(vc.view)
            self.addChildViewController(vc)
            
        }
        scroller.contentSize = CGSize(width: SCREEN_WIDTH, height: SCREEN_HEIGHT+120+64+720)
        scroller.isPagingEnabled = false
        scroller.showsVerticalScrollIndicator = false
        scroller.showsHorizontalScrollIndicator = false
        scroller.scrollsToTop = false
        scroller.delegate = self
        return scroller
    }()
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > self.merupView.frame.size.height-10 {
            self.detailSegment.ViewBackground.center.x = self.detailSegment.ButComment.center.x
            self.detailSegment.ButComment.setTitleColor(LDXBaseNav, for: .normal)
            self.detailSegment.ButGoods.setTitleColor(.black, for: .normal)
            self.detailSegment.ButDetail.setTitleColor(.black, for: .normal)
        }
        if scrollView.contentOffset.y > self.merupView.frame.size.height+110 {
            self.detailSegment.ViewBackground.center.x = self.detailSegment.ButDetail.center.x
            self.detailSegment.ButDetail.setTitleColor(LDXBaseNav, for: .normal)
            self.detailSegment.ButGoods.setTitleColor(.black, for: .normal)
            self.detailSegment.ButComment.setTitleColor(.black, for: .normal)
        }
        
        if scrollView.contentOffset.y < self.merupView.frame.size.height {
            self.detailSegment.ViewBackground.center.x = self.detailSegment.ButGoods.center.x
            self.detailSegment.ButGoods.setTitleColor(LDXBaseNav, for: .normal)
            self.detailSegment.ButComment.setTitleColor(.black, for: .normal)
            self.detailSegment.ButDetail.setTitleColor(.black, for: .normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


