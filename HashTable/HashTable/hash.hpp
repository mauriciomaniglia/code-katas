//
//  hash.hpp
//  HashTable
//
//  Created by Mauricio Maniglia on 26/06/22.
//

#ifndef hash_hpp
#define hash_hpp

#include <stdio.h>
#include <iostream>
#include <string>

class hash {
private:
    static const int tableSize = 10;

    struct item {
        std::string name;
        std::string drink;
        item* next;
    };

    item* HashTable[tableSize];

public:
    hash();
    int Hash(std::string key);
    void AddItem(std::string name, std::string drink);
    int NumberOfItemsInIndex(int index);
    void PrintTable();
    void PrintItemsAtIndex(int index);
    void FindDrink(std::string name);
};

#endif /* hash_hpp */
