package com.example.exercises

fun main() {
    print("Ingrese un número N: ")
    val n = readLine()?.toIntOrNull()

    if (n == null || n < 1) {
        println("Número inválido")
        return
    }

    var contador = 0

    for (i in 1..n) {
        if (i % 2 == 0) {
            contador++
        }
    }

    println("Hay $contador números pares entre 1 y $n.")
}
