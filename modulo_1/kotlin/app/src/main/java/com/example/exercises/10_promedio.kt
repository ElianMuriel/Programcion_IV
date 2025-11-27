package com.example.exercises

fun main() {
    println("Ingrese tres notas (0 a 20):")

    print("Ingrese la nota 1: ")
    val nota1 = readLine()?.toDoubleOrNull() ?: -1.0 /*el -1 es un marcador de error, para ponerlo por defecto en caso de null*/

    print("Ingrese la nota 2: ")
    val nota2 = readLine()?.toDoubleOrNull() ?: -1.0

    print("Ingrese la nota 3: ")
    val nota3 = readLine()?.toDoubleOrNull() ?: -1.0

    // Validación de rango
    if (nota1 !in 0.0..20.0 || nota2 !in 0.0..20.0 || nota3 !in 0.0..20.0) {
        println("Error: todas las notas deben estar entre 0 y 20.")
        return
    }

    val promedio = (nota1 + nota2 + nota3) / 3
    println("Promedio: %.2f".format(promedio))

    if (promedio >= 14) {
        println("Aprobado")
    } else {
        println("Reprobado")
    }
}
