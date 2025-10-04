package com.example.basic

fun main(){
    println("Calculadora")
    println("Incluir primer valor: ")
    val value1: Int = readLine()?.toIntOrNull()?:0
    println("Incluir segundo valor: ")
    val value2: Int = readLine()?.toIntOrNull()?:0
    println("Que operacion desea realizar?: ")
    val operacion: String? = readLine()

    when(operacion){
        "+"->println("Suma: ${value1 + value2}")
        "-"->println("Resta: ${value1 - value2}")
        "*"->println("Multiplicación: ${value1 * value2}")
        "/"->println("Division: ${value1 / value2}")
    }
}