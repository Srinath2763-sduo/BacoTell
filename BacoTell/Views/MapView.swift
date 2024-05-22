//
//  MapView.swift
//  BacoTell
//
//  Created by Srinath Shah on 5/21/24.
//

import UIKit
import MapKit
import SwiftUI

class LabelWrapperView: UIView {
    var label: UILabel = {
     let l = UILabel()
        l.text = "123"
        return l
    }()
    init() {
        super.init(frame: .zero)
        addSubview(label)
        label.sizeToFit()
       
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),])
        backgroundColor = .gray
    }
    
    required init?(coder: NSCoder) {
        fatalError("asdasda ")
    }
}

struct LabelSwiftUIView: UIViewRepresentable {
    func makeUIView(context: Context) -> LabelWrapperView {
        LabelWrapperView()
    }
    
    func updateUIView(_ uiView: LabelWrapperView, context: Context) {
    }
    
    typealias UIViewType = LabelWrapperView
}

protocol MapViewDelegate {}
class MapView: UIView, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager = .init()
    override class var requiresConstraintBasedLayout: Bool {true}
    var mapView: MapKit.MKMapView!
    var scrollView: UIScrollView = .init()
    
    init(delegate: MapViewDelegate? = nil, location: Binding<CLLocationCoordinate2D?>? = nil) {
       
        if locationManager.authorizationStatus.rawValue < 3 {
            locationManager.requestWhenInUseAuthorization()
            super.init(frame: .zero)
            return
        }
      
        super.init(frame: .zero)
        locationManager.delegate = self
       
        self.mapView = .init(frame: .zero)
//        mapView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        mapView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(self.mapView)
        
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo:safeAreaLayoutGuide.trailingAnchor),
            mapView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            mapView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        if let binding = location,
        let loc = binding.wrappedValue {
            mapView.region = .init(center: loc, latitudinalMeters: 10, longitudinalMeters: 10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MapView {
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        mapView.region = .init(center: userLocation.coordinate, span: .init(latitudeDelta: CLLocationDegrees.pi, longitudeDelta: CLLocationDegrees.pi))
      
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userl = locations.first
        mapView.region = .init(center: userl!.coordinate, latitudinalMeters: 100, longitudinalMeters: 100)
        return
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        locationManager.requestLocation()
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
}
struct MapViewSwiftUIView: UIViewRepresentable {
    
    @Binding var location: CLLocationCoordinate2D?
    
    func makeUIView(context: Context) -> MapView {
        return MapView(location: $location)
    }
    
    func updateUIView(_ uiView: MapView, context: Context) {
        
    }
    
    typealias UIViewType = MapView
}

extension MapView{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            // Customize the appearance of the annotation view
            let identifier = "CustomAnnotation"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

            if annotationView == nil {
                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
                let button = UIButton(type: .detailDisclosure)
                annotationView?.rightCalloutAccessoryView = button
            } else {
                annotationView?.annotation = annotation
            }

            return annotationView
        }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
          // Handle accessory control tap
          if control == view.rightCalloutAccessoryView {
              if let annotation = view.annotation {
                  print("Tapped annotation: \(String(describing: annotation.title ?? ""))")
              }
          }
      }
}
