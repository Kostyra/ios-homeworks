import UIKit
import MapKit
import  CoreLocation

final class MapViewController:UIViewController,CLLocationManagerDelegate {
    
    
    //MARK: - Properties
    
    private lazy var mapView: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        map.showsTraffic = true
        map.mapType = .standard
        return map
    }()
    
    private lazy var locationManager = CLLocationManager()
    private lazy var gestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(handleTap(_:)))
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
        checkUserLocation()
        mapView.addGestureRecognizer(gestureRecognizer)
    }
    
    //MARK: - Method
    
    private func setupMapView() {
        view.addSubview(mapView)
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func checkUserLocation() {
        if #available(iOS 14.0, *) {
            switch locationManager.authorizationStatus {
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted, .denied:
                print("Please give your location")
            case .authorizedAlways, .authorizedWhenInUse:
                mapView.showsUserLocation = true
                locationManager.delegate = self
            @unknown default:
                fatalError("Error")
            }
        } else {
            fatalError("Oyyps")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            if let location = locationManager.location?.coordinate {
                let region = MKCoordinateRegion(center: location, latitudinalMeters: 3000, longitudinalMeters: 3000)
                mapView.setRegion(region, animated: true)
            }
        }
    }
    
    
    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        let location = gestureRecognizer.location(in: mapView)
        let coordinate = mapView.convert(location, toCoordinateFrom: mapView)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)

        if let currentLocation = locationManager.location?.coordinate {
            let directionRequest = MKDirections.Request()
            directionRequest.transportType = .automobile
            let sourcePlacemark = MKPlacemark(coordinate:currentLocation)
            directionRequest.source = MKMapItem(placemark: sourcePlacemark)
            let destinationPlacemark = MKPlacemark(coordinate: coordinate)
            directionRequest.destination = MKMapItem(placemark: destinationPlacemark)
            
            let directions = MKDirections(request: directionRequest)
            directions.calculate { response, error in
                guard let route = response?.routes.first else { return }
                self.mapView.delegate = self
                self.mapView.addOverlay(route.polyline)
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let annotation = view.annotation {
            mapView.removeAnnotation(annotation)
            mapView.removeOverlays(mapView.overlays)
        }
    }
}


//MARK: - Extension
extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = .blue
            renderer.lineWidth = 5
            return renderer
    }
}
