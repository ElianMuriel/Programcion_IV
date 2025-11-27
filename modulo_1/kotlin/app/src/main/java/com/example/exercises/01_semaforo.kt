package com.example.exercises

fun main() {
    print("Ingrese el color del semáforo (rojo, amarillo, verde): ")
    val color = readLine()?.lowercase()

    print("¿El peatón presionó el botón? (si/no): ")
    val boton = readLine()?.lowercase()

    val mensaje = when {
        color == "verde" && boton == "si" -> "Espera a rojo"
        color == "rojo" -> "Cruza"
        color == "amarillo" -> "Prepárate"
        else -> "Espera"
    }

    println(mensaje)
}