export default function ServerSidePage() {
  const envServerSide = process.env.SERVER_SIDE_ENV;
  return <div>Server Side Page: {envServerSide}</div>;
}
