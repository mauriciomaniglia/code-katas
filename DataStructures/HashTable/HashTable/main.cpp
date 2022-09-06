//
//  main.cpp
//  HashTable
//
//  Created by Mauricio Maniglia on 26/06/22.
//

#include <iostream>

#include "hash.hpp"

int main(int argc, const char * argv[]) {
    hash customHash;
    std::string name;

    customHash.AddItem("Paul", "Locha");
    customHash.AddItem("Kim", "Iced Locha");
    customHash.AddItem("Emma", "Strawberry Smoothy");
    customHash.AddItem("Annie", "Hot Chocolate");
    customHash.AddItem("Sarah", "Passion Tea");
    customHash.AddItem("Pepper", "Caramel Mocha");
    customHash.AddItem("Mike", "Chai Tea");
    customHash.AddItem("Steve", "Apple Cider");
    customHash.AddItem("Bill", "Root Beer");
    customHash.AddItem("Marie", "Skinny Latte");
    customHash.AddItem("Susan", "Water");
    customHash.AddItem("Joe", "Green Tea");

    customHash.PrintTable();

    while (name != "Exit") {
        std::cout << "Remove ";
        std::cin >> name;

        if (name != "Exit") {
            customHash.RemoveItem(name);

            customHash.PrintTable();
        }
    }

    return 0;
}
