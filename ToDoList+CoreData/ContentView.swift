//
//  ContentView.swift
//  ToDoList+CoreData
//
//  Created by Стас Жингель on 16.01.2021.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Task.date, ascending: false)])
    private var tasks: FetchedResults<Task>
    var body: some View {
        NavigationView {
            List {
                ForEach(tasks) { task in
                    Text(task.title ?? "Untitled")
                        .onTapGesture(count: 1) {
                            updateTask(task)
                        }
                    
                } .onDelete(perform: DeleteTasks)
            }
            .navigationBarTitle("ToDo List 📝")
            .navigationBarItems(trailing: Button("Add") {
                addTask()
            })
        }
    }
    private func saveContext() {
        do {
        try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("Unresolved Error \(error)")
        }
    }
    private func updateTask(_ task: FetchedResults<Task>.Element) {
        withAnimation{
            task.title = "Updated"
            saveContext()
        }
    }
    private func addTask() {
        let newtask = Task(context: viewContext)
        newtask.title = "New Task \(Date())"
        newtask.date = Date()
      saveContext()
    }
    private func DeleteTasks(offsets: IndexSet) {
        withAnimation{
            offsets.map { tasks[$0] }.forEach(viewContext.delete)
            saveContext()
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
