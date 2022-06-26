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
    tableSize = 100;
}

int hash::Hash(std::string key) {
    int hash = 0;
    int index;

    for(int i = 0; i < key.length(); i++) {
        hash = hash + (int)key[i];
    }

    index = hash / tableSize;

    return index;
}
