import random

numbers = input('How many passwords needed: ')
letters = '1234567890-=!@#$%^&*()_+asdfghjkl:"zxcvbnm<>?ASDFGHJKL;ZXCVBNM,./QWERTYUIOP[]{}\''
length = input('What is the length of password: ')

for x in range(int(numbers)):
    pwd = ''
    for _ in range(int(length)):
        pwd += random.choice(letters)
    print(pwd)
 
