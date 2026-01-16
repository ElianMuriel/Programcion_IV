import AsyncStorage from "@react-native-async-storage/async-storage";
import type { Tokens } from "./auth.types";

const KEY = "billing.tokens";

export async function saveTokens(tokens: Tokens) {
  await AsyncStorage.setItem(KEY, JSON.stringify(tokens));
}

export async function getTokens(): Promise<Tokens | null> {
  const raw = await AsyncStorage.getItem(KEY);
  if (!raw) return null;
  try { return JSON.parse(raw) as Tokens; } catch { return null; }
}

export async function clearTokens() {
  await AsyncStorage.removeItem(KEY);
}