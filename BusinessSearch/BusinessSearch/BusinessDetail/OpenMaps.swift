//
//  OpenMaps.swift
//  BusinessSearch
//
//  Created by Christian Adiputra on 20/05/23.
//

import Foundation
import UIKit
import CoreLocation
import MapKit

class OpenMapDirections {
    
    // If you are calling the coordinate from a Model, don't forgot to pass it in the function parenthesis.
    static func present(in viewController: UIViewController, sourceView: UIView, latitude: Double, longitude: Double, name: String) {
        let actionSheet = UIAlertController(title: "Open Location", message: "Choose an app to open location", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Google Maps", style: .default, handler: { _ in
            // Pass the coordinate inside this URL
            
            if let url = URL(string: "comgooglemaps://?q=\(latitude),\(longitude)") {
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    // Google Maps is not installed. Open in browser.
                    let webURL = URL(string: "https://www.google.com/maps/search/?api=1&query=\(latitude),\(longitude)")
                    UIApplication.shared.open(webURL!, options: [:], completionHandler: nil)
                }
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "Apple Maps", style: .default, handler: { _ in
            // Pass the coordinate that you want here
            let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let placemark = MKPlacemark(coordinate: coordinates)
            
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.name = name // Optional: You can set a custom location name
            
            mapItem.openInMaps(launchOptions: nil)
            
            
        }))
        actionSheet.popoverPresentationController?.sourceRect = sourceView.bounds
        actionSheet.popoverPresentationController?.sourceView = sourceView
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        viewController.present(actionSheet, animated: true, completion: nil)
    }
}
