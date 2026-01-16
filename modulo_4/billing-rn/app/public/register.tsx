import React, { useState } from "react";
import { View, Text, TextInput, Pressable, Alert } from "react-native";
import { Link, router } from "expo-router";
import { useAuth } from "../../src/auth/AuthContext";

export default function RegisterScreen() {
  const { register } = useAuth();
  const [username, setUsername] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [loading, setLoading] = useState(false);

  async function onSubmit() {
    if (!username || !email || !password) {
      Alert.alert("Faltan datos", "Completa username, email y password.");
      return;
    }
    try {
      setLoading(true);
      await register({ username, email, password });
      Alert.alert("Listo", "Usuario creado. Ahora inicia sesión.");
      router.replace("/public/login");
    } catch (e: any) {
      Alert.alert("Error", e?.response?.data ? JSON.stringify(e.response.data) : "No se pudo registrar.");
    } finally {
      setLoading(false);
    }
  }

  return (
    <View style={{ flex: 1, padding: 16, justifyContent: "center", gap: 10, backgroundColor: "#0d1117" }}>
      <Text style={{ fontSize: 22, fontWeight: "900", color: "#c9d1d9" }}>Registro</Text>

      <TextInput
        placeholder="Username"
        autoCapitalize="none"
        value={username}
        onChangeText={setUsername}
        style={{ borderWidth: 1, borderColor: "#30363d", padding: 12, borderRadius: 10, color: "#c9d1d9", backgroundColor: "#161b22" }}
        placeholderTextColor="#8b949e"
      />

      <TextInput
        placeholder="Email"
        autoCapitalize="none"
        keyboardType="email-address"
        value={email}
        onChangeText={setEmail}
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
          {loading ? "Registrando..." : "Crear cuenta"}
        </Text>
      </Pressable>

      <Link href="/public/login" style={{ color: "#58a6ff", fontWeight: "800" }}>Ya tengo cuenta → Login</Link>
    </View>
  );
}