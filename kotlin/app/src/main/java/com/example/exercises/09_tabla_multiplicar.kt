package com.example.exercises

fun main() {
    print("Ingrese un número: ")
    val numero = readLine()?.toIntOrNull()

    if (numero == null) {
        println("Número inválido")
        return
    }

    println("Tabla de multiplicar del $numero:")
    for (i in 1..12) {
        println("$numero x $i = ${numero * i}")
    }
}
