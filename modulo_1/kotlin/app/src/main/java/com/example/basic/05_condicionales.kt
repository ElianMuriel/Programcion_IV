package com.example.basic

fun main(){
    println("!Estructura de Control!!!")
    println("!Condicionales!!!")
    val value1 = 10
    val value2 = 15
    if (value1>value2){
        println("El mayor es ${value1}")
    }else{
        println("El mayor es ${value2}")
    }

    println("Rango segun nivel de la fuerza")
    var fuerza: Int = 10
    if (fuerza > 10){
        println("Maestro")
    } else if (fuerza > 5){
        println("Caballero Jedi")
    } else {
        println("Padawan")
    }

    var tipoDroide: String = "BB-8"
    when(tipoDroide){
        "R2-D2", "R2-Q5"->println("Droide astromecanico")
        "C-3PO", "C-3PA"->println("Droide de protocolo")
        "BB-8", "BB-9E"->println("Droide de nueva generacion")
        else->println("Modelo Desconocido")
    }

    var peligro: Int = 10
    var recompensa: Int = 50
    when{
        peligro>8 && recompensa< 1000 ->println("Misión Rechazada")
        peligro<=3 ->println("Misión Aceptada")
        else->println("Requiere Evaluación Adicional")
    }

    var colorSemaforo: String = "Azul"
    var estadoCalle: String = "Trafico"
    when{
        colorSemaforo == "Verde"->println("Avanzar")
        colorSemaforo == "Amarillo" && estadoCalle == "Vacio" ->println("Avanzar con precaucion")
        colorSemaforo == "Amarillo" && estadoCalle == "Trafico" ->println("Esperar")
        colorSemaforo == "Rojo"->println("Esperar")
        else->println("Semaforo dañado")
    }

    var mesNacimiento: String = ""
    when(mesNacimiento){
        "enero", "mayo", "septiembre"->println("Aire")
        "febrero", "junio", "octubre"->println("Agua")
        "marzo", "julio", "noviembre"->println("Fuego")
        "abril", "agosto", "diciembre"->println("Tierra")
        else->println("Mal escrito")
    }
}