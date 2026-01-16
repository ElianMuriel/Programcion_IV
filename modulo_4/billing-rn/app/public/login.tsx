import React, { useState } from "react";
import { View, Text, TextInput, Pressable, Alert } from "react-native";
import { Link } from "expo-router";
import { useAuth } from "../../src/auth/AuthContext";

export default function LoginScreen() {
  const { login } = useAuth();
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [loading, setLoading] = useState(false);

  async function onSubmit() {
    if (!username || !password) {
      Alert.alert("Faltan datos", "Completa username y password.");
      return;
    }
    try {
      setLoading(true);
      await login({ username, password });
      Alert.alert("Bienvenido", "Sesión iniciada.");
    } catch (e: any) {
      Alert.alert("Error", e?.response?.data ? JSON.stringify(e.response.data) : "No se pudo iniciar sesión.");
    } finally {
      setLoading(false);
    }
  }

  return (
    <View style={{ flex: 1, padding: 16, justifyContent: "center", gap: 10, backgroundColor: "#0d1117" }}>
      <Text style={{ fontSize: 22, fontWeight: "900", color: "#c9d1d9" }}>Login</Text>

      <TextInput
        placeholder="Username"
        autoCapitalize="none"
        value={username}
        onChangeText={setUsername}
        style={{ borderWidth: 1, borderColor: "#30363d", padding: 12, borderRadius: 10, color: "#c9d1d9", backgroundColor: "#161b22" }}
        placeholderTextColor="#8b949e"
      />

      <TextInput
        placeholder="Password"
        secureTextEntry
        value={password}
        onChangeText={setPassword}
        style={{ borderWidth: 1, borderColor: "#30363d", padding: 12, borderRadius: 10, color: "#c9d1d9", backgroundColor: "#161b22" }}
        placeholderTextColor="#8b949e"
      />

      <Pressable
        onPress={onSubmit}
        disabled={loading}
        style={{ padding: 12, borderRadius: 10, backgroundColor: loading ? "#30363d" : "#1f6feb" }}
      >
        <Text style={{ color: "white", textAlign: "center", fontWeight: "900" }}>
          {loading ? "Ingresando..." : "Entrar"}
        </Text>
      </Pressable>

      <Link href="/public/register" style={{ color: "#58a6ff", fontWeight: "800" }}>No tengo cuenta → Registro</Link>
    </View>
  );
}