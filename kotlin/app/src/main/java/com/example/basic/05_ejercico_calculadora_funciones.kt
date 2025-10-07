package com.example.basic

fun sumaCalc(a: Int, b: Int): Int{
    return a+b
}
fun restaCalc(a: Int, b: Int): Int{
    return a-b
}
fun multiplicarCalc(a: Int, b:Int): Int{
    return a*b
}
fun divCalc(a: Int, b: Int): Int{
    return a/b
}
fun main(){
    println("Ingrese el valor 1: ")
    val valora: Int = readLine()?.toIntOrNull()?:0
    println("Ingrese el valor 2: ")
    val valorb: Int = readLine()?.toIntOrNull()?:0
    println(sumaCalc(valora, valorb))
    println(restaCalc(valora, valorb))
    println(multiplicarCalc(valora, valorb))
    println(divCalc(valora, valorb))
}