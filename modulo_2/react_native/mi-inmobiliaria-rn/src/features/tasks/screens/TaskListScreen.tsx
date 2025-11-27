import React, { useState } from "react";
import { View, TouchableOpacity } from "react-native";
import MainLayout from "../../../layouts/MainLayout";
import TaskItem from "../components/TaskItem";
import colors from "../../../theme/colors";

export default function PropertyListScreen({ navigation }: any) {
  const [properties] = useState([
    { id: "1", title: "Depto Bellavista", city: "Quito", price: 550, available: true },
    { id: "2", title: "Casa San Carlos", city: "Quito", price: 780, available: false },
    { id: "3", title: "Suite Centro Histórico", city: "Cuenca", price: 430, available: true },
  ]);

  return (
    <MainLayout scroll contentStyle={{ backgroundColor: colors.background }}>
      <View style={{ marginBottom: 12 }}>
        {properties.map((p) => (
          <TouchableOpacity
            key={p.id}
            onPress={() => navigation.navigate("TaskDetail", { id: p.id })}
          >
            <TaskItem
              title={`${p.title} - ${p.city} - $${p.price}/mes`}
              available={p.available}
            />
          </TouchableOpacity>
        ))}
      </View>

    </MainLayout>
  );
}
