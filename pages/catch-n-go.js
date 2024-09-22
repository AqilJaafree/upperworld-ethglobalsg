import { useState } from 'react'
import Layout from '../components/Layout'
import Button from '../components/Button'
import PokemonCard from '../components/PokemonCard'
import styles from '../styles/CatchNGo.module.css'

export default function CatchNGo() {
  const [pokemon, setPokemon] = useState(null)

  const catchPokemon = () => {
    // Simulate catching a Pokemon
    const newPokemon = {
      name: 'Pikachu',
      stats: {
        strength: Math.floor(Math.random() * 50) + 50,
        speed: Math.floor(Math.random() * 50) + 50,
        health: Math.floor(Math.random() * 100) + 100
      }
    }
    setPokemon(newPokemon)
  }

  return (
    <Layout>
      <h1 className={styles.title}>Catch N Go</h1>
      <div className={styles.catchArea}>
        <Button onClick={catchPokemon}>Catch Pokemon</Button>
        {pokemon && <PokemonCard pokemon={pokemon} />}
      </div>
    </Layout>
  )
}