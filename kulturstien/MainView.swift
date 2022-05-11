//
//  MainView.swift
//  kulturstien
//
//  Created by Tina on 10/05/2022.
//

import SwiftUI

private var menuItems = [
	MenuItem(title: "Kart", iconName: "map", page: .map),
	//MenuItem(title: "Utfordringer", iconName: "gamecontroller"),
	
	//MenuItem(title: "Prestasjoner", iconName: "star"),
	MenuItem(title: "Prestasjoner", iconName: "list.star", page: .achievments),
	MenuItem(title: "Tekster", iconName: "book.closed", page: .readingMaterial),
	//books.vertical scroll
	MenuItem(title: "Profil", iconName: "person", page: .profile)
]

struct MainView: View {
	
	init() {
		//UITableView.appearance().separatorStyle = .none
		UITableViewCell.appearance().backgroundColor = UIColor(Color("LightBlue"))
		UITableViewCell.appearance().selectionStyle = .none
		UITableView.appearance().backgroundColor = UIColor(Color("LightBlue"))
	}
	
    var body: some View {
		NavigationView {
			
			List {
				ForEach(menuItems) { item in
					ZStack(alignment: .topLeading) {
						Label(item.title, systemImage: item.iconName)
						NavigationLink(destination: DetailView(page: item.page)) {
							//Rectangle().opacity(0.0)
						}.opacity(0.0)
					}//.listRowBackground(item == selectedTab ? Color.accentColor : Color.gray)
					.listRowBackground(Color("LightBlue"))
					.listRowSeparator(.hidden)
					.foregroundColor(Color("DarkGreen"))
					//.font(.title3)
					.font(Font.custom("AmericanTypewriter-Semibold", size: 20))
				}
			}
			Spacer()
		}
		.accentColor(.black)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
		MainView()
			.previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
			.previewDisplayName("iPhone 13 Pro Max")
		MainView()
			.previewInterfaceOrientation(.landscapeLeft)
			.previewDevice(PreviewDevice(rawValue: "iPad (8th generation)"))
			.previewDisplayName("iPad (8th generation)")
    }
}

/*
 
 ForEach(menuItems) { item in
	 
	 NavigationLink(destination: DetailView()) {
		 Label(item.title, systemImage: item.iconName)
		 // puzzlepiece, crown, trophy?
	 }
	 .listRowBackground(Color("DarkGreen"))
	 .listRowSeparator(.hidden)
	 .foregroundColor(.black)
	 .font(.title3)
 }
 
 
 UITableViewCell.appearance().backgroundColor = .clear
 UITableView.appearance().backgroundColor = .clear
 
 
 NavigationView {
 List {
	NavigationLink(destination: DetailView()) {
			Label("Kart", systemImage: "map")
				 }
				 NavigationLink(destination: DetailView()) {
					 Label("Utfordringer", systemImage: "gamecontroller")
					 // puzzlepiece, crown, trophy?
				 }
				 NavigationLink(destination: DetailView()) {
					 Label("Profil", systemImage: "person")
				 }
			 }
			 .listStyle(.sidebar)
 
 
 
 List {
	 NavigationLink("Kart", destination: DetailView())
	 NavigationLink("Utfordinger", destination: DetailView())
	 NavigationLink("Profil", destination: DetailView())
 }
 .listStyle(.insetGrouped)
 
 
 List {
	 NavigationLink(destination: DetailView()) {
		Label("Kart", systemImage: "map")
	 }
	 NavigationLink(destination: DetailView()) {
		 Label("Utfordringer", systemImage: "gamecontroller")
		 // puzzlepiece, crown, trophy?
	 }
	 NavigationLink(destination: DetailView()) {
		 Label("Profil", systemImage: "person")
	 }
 }
 //.listStyle(.insetGrouped)
 .foregroundColor(.black)
 .background(Color("DarkGreen"))
}
 
 
 ZStack {
	 Color("DarkGreen")
		 .ignoresSafeArea()
	 
	 VStack {
			 NavigationLink(destination: DetailView()) {
				Label("Kart", systemImage: "map")
			 }
			 NavigationLink(destination: DetailView()) {
				 Label("Utfordringer", systemImage: "gamecontroller")
				 // puzzlepiece, crown, trophy?
			 }
			 NavigationLink(destination: DetailView()) {
				 Label("Profil", systemImage: "person")
			 }
		 //.listStyle(.insetGrouped)
		 //.background(Color("DarkGreen"))
		 )
	 }
	 .foregroundColor(.black)
	 
 }
 
}
		 
		 }*/
