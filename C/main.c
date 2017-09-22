/* 
 * The main function, testing our PCP stack implementation.
 * 
 * Author: ruedi.arnold@hslu.ch
 */

#include <stdio.h>
#include <stdlib.h>
#include "stack.h"

/*
 * 
 */
int main(int argc, char** argv) {
    // Aufgabe 1

    /*
    int n = 7;

    printNumbersGoto(n);
    printf("= printNumbersGoto(%i)\n", n);
    printNumbersFor(n);
    printf("= printNumbersFor(%i)\n", n);
    printNumbersRecursiveFunction(n);
    printf("= printNumbersRecursiveFunction(%i)\n", n);
    */

    // Aufgabe 2

    stack myStack = init();
    printf("size(myStack) = %i\n", size(myStack));
    printf("isEmpty(myStack) = %i\n", isEmpty(myStack));
    print(myStack);
    top(myStack);
    myStack = push(42, myStack);
    myStack = push(77, myStack);
    myStack = push(1, myStack);
    printf("size(myStack) = %i\n", size(myStack));
    printf("isEmpty(myStack) = %i\n", isEmpty(myStack));
    print(myStack);

    // 2.c: man kann den stack einfach frisch initialisieren
    // daher macht es nicht viel sinn, eine clear methode zo machen
}

void printNumbersGoto(int n){
    int i = 0;
    start:
    printf("%i ", i++);
    if (i <= n) {
        goto start;
    }
}

void printNumbersFor(int n){
    for (int i = 0; i <= n; i++ ){
        printf("%i ", i);
    }

}

void printNumbersRecursiveFunction(int n) {
    if(n > 0) {
        printNumbersRecursiveFunction(n - 1);
    }
    printf("%i ", n);
}