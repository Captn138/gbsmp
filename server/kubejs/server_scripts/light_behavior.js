ItemEvents.rightClicked(event => {
  const item = event.item
  if (item.id == 'kubejs:light_block') {
    const player = event.player
    if (!player.level.isClientSide()) {
      // Supprimer le proxy et donner le vrai block de lumière
      player.give(Item.of('minecraft:light'))
      item.count--
    }
    event.cancel() // annule l'action normale
  }
})

