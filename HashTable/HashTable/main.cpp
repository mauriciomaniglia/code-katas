//
//  main.cpp
//  HashTable
//
//  Created by Mauricio Maniglia on 26/06/22.
//

#include <iostream>

#include "hash.hpp"

int main(int argc, const char * argv[]) {
    int index;
    hash customHash;

    index = customHash.Hash("JohnJohn");

    std::cout << "Index value: " << index << std::endl;

    return 0;
}
