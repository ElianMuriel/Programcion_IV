import { View, Text, Pressable } from "react-native";
import { useAuth } from "../../src/auth/AuthContext";

export default function PrivateHome() {
  const { logout } = useAuth();

  return (
    <View style={{ flex: 1, padding: 16, justifyContent: "center", gap: 12, backgroundColor: "#0d1117" }}>
      <Text style={{ fontSize: 22, fontWeight: "900", color: "#c9d1d9" }}>Área privada</Text>
      <Text style={{ color: "#8b949e" }}>
        En siguientes partes agregaremos: Categorías, Productos, Facturas y Pagos.
      </Text>

      <Pressable onPress={logout} style={{ padding: 12, borderRadius: 10, backgroundColor: "#1f6feb" }}>
        <Text style={{ color: "white", textAlign: "center", fontWeight: "900" }}>Cerrar sesión</Text>
      </Pressable>
    </View>
  );
}