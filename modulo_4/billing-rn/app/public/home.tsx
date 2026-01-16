import { Link } from "expo-router";
import { View, Text } from "react-native";

export default function PublicHome() {
  return (
    <View style={{ flex: 1, padding: 16, justifyContent: "center", gap: 12, backgroundColor: "#0d1117" }}>
      <Text style={{ fontSize: 22, fontWeight: "900", color: "#c9d1d9" }}>Área pública</Text>
      <Text style={{ color: "#8b949e" }}>
        En la Parte 2 construiremos el layout público y mostraremos categorías y productos.
      </Text>

      <Link href="/public/login" style={{ color: "#58a6ff", fontWeight: "800" }}>Ir a Login</Link>
      <Link href="/public/register" style={{ color: "#58a6ff", fontWeight: "800" }}>Ir a Registro</Link>
    </View>
  );
}