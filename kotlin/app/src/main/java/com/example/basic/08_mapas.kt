package com.example.basic

fun main(){
    println("Mapas")

    val fuerzaJedis = mapOf(
        "Luke" to 85,
        "leia" to 80,
        "Obi-Wan" to 95,
        "Yoda" to 100
    )
    println("Fuerza de los Jedis : ${fuerzaJedis}")

    println("Mapa Mutable")

    val misionesCompletadas = mutableMapOf<String, Int>()
    misionesCompletadas ["Luke"] = 15
    misionesCompletadas ["leia"] = 12
    misionesCompletadas.put ("Han", 20)

    println("Misiones : ${misionesCompletadas}")

    for((jedi, fuerza) in fuerzaJedis)
        println("$jedi tiene nivel de fuerza $fuerza")

    val planetasVisitados = setOf("Tatooine", "Coruscant", "Dagobah")
    println("Planetas visitados: ${planetasVisitados}")

    val planetasPeligrosos = setOf("Mustafar", "Coruscant", "Korriban")
    println("Planetas peligrosos: ${planetasPeligrosos}")

    println("Operaciones de conjuntos")
    val interseccion = planetasPeligrosos intersect planetasVisitados
    val union = planetasPeligrosos union planetasVisitados
    val diferencia = planetasPeligrosos - planetasVisitados
    println("Planetas visitados y peligrosos: ${interseccion}")
    println("Todos los plantas: ${union}")
    println("Planetas seguros visitados: ${diferencia}")
}