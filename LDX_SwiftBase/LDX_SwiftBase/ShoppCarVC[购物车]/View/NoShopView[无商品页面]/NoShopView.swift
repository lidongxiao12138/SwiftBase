//
//  NoShopView.swift
//  LDX_SwiftBase
//
//  Created by edz on 2018/2/6.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class NoShopView: UIView,UICollectionViewDelegate,UICollectionViewDataSource {
    let Cellid = "Cell"
    let headerIdentifier = "CollectionReusableViewHeader"
    
    //MAEK:=========== 创建Collection ==============
    
    lazy var noShopCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: 173*d_width ,height: 245)
        layout.minimumLineSpacing = 15*d_width
        layout.minimumInteritemSpacing = 5
        layout.headerReferenceSize = self.noShopheadView.size
        
        layout.sectionInset = UIEdgeInsets.init(top: 0, left: 10*d_width, bottom: 0, right: 10*d_width)
        let Collection = UICollectionView(frame: CGRect.init(x: 0, y: 64, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-64-44), collectionViewLayout: layout)
        Collection.delegate = self
        Collection.dataSource = self
        Collection.backgroundColor = .white
        //下啦刷新
        //        weak var weakself = self
        //        homecollection.mj_header = MJRefreshNormalHeader.init(){
        //            self.dataArr = [HomeModel]()
        //            self.imageArr = [HomeModel]()
        //            weakself?.requsethome()
        //        }
        //cell注册
        Collection.register(UINib.init(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Cellid)
        
        //注册一个headView
        Collection.register(UINib.init(nibName: "NoShopHeadView",bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        
        return Collection
    }()
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var meCell = HomeCollectionViewCell()
        meCell = self.noShopCollection.dequeueReusableCell(withReuseIdentifier:Cellid, for: indexPath) as! HomeCollectionViewCell
        //        meCell.ImageTitle.image = UIImage(named: ImageArr[indexPath.row])
        //        meCell.LabTitle.text = TitleArr[indexPath.row]
        return meCell
    }
    //点击事件
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let merDetail = MerDetailViewController()
        self.viewController()?.navigationController?.pushViewController(merDetail, animated: true)
        
        print(indexPath)
    }
    
    //这个是设定header和footer的方法，根据kind不同进行不同的判断即可
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader
        {
            self.noShopheadView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier, for: indexPath) as! NoShopHeadView
        }
        return self.noShopheadView
    }
    
    //MARK:=========== 加载头部视图 ==============
    lazy var noShopheadView: NoShopHeadView = {
        let nibView = Bundle.main.loadNibNamed("NoShopHeadView", owner: nil, options: nil)?.first
        return nibView as! NoShopHeadView
    }()
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        self.addSubview(noShopCollection)
        
        // Drawing code
    }
 

}
