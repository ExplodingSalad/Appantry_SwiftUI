//
//  ProductsMainView.swift
//  Appantry
//
//  Created by Jan Locher on 21.12.21.
//

import SwiftUI

struct ProductsMainView: View {
    
    @State private var searchText = ""
    @State var isPopoverPresented = false
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
        entity: ProductEntity.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \ProductEntity.productName, ascending: true)
        ]
    ) var fetchedProducts: FetchedResults<ProductEntity>
    
    //    let productData: [ProductData]
    
    var body: some View {
        List {
            ForEach(fetchedProducts) {
                (fetchedProducts:ProductEntity) in
                NavigationLink(destination: ProductDetailView(productItem: fetchedProducts)) {
                    ProductCardView(productItem: fetchedProducts)
                    
                }
            }
            .onDelete(perform: removeProduct)
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        .navigationBarTitle("Products")
        .toolbar {
            Button(action: {
                self.isPopoverPresented = true
            }) {
                Image(systemName: "plus")
            }
        }
        .popover(isPresented: $isPopoverPresented) {
            AddProductPopover()
        }
    }
    
    func addProduct() {
        // TODO: Move logic
        let newProduct = ProductEntity(context: managedObjectContext)
        newProduct.productName = "another product35"
        newProduct.id = UUID()
        newProduct.productVendor = "Lidl"
        newProduct.productCategory = "Dairy"
        newProduct.productStoredQuantity = 3
        
        PersistenceController.shared.save()
    }
    
    func removeProduct(at offsets: IndexSet) {
        for index in offsets {
            let product = fetchedProducts[index]
            managedObjectContext.delete(product)
        }
        PersistenceController.shared.save()
    }
}

struct ProductsMainView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController().container.viewContext
        ProductsMainView()
            .environment(\.managedObjectContext, context)
    }
}
