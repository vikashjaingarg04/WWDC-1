//
//import SwiftUI
//
//struct GreetingView: View {
//    @State private var username = "Shruti" // Replace with dynamic username if needed
//    
//    var body: some View {
//        VStack {
//            Text("Welcome, \(username)!")
//                .font(.largeTitle)
//                .fontWeight(.bold)
//                .padding()
//            Image("image1") // Make sure the image is in Assets
//                .resizable()
//                .scaledToFit()
//                .frame(width: 200, height: 200)
//                .clipShape(Circle()) // Makes it round
//                .overlay(Circle().stroke(Color.blue, lineWidth: 4))
//                .shadow(radius: 5)
//                .padding()
//
//            
//            Text("Let's get started with your tasks!")
//                .font(.title2)
//                .foregroundColor(.gray)
//                .padding()
//            
//            NavigationLink(destination: ContentView()) {
//                Text("Continue")
//                    .font(.headline)
//                    .foregroundColor(.white)
//                    .padding()
//                    .frame(width: 200)
//                    .background(Color.blue)
//                    .cornerRadius(10)
//            }
//            .padding()
//        }
//    }
//}
//
//struct ContentView: View {
//    @State private var tasks = ["Wash Clothes", "Study", "App development"]
//    @State private var newTask = ""
//    var body: some View {
//        NavigationView {
//            VStack {
//                HStack {
//                    TextField("Enter new task", text: $newTask)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding()
//                    
//                    Button(action: addTask) {
//                        Image(systemName: "plus.circle.fill")
//                            .font(.title)
//                            .foregroundColor(.red)
//                    }
//                    .padding(.trailing)
//                }
//                
//                List {
//                    ForEach(tasks, id: \.self) { task in
//                        Text(task)
//                    }
//                    .onDelete(perform: deleteTasks)
//                }
//            }
//            .navigationBarTitle("To-Do List")
//            .navigationBarItems(trailing: EditButton()) // Enables swipe to delete
//        }
//    }
//    
//    func addTask() {
//        if !newTask.trimmingCharacters(in: .whitespaces).isEmpty {
//            tasks.append(newTask)
//            newTask = ""  // Clear input field
//        }
//    }
//    
//    func deleteTasks(at offsets: IndexSet) {
//        tasks.remove(atOffsets: offsets)
//    }
//}
//












import SwiftUI

struct GreetingView: View {
    @State private var username = "Shruti" // Replace with dynamic username if needed
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome, \(username)!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                Image("image1") // Ensure the image is in Assets
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle()) // Makes it round
                    .overlay(Circle().stroke(Color.blue, lineWidth: 0))
                    .shadow(radius: 5)
                    .padding()

                Text("Let's get started with your tasks!")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding()
                
                NavigationLink(destination: ContentView()) {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationTitle("")
        }
    }
}

struct ContentView: View {
    @State private var tasks = ["Wash Clothes", "Study", "App development"]
    @State private var newTask = ""

    var body: some View {
        VStack {
            HStack {
                TextField("Enter new task", text: $newTask)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: addTask) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .foregroundColor(.red)
                }
                .padding(.trailing)
            }
            
            List {
                ForEach(tasks, id: \.self) { task in
                    Text(task)
                }
                .onDelete(perform: deleteTasks)
            }
        }
        .navigationTitle("To-Do List")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
        }
    }

    func addTask() {
        if !newTask.trimmingCharacters(in: .whitespaces).isEmpty {
            tasks.append(newTask)
            newTask = ""  // Clear input field
        }
    }

    func deleteTasks(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}


