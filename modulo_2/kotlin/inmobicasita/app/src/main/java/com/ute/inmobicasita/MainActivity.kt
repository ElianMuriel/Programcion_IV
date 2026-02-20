package com.ute.inmobicasita

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.navigation.NavType
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import androidx.navigation.navArgument
import com.ute.inmobicasita.ui.theme.InmobicasitaTheme

data class Property(
    val id: Int,
    val title: String,
    val city: String,
    val price: Double,
    val available: Boolean
)

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            InmobicasitaTheme {
                Surface(color = MaterialTheme.colorScheme.background) {
                    InmobiliariaApp()
                }
            }
        }
    }
}

@Composable
fun InmobiliariaApp() {
    val nav = rememberNavController()

    val properties = remember {
        listOf(
            Property(1, "Depto Bellavista", "Quito", 550.0, true),
            Property(2, "Casa San Carlos", "Quito", 780.0, false),
            Property(3, "Suite Centro Histórico", "Cuenca", 430.0, true),
        )
    }

    NavHost(navController = nav, startDestination = "home") {

        composable("home") {
            HomeScreen(onViewProperties = { nav.navigate("list") })
        }

        composable("list") {
            PropertyListScreen(
                properties = properties,
                onPropertyClick = { id -> nav.navigate("detail/$id") },
                onBack = { nav.popBackStack() }
            )
        }

        composable(
            route = "detail/{id}",
            arguments = listOf(navArgument("id") { type = NavType.IntType })
        ) { backStack ->
            val id = backStack.arguments?.getInt("id") ?: 0
            val prop = properties.first { it.id == id }
            PropertyDetailScreen(property = prop, onBack = { nav.popBackStack() })
        }
    }
}

@Composable
fun HomeScreen(onViewProperties: () -> Unit) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(20.dp),
        horizontalAlignment = Alignment.Start
    ) {
        Text("Inmobiliaria Kotlin", style = MaterialTheme.typography.headlineSmall)
        Spacer(Modifier.height(10.dp))
        Text("Encuentra tu nuevo hogar.", color = MaterialTheme.colorScheme.onBackground)
        Spacer(Modifier.height(30.dp))
        Button(onClick = onViewProperties) {
            Text("Ver propiedades")
        }
    }
}

@Composable
fun PropertyListScreen(properties: List<Property>, onPropertyClick: (Int) -> Unit, onBack: () -> Unit) {
    Column(
        modifier = Modifier.fillMaxSize().padding(16.dp)
    ) {
        Row(verticalAlignment = Alignment.CenterVertically) {
            Button(onClick = onBack, content = { Text("← Atrás") })
            Spacer(Modifier.width(10.dp))
            Text("Propiedades", style = MaterialTheme.typography.titleLarge)
        }

        Spacer(Modifier.height(16.dp))

        LazyColumn {
            items(properties) { p ->
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .clickable { onPropertyClick(p.id) }
                        .padding(vertical = 6.dp),
                    colors = CardDefaults.cardColors(MaterialTheme.colorScheme.surface)
                ) {
                    Column(Modifier.padding(12.dp)) {
                        Text(p.title, style = MaterialTheme.typography.titleMedium)
                        Text("Ciudad: ${p.city}")
                        Text("Precio: ${p.price} USD/mes")
                        Text(
                            text = if (p.available) "Disponible" else "No disponible",
                            color = if (p.available) MaterialTheme.colorScheme.secondary else MaterialTheme.colorScheme.error
                        )
                    }
                }
            }
        }
    }
}

@Composable
fun PropertyDetailScreen(property: Property, onBack: () -> Unit) {
    Column(
        modifier = Modifier.fillMaxSize().padding(16.dp)
    ) {
        Button(onClick = onBack) { Text("← Atrás") }
        Spacer(Modifier.height(10.dp))

        Text(property.title, style = MaterialTheme.typography.headlineSmall)
        Text("Ciudad: ${property.city}")
        Text("Precio: ${property.price} USD/mes")

        Text(
            text = if (property.available) "Disponible" else "No disponible",
            color = if (property.available) MaterialTheme.colorScheme.secondary else MaterialTheme.colorScheme.error
        )
    }
}
