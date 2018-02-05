//
//  SepllDetailViewController.swift
//  LDX_SwiftBase
//
//  Created by edz on 2018/1/31.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class SepllDetailViewController: BaseViewController,UIScrollViewDelegate {
    let SepComVCHeight = 940.0 as CGFloat
    let SepRuleVCHeight = 334.0 as CGFloat
    let SepEvaVCHeight = 120.0 as CGFloat
    //MAEK:=========== 进入程序 =============
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
//        self.detailSegment.center.x = (self.navigationController?.navigationBar.center.x)!
//        //加载头部视图
//        self.navigationController?.navigationBar.addSubview(self.detailSegment)
//        
        // 在导航条添加
        let titleView = UIView(frame:(self.navigationController?.navigationBar.frame)!)
        titleView.addSubview(self.detailSegment)
        self.navigationItem.titleView = titleView
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.detailSegment.removeFromSuperview()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    //MARK: =============懒加载视图===============
    //头部视图
    fileprivate lazy var detailSegment: DetailSegmentView = {
        let nibView = Bundle.main.loadNibNamed("DetailSegmentView", owner: nil, options: nil)?.first
        
        return nibView as! DetailSegmentView
    }()
    //尾部视图
    fileprivate lazy var bottom: BottomView = {
        let nibView = Bundle.main.loadNibNamed("BottomView", owner: nil, options: nil)?.first
        
        return nibView as! BottomView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.detailscrollerView)

        //加载尾部视图
        self.bottom.frame = CGRect(x: 0, y: SCREEN_HEIGHT-48, width: SCREEN_WIDTH, height: 48)
        self.view.addSubview(self.bottom)
        //详情
        self.detailSegment.ButDetail.addTarget(self, action: #selector(ButDetailClick(sender:)), for: .touchUpInside)
        //商品
        self.detailSegment.ButGoods.addTarget(self, action: #selector(ButDetailClick(sender:)), for: .touchUpInside)
        //评价
        self.detailSegment.ButComment.addTarget(self, action: #selector(ButDetailClick(sender:)), for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }
    @objc func ButDetailClick(sender:UIButton){
        print(sender.tag)
        switch sender.tag {
        case 0:
            self.detailscrollerView.setContentOffset(CGPoint(x:0,y:0), animated: true)
        case 1:
            self.detailscrollerView.setContentOffset(CGPoint(x:0,y:SepComVCHeight ), animated: true)
        case 2:
            self.detailscrollerView.setContentOffset(CGPoint(x:0,y:SepComVCHeight + SepEvaVCHeight * d_height), animated: true)
        default:
            break
        }
    }
    //滚动视图
    fileprivate lazy var detailscrollerView: UIScrollView =
    {
        let scroller = UIScrollView()
        scroller.frame = CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - 64)
        
        for index in 0...2 {
            let vc: UIViewController = UIViewController.init()
            if index == 0 {
                let ComVC = SepllComViewController()
                ComVC.view.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SepComVCHeight)
                vc.view.addSubview(ComVC.view)
            }
            if index == 1 {
                let evaVC = EvaCenViewController()
                evaVC.view.frame = CGRect(x: 0, y: SepComVCHeight, width: SCREEN_WIDTH, height: SepEvaVCHeight * d_height)
                vc.view.addSubview(evaVC.view)
            }
            if index == 2 {
                let SepRulesVC = SepRulesViewController()
                SepRulesVC.view.frame = CGRect(x: 0, y: SepComVCHeight + SepEvaVCHeight * d_height, width: SCREEN_WIDTH, height: SepRuleVCHeight * d_height)
                vc.view.addSubview(SepRulesVC.view)
            }
            //添加子控制器
            scroller.addSubview(vc.view)
            self.addChildViewController(vc)
            
        }
        scroller.contentSize = CGSize(width: SCREEN_WIDTH, height: SepComVCHeight + SepEvaVCHeight * d_height + SepRuleVCHeight * d_height)
        scroller.isPagingEnabled = false
        scroller.showsVerticalScrollIndicator = false
        scroller.showsHorizontalScrollIndicator = false
        scroller.scrollsToTop = false
        scroller.delegate = self
        return scroller
    }()
    //MARK: =============设置代理===============
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > SepComVCHeight-10 {
            self.detailSegment.ViewBackground.center.x = self.detailSegment.ButComment.center.x
            self.detailSegment.ButComment.setTitleColor(LDXBaseNav, for: .normal)
            self.detailSegment.ButGoods.setTitleColor(.black, for: .normal)
            self.detailSegment.ButDetail.setTitleColor(.black, for: .normal)
        }
        if scrollView.contentOffset.y > SepComVCHeight + SepEvaVCHeight * d_height-10 {
            self.detailSegment.ViewBackground.center.x = self.detailSegment.ButDetail.center.x
            self.detailSegment.ButDetail.setTitleColor(LDXBaseNav, for: .normal)
            self.detailSegment.ButGoods.setTitleColor(.black, for: .normal)
            self.detailSegment.ButComment.setTitleColor(.black, for: .normal)
        }
        
        if scrollView.contentOffset.y < SepComVCHeight - 10 {
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
