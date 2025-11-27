package com.example.basic

fun main(){
    println("Calculadora")
    println("Incluir primer valor: ")
    val value1: Double = (readLine()?.toDoubleOrNull()?:0) as Double
    println("Incluir segundo valor: ")
    val value2: Double = (readLine()?.toDoubleOrNull()?:0) as Double

    println("Suma: ${value1 + value2}")
    println("Resta: ${value1 - value2}")
    println("Multiplicación: ${value1 * value2}")
    println("Division: ${value1 / value2}")
}