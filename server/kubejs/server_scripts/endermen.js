ServerEvents.tags('block', event => {
  if (event.id === 'minecraft:blocks/enderman_holdable') {
    event.replace([], true)
  }
})
