//
//  testEView.swift
//  psychological_Test
//
//  Created by 周固廷 on 2021/11/27.
//

import SwiftUI
import MapKit

struct testEView: View {
    @State var region=MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 23.507222, longitude: 121.0), span: MKCoordinateSpan(latitudeDelta: 3, longitudeDelta: 3))
    var body: some View {
        Map(coordinateRegion: $region).navigationTitle("我是誰？我在哪裡？")
    }
}

struct testEView_Previews: PreviewProvider {
    static var previews: some View {
        testEView()
    }
}
