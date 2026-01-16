import { Redirect } from "expo-router";
import { useAuth } from "../src/auth/AuthContext";
import { View, ActivityIndicator } from "react-native";

export default function Index() {
  const { state } = useAuth();

  if (!state.isReady) {
    return (
      <View style={{ flex: 1, alignItems: "center", justifyContent: "center" }}>
        <ActivityIndicator />
      </View>
    );
  }

  return state.isAuthed
    ? <Redirect href="/private/home" />
    : <Redirect href="/public/home" />;
}