package com.example.basic

fun main(){
    println("Listas")
    val inmutableLista: List<Int> = listOf(1,2,3)
    println("Lista inmutable ${inmutableLista}")

    val mutableLista: MutableList<Int> = mutableListOf(4,5,6)
    println("Lista Mutable ${mutableLista}")
    mutableLista.add(7)
    println("Lista Mutable ${mutableLista}")
    mutableLista.removeAt(index = 0)
    println("Lista Mutable ${mutableLista}")

    for(mutable in mutableLista) println(mutable)

    println("Opercaiones con Mutable list")

    val colores = mutableListOf<String>("rojo", "verde")
    colores.add("azul")
    colores+="amarillo"
    println(colores)
    colores.remove("verde")
    println(colores)
    colores.removeAt(0)
    println(colores)
    colores[0]="negro"
    println(colores)
    colores.clear()
    println(colores.isEmpty())

    println("Busquedas con mutable list")
    val nombres = mutableListOf<String>("juan", "luis", "pedro")
    println(nombres.find { it.startsWith("l") })
    println(nombres.firstOrNull { it.length>4 })
    println(nombres.any { it.contains('p') })
    println(nombres.none { it =="X" })

    println("ordenamiento con mutable list")
    val numerosDesordenados = mutableListOf<Int>(8,3,2,4,0,6,7,2,7)
    println(numerosDesordenados.sorted())
    println(numerosDesordenados.sortedDescending())
    println(numerosDesordenados.distinct())
}
