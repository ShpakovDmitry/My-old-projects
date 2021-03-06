#ifndef MISC_H
#define MISC_H

#include <stdint.h>
#include <stdbool.h>

bool isOneBitSet (uint8_t x);
int8_t getSetBitPosition (uint8_t x);
uint32_t getDeltaTime (uint32_t t1, uint32_t t0);
uint32_t getJiffies();

#endif // MISC_H

