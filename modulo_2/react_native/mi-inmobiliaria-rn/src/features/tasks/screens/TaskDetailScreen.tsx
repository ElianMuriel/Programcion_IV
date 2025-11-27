import React from "react";
import { View, Text, StyleSheet } from "react-native";
import MainLayout from "../../../layouts/MainLayout";
import colors from "../../../theme/colors";
import spacing from "../../../theme/spacing";

type Props = {
  route: { params: { id: string } };
};

export default function PropertyDetailScreen({ route }: Props) {
  const { id } = route.params;

  const properties: any = {
    "1": { title: "Depto Bellavista", city: "Quito", price: 550, available: true },
    "2": { title: "Casa San Carlos", city: "Quito", price: 780, available: false },
    "3": { title: "Suite Centro Histórico", city: "Cuenca", price: 430, available: true },
  };

  const prop = properties[id];

  return (
    <MainLayout>
      <View style={styles.card}>
        <Text style={styles.title}>{prop.title}</Text>
        <Text style={styles.text}>Ciudad: {prop.city}</Text>
        <Text style={styles.text}>Precio: ${prop.price}/mes</Text>
        <Text
          style={[
            styles.text,
            prop.available ? styles.disponible : styles.noDisponible,
          ]}
        >
          {prop.available ? "Disponible" : "No disponible"}
        </Text>
      </View>
    </MainLayout>
  );
}

const styles = StyleSheet.create({
  card: {
    backgroundColor: colors.surface,
    padding: spacing.xl,
    borderRadius: 12,
    borderWidth: 1,
    borderColor: "#30363d",
  },
  title: {
    color: colors.primary,
    fontSize: 20,
    marginBottom: spacing.md,
  },
  text: {
    color: colors.text,
    marginBottom: spacing.sm,
    fontSize: 16,
  },
  disponible: {
    color: colors.success,
    fontWeight: "600",
  },
  noDisponible: {
    color: colors.danger,
    fontWeight: "600",
  },
});
