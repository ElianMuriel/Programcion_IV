package com.example.exercises

fun main() {
    print("Ingrese su edad: ")
    val edad = readLine()?.toIntOrNull()

    if (edad == null || edad < 0) {
        println("Edad inválida")
        return
    }

    val precio = when {
        edad < 12 -> 3
        edad >= 65 -> 4
        else -> 5
    }

    println("El precio de su entrada es: $$precio")
}