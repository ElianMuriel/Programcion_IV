package com.example.basic

fun main(){
    println("!Tabla de multiplicar")
    println("Que tabla desea: ")
    val value: Int = readLine()?.toIntOrNull()?:0
    for (tablaMulti in 0 .. 12){
        println(value * tablaMulti)
    }
}