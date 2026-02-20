export type Product = {
  id: string;
  name: string;
  price: number;
  provider: string;
  description: string;
};

export const PRODUCTS: Product[] = [
  { id: "p1", name: "Mouse", price: 12, provider: "Asus", description: "Es un mouse" },
  { id: "p2", name: "Keyboard", price: 25, provider: "Asus", description: "Es un mouse" },
  { id: "p3", name: "Monitor", price: 180, provider: "Asus", description: "Es un mouse" },
  { id: "p4", name: "Laptop Stand", price: 30, provider: "Asus", description: "Es un mouse" },
  { id: "p5", name: "Headset", price: 45, provider: "Asus", description: "Es un mouse" },
];