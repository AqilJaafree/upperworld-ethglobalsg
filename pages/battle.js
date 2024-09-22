import { useState } from 'react'
import Layout from '../components/Layout'
import Button from '../components/Button'
import PokemonCard from '../components/PokemonCard'
import styles from '../styles/Battle.module.css'

export default function Battle() {
  const [playerPokemon, setPlayerPokemon] = useState({
    name: 'Pikachu',
    stats: { strength: 70, speed: 80, health: 100 }
  })
  const [opponentPokemon, setOpponentPokemon] = useState({
    name: 'Charmander',
    stats: { strength: 75, speed: 70, health: 100 }
  })

  const attack = () => {
    // Simulate a battle round
    const damage = Math.floor(Math.random() * 20) + 10
    setOpponentPokemon(prev => ({
      ...prev,
      stats: { ...prev.stats, health: Math.max(0, prev.stats.health - damage) }
    }))
  }

  return (
    <Layout>
      <h1 className={styles.title}>Battle</h1>
      <div className={styles.battleArea}>
        <PokemonCard pokemon={playerPokemon} />
        <div className={styles.versus}>VS</div>
        <PokemonCard pokemon={opponentPokemon} />
      </div>
      <Button onClick={attack}>Attack</Button>
    </Layout>
  )
}