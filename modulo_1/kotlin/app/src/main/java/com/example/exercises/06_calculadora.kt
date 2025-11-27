package com.example.exercises

fun main() {
    var opcion: Int
    do {
        println("\n--- Calculadora ---")
        println("1) Sumar")
        println("2) Restar")
        println("3) Salir")
        print("Elige una opción: ")
        opcion = readLine()?.toIntOrNull() ?: 0

        when (opcion) {
            1 -> {
                print("Ingrese el primer número: ")
                val a = readLine()?.toDoubleOrNull() ?: 0.0
                print("Ingrese el segundo número: ")
                val b = readLine()?.toDoubleOrNull() ?: 0.0
                println("Resultado: ${a + b}")
            }
            2 -> {
                print("Ingrese el primer número: ")
                val a = readLine()?.toDoubleOrNull() ?: 0.0
                print("Ingrese el segundo número: ")
                val b = readLine()?.toDoubleOrNull() ?: 0.0
                println("Resultado: ${a - b}")
            }
            3 -> println("Saliendo...")
            else -> println("Opción inválida")
        }
    } while (opcion != 3)
}
