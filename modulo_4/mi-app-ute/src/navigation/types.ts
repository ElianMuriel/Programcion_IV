export type RootStackParamList = {
  Home: undefined;
  Products: undefined;
  Details: { id: string; title: string; provider: string; description: string };
  Profile: { userId: string; name: string; lastname: string };
  Settings: undefined;
  LoginForm: undefined;
};