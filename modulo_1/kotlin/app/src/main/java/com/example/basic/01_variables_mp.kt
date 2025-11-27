package com.example.basic

fun main(){
    println("Variables en mi proyecto de inmobiliaria")
    val planeta = "Tatooine"
    var jedi = "Anakin"

    jedi = "Obiwan"
    println("Precio de la propiedad: ")
    val precio: Int = 25
    println(precio)
    println("Altura de la propiedad: ")
    val alto: Double = 25.5
    println(alto)
    println("Ancho de la propiedad:")
    val ancho: Float = 25.5f

    
    println(ancho)
    println("Metros cuadrados de la propiedad:")
    val poblacion: Long = 2_000_000_000L
    println(poblacion)
    println("Nombre de la Propiedad:")
    val nombre: String = "Obi-Wan Kenobi"
    println(nombre)
    println("Tipo Char")
    /*un solo valor*/
    val inicial: Char = '0'
    println(inicial)
    println("Tipo Logico")
    val esJedi: Boolean = true
    println(esJedi)
    println("Nulidad")
    /*no acepta nulos*/
    val apellido: String? = "null"
    println(apellido)
    println("Nulidad")
    /*no acepta nulos*/
    val ciudad: String? = ""
    println(ciudad?.length)

    println("Operación de asercion no null")
    /*Para las excepciones(error)*/
    val longitudSegura = apellido!!.length

    println("Interpolacion" +
            "" +
            " de strings")
    val nombrePrincesa: String = "Leia"
    val edadPrincesa: Int = 19
    val planetaPrincesa: String = "Alderan"

    println("${nombrePrincesa.uppercase()} nacio en ${planetaPrincesa}")
    println("En 10 años tendra: ${edadPrincesa+10} anios")

    println("String Multilinea")
    val mensaje: String = """
        Querido: $nombre
        Tu mision en $planeta
        ah sido completada exitosamente.
    """.trimIndent()
    println(mensaje)
    println("Conversiones")
    val textoEdad: String = "25"
    val edadConvertida: Int = textoEdad.toInt()
    println(edadConvertida)

    val numero: Double = 50.8
    val numeroConvertido: String = numero.toString()
    println(numeroConvertido)
}