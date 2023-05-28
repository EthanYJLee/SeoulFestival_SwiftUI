//
//  MapVIew.swift
//  festivalSeoul
//
//  Created by 권순형 on 2023/04/03.
//

import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Map()
            
            // map 에 버튼 추가하기
            VStack{
                Button(action: {
                    // Handle button tap
                }) {
                    Image(systemName: "location.fill")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                }
                .padding(5)
                
                Button(action: {
                    // Handle button tap
                }) {
                    Image(systemName: "location.fill")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                }
                .padding(5)
                
                Button(action: {
                    // Handle button tap
                }) {
                    Image(systemName: "location.fill")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                }
                .padding(5)
            }
            .padding(10)
        }
    }
}

struct Map: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        
        let coordinate = CLLocationCoordinate2D(latitude: 37.5519, longitude: 126.9918)
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "서울시"
//        annotation.subtitle = "Cupertino, CA"
        view.addAnnotation(annotation)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
