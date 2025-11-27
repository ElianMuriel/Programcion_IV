package com.example.exercises

fun main() {
    print("Ingrese una contraseña: ")
    val contrasena = readLine() ?: ""

    val tieneLongitudValida = contrasena.length >= 8
    val tieneDigito = contrasena.any { it.isDigit() }

    if (tieneLongitudValida && tieneDigito) {
        println("Contraseña válida")
    } else {
        println("Contraseña inválida (debe tener al menos 8 caracteres y un dígito.)")
    }
}
