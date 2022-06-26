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
    int tableSize;

public:
    hash();
    int Hash(std::string key);
};

#endif /* hash_hpp */
