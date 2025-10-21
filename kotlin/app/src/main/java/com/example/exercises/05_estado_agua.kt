package com.example.exercises

fun main() {
    print("Ingrese la temperatura en °C: ")
    val temp = readLine()?.toDoubleOrNull()

    if (temp == null) {
        println("Temperatura inválida")
        return
    }

    val estado = when {
        temp <= 0 -> "Sólido"
        temp in 1.0..99.0 -> "Líquido"
        temp >= 100 -> "Gas"
        else -> "Desconocido"
    }

    println("El agua está en estado: $estado")
}
