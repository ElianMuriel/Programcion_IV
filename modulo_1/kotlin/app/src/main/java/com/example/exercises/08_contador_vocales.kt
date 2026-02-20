package com.example.exercises

fun main() {
    print("Ingrese una palabra o texto: ")
    val texto = readLine()?.lowercase() ?: ""

    val vocales = listOf('a', 'e', 'i', 'o', 'u')
    var contador = 0

    for (letra in texto) {
        if (letra in vocales) {
            contador++
        }
    }

    println("El texto contiene $contador vocales.")
}
