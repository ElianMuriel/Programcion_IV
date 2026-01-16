export type Tokens = {
  access: string;
  refresh: string;
};

export type RegisterDTO = {
  username: string;
  email: string;
  password: string;
};

export type LoginDTO = {
  username: string;
  password: string;
};

export type AuthState = {
  isReady: boolean;
  isAuthed: boolean;
  tokens: Tokens | null;
};