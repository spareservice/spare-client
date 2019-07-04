//
//  FindViewController.swift
//  SpareService
//
//  Created by Vithursan Sivakumaran on 06/06/2019.
//  Copyright © 2019 oualiken ourdia. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class FindViewController: UIViewController {

    
    @IBOutlet weak var findMap: MKMapView!
    let locationManager = CLLocationManager()
    let regionDiametre : Double = 10000
    
    class func newInstance() -> FindViewController {
        let fvc = FindViewController()
        return fvc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        findMap.delegate = self
        checkLocationServices()
    }
    
    func feedAnnotation() {
        SpareServiceServices.default.getAllPrestataire(completion: { (res) in
            
            res.forEach{ i in
                guard let adresse = i["adresse"] as? String,
                        let email = i["email"] as? String,
                        let tel = i["tel"] as? String,
                        let cp = i["cp"] as? String,
                        let ville = i["ville"] as? String,
                        let nom = i["nom"] as? String,
                        let prenom = i["prenom"] as? String else {return }
                
                let services : [String] = ["Service1", "Service2"]
                let presta = Prestataire(nom: nom, prenom: prenom, services: services, email: email, tel: tel, adresse: adresse, cp: cp, ville: ville)
                
                let fullAdresse = "\(presta.adresse), \(presta.cp) \(presta.ville), FRANCE"
                print(fullAdresse)
                let geocoder = CLGeocoder()
                geocoder.geocodeAddressString(fullAdresse) { (placemarks, error) in
                    guard let placemarks = placemarks,
                        let location = placemarks.first?.location
                        else {
                            return
                    }
                    let position = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
                    
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = position
                    annotation.title = "\(presta.nom) \(presta.prenom)"
                    annotation.subtitle = "\(presta.email)"
                    self.findMap.addAnnotation(annotation)
                }
            }
            
        })
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionDiametre, longitudinalMeters: regionDiametre)
            findMap.setRegion(region, animated: true)
        }
        
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            // Show alert letting know the user know theey have to turn on this
        }
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            findMap.showsUserLocation = true
            centerViewOnUserLocation()
            feedAnnotation()
            locationManager.startUpdatingLocation()
            break
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .authorizedAlways:
            break
        default:
            print("default")
            break
        }
    }
}

extension FindViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: regionDiametre, longitudinalMeters: regionDiametre)
        findMap.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
}

extension FindViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let email = view.annotation?.subtitle as? String else { return }
        print(email)
        SpareServiceServices.default.getPrestataireByEmail(email: email, completion: { (x) in
            guard let adresse = x[0]["adresse"] as? String,
                let email = x[0]["email"] as? String,
                let tel = x[0]["tel"] as? String,
                let cp = x[0]["cp"] as? String,
                let ville = x[0]["ville"] as? String,
                let nom = x[0]["nom"] as? String,
                let prenom = x[0]["prenom"] as? String else {return }
            
            let services : [String] = ["Service1", "Service2"]
            let presta = Prestataire(nom: nom, prenom: prenom, services: services, email: email, tel: tel, adresse: adresse, cp: cp, ville: ville)
            
            let next = PrestataireViewController.newInstance(presta: presta)
            self.navigationController?.pushViewController(next, animated: true)
        })
    }
}




