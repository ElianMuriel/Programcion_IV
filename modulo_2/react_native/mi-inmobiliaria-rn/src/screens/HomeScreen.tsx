import React from "react";
import { View, Text, StyleSheet } from "react-native";
import MainLayout from "../layouts/MainLayout";
import AppButton from "../components/AppButton";
import colors from "../theme/colors";
import spacing from "../theme/spacing";

type Props = {
  navigation: any;
};

export default function HomeScreen({ navigation }: Props) {
  return (
    <MainLayout>
      <View style={styles.container}>
        <Text style={styles.title}>Inmobiliaria InmobiCasita</Text>
        <Text style={styles.subtitle}>
          Encuentra tu próximo hogar desde una sola app
        </Text>

        <View style={styles.card}>
          <Text style={styles.cardTitle}>Explorar propiedades</Text>
          <Text style={styles.cardText}>
            Revisa el listado de casas, departamentos y suites disponibles.
          </Text>

          <AppButton
            label="Ver propiedades"
            onPress={() => navigation.navigate("TaskList")}
          />
        </View>
      </View>
    </MainLayout>
  );
}

const styles = StyleSheet.create({
  container: {
    padding: spacing.lg,
  },
  title: {
    color: colors.primary,
    fontSize: 24,
    fontWeight: "bold",
    marginBottom: spacing.sm,
  },
  subtitle: {
    color: colors.subtle,
    fontSize: 14,
    marginBottom: spacing.xl,
  },
  card: {
    backgroundColor: colors.surface,
    padding: spacing.lg,
    borderRadius: 12,
    borderWidth: 1,
    borderColor: "#30363d",
  },
  cardTitle: {
    color: colors.text,
    fontSize: 18,
    fontWeight: "600",
    marginBottom: spacing.sm,
  },
  cardText: {
    color: colors.subtle,
    fontSize: 14,
    marginBottom: spacing.lg,
  },
});
