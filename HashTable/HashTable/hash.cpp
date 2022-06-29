//
//  hash.cpp
//  HashTable
//
//  Created by Mauricio Maniglia on 26/06/22.
//

#include <iostream>
#include <string>

#include "hash.hpp"

hash::hash() {
    for(int i = 0; i < tableSize; i++) {
        HashTable[i] = new item;
        HashTable[i]->name = "empty";
        HashTable[i]->drink = "empty";
        HashTable[i]->next = NULL;
    }
}

int hash::Hash(std::string key) {
    int hash = 0;
    int index;

    for(int i = 0; i < key.length(); i++) {
        hash = hash + (int)key[i];
    }

    index = hash % tableSize;

    return index;
}

void hash::AddItem(std::string name, std::string drink) {
    int index = Hash(name);

    if (HashTable[index]->name == "empty") {
        HashTable[index]->name = name;
        HashTable[index]->drink = drink;
        HashTable[index]->next = NULL;
    } else {
        item* newItem = new item;
        newItem->name = name;
        newItem->drink = drink;
        newItem->next = NULL;

        item* current = HashTable[index];
        while(current->next != NULL) {
            current = current->next;
        }

        current->next = newItem;
    }
}

int hash::NumberOfItemsInIndex(int index) {
    int count = 0;

    if (HashTable[index]->name == "empty") {
        return 0;
    } else {
        count++;

        item* currentItem = HashTable[index];
        while(currentItem->next != NULL) {
            currentItem = currentItem->next;
            count++;
        }
    }

    return count;
}

void hash::PrintTable() {
    int number;

    for(int i = 0; i < tableSize; i++) {
        number = NumberOfItemsInIndex(i);
        std::cout << "-------------------------\n" << std::endl;
        std::cout << "index = " << i << std::endl;
        std::cout << HashTable[i]->name << std::endl;
        std::cout << HashTable[i]->drink << std::endl;
        std::cout << "# of items = " << number << std::endl;
        std::cout << "-------------------------\n" << std::endl;
    }
}

void hash::PrintItemsAtIndex(int index) {
    item* currentItem = HashTable[index];

    if (currentItem->name == "empty") {
        std::cout << "Index " << index << " is empty" << std::endl;
    } else {
        std::cout << "Index " << index << " contains the following items" << std::endl;

        while (currentItem != NULL) {
            std::cout << "------------------------\n";
            std::cout << currentItem->name << std::endl;
            std::cout << currentItem->drink << std::endl;
            std::cout << "------------------------\n";

            currentItem = currentItem->next;
        }
    }
}
