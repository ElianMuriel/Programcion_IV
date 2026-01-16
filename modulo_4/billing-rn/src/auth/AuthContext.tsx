import React, { createContext, useContext, useEffect, useMemo, useState } from "react";
import type { AuthState, LoginDTO, RegisterDTO, Tokens } from "./auth.types";
import { clearTokens, getTokens, saveTokens } from "./auth.storage";
import { api, setAuthToken } from "../lib/api";

type AuthContextValue = {
  state: AuthState;
  register: (dto: RegisterDTO) => Promise<void>;
  login: (dto: LoginDTO) => Promise<void>;
  logout: () => Promise<void>;
};

const AuthContext = createContext<AuthContextValue | null>(null);

export function AuthProvider({ children }: { children: React.ReactNode }) {
  const [state, setState] = useState<AuthState>({
    isReady: false,
    isAuthed: false,
    tokens: null,
  });

  // Restaurar sesión
  useEffect(() => {
    (async () => {
      const tokens = await getTokens();
      if (tokens?.access) {
        setAuthToken(tokens.access);
        setState({ isReady: true, isAuthed: true, tokens });
      } else {
        setAuthToken(null);
        setState({ isReady: true, isAuthed: false, tokens: null });
      }
    })();
  }, []);

  // Registro
  async function register(dto: RegisterDTO) {
    await api.post("/auth/register", dto);
  }

  // Login
  async function login(dto: LoginDTO) {
    const res = await api.post<Tokens>("/auth/login", dto);
    const tokens = res.data;
    await saveTokens(tokens);
    setAuthToken(tokens.access);
    setState({ isReady: true, isAuthed: true, tokens });
  }

  // Logout
  async function logout() {
    await clearTokens();
    setAuthToken(null);
    setState({ isReady: true, isAuthed: false, tokens: null });
  }

  const value = useMemo(() => ({ state, register, login, logout }), [state]);

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
}

export function useAuth() {
  const ctx = useContext(AuthContext);
  if (!ctx) throw new Error("useAuth debe usarse dentro de <AuthProvider>");
  return ctx;
}