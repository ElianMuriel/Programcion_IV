package com.example.exercises

fun main() {
    print("Ingrese un número N: ")
    val n = readLine()?.toIntOrNull()

    if (n == null || n < 1) {
        println("Número inválido")
        return
    }

    var suma = 0

    for (i in 1..n) {
        if (i % 3 == 0) {
            suma += i
        }
    }

    println("La suma de los múltiplos de 3 desde 1 hasta $n es: $suma")
}
