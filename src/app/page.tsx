"use client";

import { env } from "next-runtime-env";

export default function Home() {
  return <pre>{JSON.stringify(env("HOME"), null, 2)}</pre>;
}
