import Link from 'next/link'
import styles from '../styles/Layout.module.css'

export default function Layout({ children }) {
  return (
    <div className={styles.container}>
      <nav className={styles.nav}>
        <Link href="/" className={styles.navLink}>
          Home
        </Link>
      </nav>
      <main className={styles.main}>{children}</main>
    </div>
  )
}