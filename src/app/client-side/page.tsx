"use client";

import { useEffect, useState } from "react";
import api from "@/lib/api";

export default function ClientSidePage() {
  const [envClientSide, setEnvClientSide] = useState<string | null>(null);

  useEffect(() => {
    console.log(api.defaults.baseURL);
    setEnvClientSide(process.env.NEXT_PUBLIC_CLIENT_SIDE_ENV || null);
  }, []);

  return <div>Client Side Page: {envClientSide}</div>;
}
