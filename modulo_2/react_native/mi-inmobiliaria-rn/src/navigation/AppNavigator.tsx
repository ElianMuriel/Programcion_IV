import React from "react";
import { NavigationContainer } from "@react-navigation/native";
import { createNativeStackNavigator } from "@react-navigation/native-stack";
import { RootStackParamList } from "./types";
import colors from "../theme/colors";
import PropertyDetailScreen from "../features/tasks/screens/TaskDetailScreen";
import PropertyListScreen from "../features/tasks/screens/TaskListScreen";
import HomeScreen from "../screens/HomeScreen";

const Stack = createNativeStackNavigator<RootStackParamList>();

export default function AppNavigator() {
  return (
    <NavigationContainer>
      <Stack.Navigator
        initialRouteName="Home"
        screenOptions={{
          headerStyle: { backgroundColor: "#161b22" },
          headerTintColor: colors.primary,
          contentStyle: { backgroundColor: colors.background },
        }}
      >
        <Stack.Screen
          name="Home"
          component={HomeScreen}
          options={{ title: "Inicio" }}
        />

        <Stack.Screen
          name="TaskList"
          component={PropertyListScreen}
          options={{ title: "Propiedades" }}
        />

        <Stack.Screen
          name="TaskDetail"
          component={PropertyDetailScreen}
          options={{ title: "Detalle de propiedad" }}
        />
      </Stack.Navigator>
    </NavigationContainer>
  );
}
