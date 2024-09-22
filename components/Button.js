import Link from 'next/link'
import styles from '../styles/Button.module.css'

export default function Button({ href, onClick, children }) {
  if (href) {
    return (
      <Link href={href} className={styles.button}>
        {children}
      </Link>
    )
  }
  return (
    <button className={styles.button} onClick={onClick}>
      {children}
    </button>
  )
}