//
//  HotelDetailsViewController.swift
//  Webkeyz Hotels
//
//  Created by Amr Fawzy on 1/26/21.
//

import UIKit
import MapKit
import CoreLocation

class HotelDetailsViewController: UIViewController, CLLocationManagerDelegate {
    
    //MARK:- Outlets
    @IBOutlet weak var hotelImage: UIImageView!
    @IBOutlet weak var hotelName: UILabel!
    @IBOutlet weak var hotelAddress: UILabel!
    @IBOutlet weak var actualPrice: UILabel!
    @IBOutlet weak var normalPrice: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    //MARK:- Variables and constants
    var data : Hotel?
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        oultetsData()
        getHotelLocation()
       
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        hotelImage.addGestureRecognizer(tap)
        
        // set corner radius for map view
        mapView.layer.cornerRadius = 20

    }
    
    //MARK:- Setting data for each outlet
    func oultetsData(){
        hotelName.text = data?.summary?.hotelName
        hotelImage.setImage(with: data?.image.first?.url ?? "")
        actualPrice.text = "\(data?.summary?.lowRate ?? 0)"
        normalPrice.text = "\(data?.summary?.highRate ?? 0)"
        hotelAddress.text = data?.location?.address ?? ""
        
        //Round bottom corners of hotel image
        hotelImage.roundCorners(with: [.layerMinXMaxYCorner,.layerMaxXMaxYCorner], radius: 20)
    }
    
    //MARK:- Handle tapping image
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        let imageView = sender.view as! UIImageView
        let newImageView = UIImageView(image: imageView.image)
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = .black
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        newImageView.addGestureRecognizer(tap)
        self.view.addSubview(newImageView)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }

    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()
    }
    
    
    //MARK:- Map with location of the hotel
    func getHotelLocation(){
        // Map type
        mapView.mapType = MKMapType.standard
        
        // Set lat and, Lon
        let location = CLLocationCoordinate2D(latitude: (data?.location?.latitude)! ,longitude: (data?.location?.longitude)!)
        
        // Foucs on map
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        // Put annotaion
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = data?.summary?.hotelName
        mapView.addAnnotation(annotation)
    }
    
}

