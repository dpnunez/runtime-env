import Link from "next/link";

export default function Home() {
  return (
    <div>
      <Link href="/server-side">Server Side</Link>
      <Link href="/client-side">Client Side</Link>
    </div>
  );
}
