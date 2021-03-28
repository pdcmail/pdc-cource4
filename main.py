#! /usr/bin/env python3


from functools import reduce
import math
import time
import random

numbers = []


def is_prime(number):
    result = True
    root = int(math.floor(math.sqrt(number)))
    for i in reversed(range(2, root+1)):
        if math.gcd(i, number-i) > 1:
            result = False
            break
    return result


def get_num() -> int:
    number = random.randrange(1,3)
    if not (number == 1 or number == 2):
        get_num()
    return number


def factorize(number, step):
    print(f"\nFactorization of number {number}")
    a = int(math.floor(math.sqrt(number)))
    a = a - 1 if a % 2 == 0 else a
    b = a + 2
    delta = number - a * b
    print(f"a - {a}\tb - {b}\td - {delta}")
    while delta:
        if delta > 0:
            x = math.floor(delta / a)
            if x > 2:
                b = b + x if x % 2 == 0 else b + x - 1
            else:
                b = b + step
        else:
            a = a - step
        delta = number - a * b
        print(f"a - {a}\tb - {b}\td - {delta}")
    for i in a, b:
        if not is_prime(i):
            factorize(i, step)
        else:
            numbers.append(i)


if __name__ == '__main__':
    variant = 28
    check_num = reduce(lambda x, y: x*y, [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]) + variant
    print(f"Number for the factorization: {check_num}")
    step = get_num()
    start_time = time.time()
    factorize(check_num, step)
    print(f"Result: {numbers}\nTime: {time.time() - start_time:.3f} sec")