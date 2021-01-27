//
//  HotelsViewController.swift
//  Webkeyz Hotels
//
//  Created by Amr Fawzy on 1/26/21.
//

import UIKit
import Kingfisher

class HotelsViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- Variables
    //Contains array of Hotel data
    var hotelsData = [Hotel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getHotels()

    }
    
    //MARK:- Calling API that retrive hotels data

    func getHotels(){
        //Make a toast
        self.view.makeToastActivity(.center)
        APIClient().GetHotels { (res) in
            self.view.hideToastActivity()
            print(res)
            self.hotelsData = res
            
            // Reload tableView
            self.tableView.reloadData()
        } onError: { (error) in
            self.view.hideToastActivity()
            self.view.makeToast(error)
            print(error)
        }
    }
    
}


//MARK:- UITableViewDataSource and, UITableViewDelegate

extension HotelsViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotelsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HotelsTableViewCell") as! HotelsTableViewCell
        
        cell.hotelName.text = hotelsData[indexPath.row].summary?.hotelName ?? ""
        cell.hotelImage.setImage(with: hotelsData[indexPath.row].image.first?.url ?? "")
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cellItem = hotelsData[indexPath.row]
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HotelDetailsViewController") as? HotelDetailsViewController
        vc!.data = cellItem
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    
    
}




