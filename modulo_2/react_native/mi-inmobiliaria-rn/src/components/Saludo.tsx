import React from "react";
import { View, Text } from "react-native";

export default function Saludo() {
  return (
    <View style={{ padding: 20 }}>
      <Text style={{ fontSize: 20, color: "white" }}>
        ¡Bienvenidos a mi App de inmobiliaria!
      </Text>
    </View>
  );
}