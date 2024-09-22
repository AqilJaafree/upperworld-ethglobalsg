import Head from 'next/head'
import styles from '../styles/Home.module.css'
import Button from '../components/Button'
import Layout from '../components/Layout'

export default function Home() {
  return (
    <Layout>
      <Head>
        <title>Upperworld</title>
        <link rel="icon" href="/favicon.ico" />
      </Head>

      <h1 className={styles.title}>Upperworld</h1>

      <div className={styles.grid}>
        <Button href="/connect">Connect</Button>
        <Button href="/catch-n-go">Catch N Go</Button>
        <Button href="/battle">Battle</Button>
        <Button href="/tournament">Tournament</Button>
        <Button href="/collection">Collection</Button>
      </div>
    </Layout>
  )
}