ServerEvents.recipes(event => {
    event.remove({output: 'create:wand_of_symmetry'})
    event.remove({type: 'minecraft:crafting_shapeless', input: 'minecraft:gold_ingot', output: 'minecraft:netherite_ingot'})
})

RecipeViewerEvents.removeEntries('item', event => {
    event.remove('create:wand_of_symmetry')
})
