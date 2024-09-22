import styles from '../styles/PokemonCard.module.css'

export default function PokemonCard({ pokemon }) {
  return (
    <div className={styles.card}>
      <h2 className={styles.name}>{pokemon.name}</h2>
      <ul className={styles.stats}>
        <li>Strength: {pokemon.stats.strength}</li>
        <li>Speed: {pokemon.stats.speed}</li>
        <li>Health: {pokemon.stats.health}</li>
      </ul>
    </div>
  )
}