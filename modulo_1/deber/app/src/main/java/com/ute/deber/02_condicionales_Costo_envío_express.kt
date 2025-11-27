package com.ute.deber

fun main() {
    print("Ingrese la distancia del envio (km): ")
    val distancia = readln().toDouble()

    print("¿Esta lloviendo? (si/no): ")
    val llueve = readln().lowercase()

    val costoBase = when {
        distancia <= 5 -> 2.5
        distancia in 6.0..15.0 -> 5.0
        else -> 8.0
    }

    val costoTotal = if (llueve == "Sí") {
        costoBase + 1.5
    } else {
        costoBase
    }

    println("Costo total del envio: $${costoTotal}")
}