import React from "react";
import { View, Text, StyleSheet } from "react-native";
import colors from "../../../theme/colors";
import spacing from "../../../theme/spacing";

type Props = {
  title: string;
  available?: boolean;
};

export default function TaskItem({ title, available = false }: Props) {
  return (
    <View style={[styles.card, available && styles.available]}>
      <Text style={styles.title}>{title}</Text>
      <Text
        style={[
          styles.badge,
          available ? styles.badgeAvailable : styles.badgeUnavailable,
        ]}
      >
        {available ? "Disponible" : "No disponible"}
      </Text>
    </View>
  );
}

const styles = StyleSheet.create({
  card: {
    backgroundColor: colors.surface,
    borderRadius: 12,
    padding: spacing.lg,
    marginBottom: spacing.md,
    borderWidth: 1,
    borderColor: "#30363d",
  },
  available: {
    borderColor: colors.success,
  },
  title: {
    color: colors.text,
    fontSize: 16,
    marginBottom: spacing.sm,
  },
  badge: {
    fontSize: 12,
    fontWeight: "600",
  },
  badgeAvailable: {
    color: colors.success,
  },
  badgeUnavailable: {
    color: colors.danger,
  },
});
