package com.example.basic

fun main(){
    println("!Bucles")
    val jedis = listOf("Luke", "Leia", "Obi-wan", "Yoda", "Ahsoka")
    for ((index, jedi) in jedis.withIndex()){
        println("${index + 1}.$jedi")
    }
    // rangos de paso
    for (i in 0 .. 20 step 5){
        println("Energia: $i%")
    }
    // rangos decendente
    for (countdown in 10 downTo  1){
        println("Despegue en: $countdown")
    }
    // Control de flujo
    for (jedi in jedis){
        if(jedi == "Obi-wan") continue // saltar esta interacion
        if(jedi == "Yoda") break // saltar esta interacion
        println("entrenando a $jedi")
    }
}